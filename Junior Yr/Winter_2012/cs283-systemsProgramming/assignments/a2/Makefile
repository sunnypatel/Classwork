CC = gcc
CFLAGS = -02 -Wall -I .

# This flag includes the Pthreads library on a Linux box.
# Others systems will probably require something different
LIB = -lpthread

all: renamer

renamer: renamer.c csapp.o
	$(CC) $(CFLAGS) -o renamer renamer.c csapp.o $(LIB)
	./renamer $(TEST1) $(TEST2)

csapp.o:
	$(CC) $(CFLAGS) -o csapp.c

cgi:
	(cd cgi-bin; make)

clean:
	rm -f *.o renamer *~
	(cd cgi-bin; make clean)
