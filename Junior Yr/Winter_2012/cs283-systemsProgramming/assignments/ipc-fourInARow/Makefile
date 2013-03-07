start: clean compile

compile:
	gcc -g -o conncFour conncFour.c csapp.c -lpthread -lm
	chmod +x conncFour

run: compile
	./conncFour

submit: clean
	tar -zcvf submit.tar.gz *

clean:
	rm -f conncFour *.out *.o submit.tar.gz

