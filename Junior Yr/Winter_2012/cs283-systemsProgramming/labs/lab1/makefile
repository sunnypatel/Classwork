all: start

start: clean p1 p2 p3 p4
p1: clean
	gcc -o p1.o p1.c 
	./p1.o

p2: clean
	gcc -o p2.o p2.c
	./p2.o

p3: clean
	gcc -o p3.o p3.c
	./p3.o
p4: clean
	gcc -o p4.o p4.c
	./p4.o

clean:
	rm -rf *.o *.out
