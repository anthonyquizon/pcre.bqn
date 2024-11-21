#include <stdio.h>
#include <pcre.h>
#include <string.h>
#include <bqnffi.h>

#define OVECCOUNT 30    /* should be a multiple of 3 */
#define BUFFER 1024    

BQNV match(const char* regex, const char* src) {
    BQNV vals[BUFFER];
    int erroffset, ovector[OVECCOUNT]={0}, rc, i=0;
    const char *error;

    pcre* re = pcre_compile(regex, 0, &error, &erroffset, NULL);

    if (re == NULL) {
        fprintf(stderr, "PCRE compilation failed at offset %d: %s\n", erroffset, error);
        return bqn_makeF64(-1);
    }

    while ((rc = pcre_exec(re, NULL, src, strlen(src), ovector[1], 0, ovector, OVECCOUNT)) >= 0) { 
        const char *s;

        if(rc < -1) {
            fprintf(stderr,"error %d from regex\n",rc);
            break;
        }

        if (pcre_get_substring(src, ovector, rc, 0, &s) >= 0) {
            BQNV val[3];
            val[0] = bqn_makeC8Vec(strlen(s), (uint8_t*)s);
            val[1] = bqn_makeF64((double)ovector[0]);
            val[2] = bqn_makeF64((double)ovector[1]);
            vals[i]=bqn_makeObjVec(3, val);
            
            pcre_free_substring(s);
            i++;
        }

        if (i>BUFFER) {
            fprintf(stderr, "Match buffer filled %d", i);
            break;
        }
    }

    pcre_free(re);
            
    return bqn_makeObjVec(i, vals);
}

