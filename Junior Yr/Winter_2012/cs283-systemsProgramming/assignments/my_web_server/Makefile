start: clean compile

compile:
	gcc -g -o webserver webserver.c csapp.c -lpthread -lm
	chmod +x webserver

run: compile
	./webserver 6549

clean:
	rm -f webserver *.out *.o

