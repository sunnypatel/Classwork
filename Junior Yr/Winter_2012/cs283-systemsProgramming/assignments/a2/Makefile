all: renamer

renamer: clean csapp.o
	gcc -o rename.o renamer.h renamer.c csapp.o
	./rename.o $(TEST1) $(TEST2)

csapp.o:
	gcc -c csapp.c

clean:
	rm -rf rename.o 
