start: clean run-part1
#start: clean run-all

compile-all: compile-part1 compile-part2 compile-part3

run-all: compile-all
	./part1
	./part2
	./part3

run-part1: compile-part1
	./part1

run-part2: compile-part2
	./part2

run-part3: compile-part3
	./part3

compile-part1:
	gcc -g -o part1 part1.c csapp.c -lpthread
	chmod +x ./part1

compile-part2:
	gcc -g -o part2 part2.c csapp.c -lpthread
	chmod +x ./part2

compile-part3: 
	gcc -g -o part3 part3.c csapp.c -lpthread
	chmod +x ./part3

submit-tar:
	tar -zcvf submit.tar.gz *.h *.c readme ans.txt Makefile

clean:
	rm -f *.o *.out part[123] submit.tar.gz
