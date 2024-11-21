lib.so:lib.c
	$(CC) -lpcre -lcbqn -shared lib.c -o lib.so
