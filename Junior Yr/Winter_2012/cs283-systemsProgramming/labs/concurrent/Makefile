start: clean compile-all

compile-all: lock_outside lock_inside nolock

run-all: compile-all
	./nolock
	./lock_outside
	./lock_inside

run-lock_outside: lock_outside
	./lock_outside
run-lock_inside: lock_inside
	./lock_inside

run-no_lock: nolock
	./nolock

lock_inside:
	gcc -g -o lock_inside lab_wMutex_inside.c csapp.c -lpthread
	chmod +x ./lock_inside

lock_outside:
	gcc -g -o lock_outside lab_wMutex_outside.c csapp.c -lpthread
	chmod +x ./lock_outside

nolock: 
	gcc -g -o nolock lab.c csapp.c -lpthread
	chmod +x ./nolock

submit-tar:
	tar -zcvf submit.tar.gz *.h *.c readme stats.txt Makefile

clean:
	rm -f *.o *.out lock_inside lock_outside nolock submit.tar.gz
