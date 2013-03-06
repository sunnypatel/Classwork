start: clean compile

compile:
	gcc -g -o conncFour conncFour.c csapp.c -lpthread -lm
	chmod +x conncFour

run: compile
	./conncFour

testrun: compile-test
	./test

compile-test:
	gcc -g -o test test.c csapp.c -lpthread -lm
	chmod +x test

clean:
	rm -f conncFour *.out *.o

