lib.so:src/lib.c
	$(CC) -lpcre -lcbqn -shared src/lib.c -o src/lib.so
