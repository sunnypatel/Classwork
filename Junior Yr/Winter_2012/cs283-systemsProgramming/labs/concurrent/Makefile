start: clean

lock_outside:
	gcc -g -o lock_inside lab_wMutex_inside.c csapp.c -lpthread
	./lock_inside

lock_outside:
	gcc -g -o lock_outside lab_wMutex_outside.c csapp.c -lpthread
	./lock_outside	

nolock: 
	gcc -g -o nolock lab.c csapp.c -lpthread
	./nolock
clean:
	rm -r *.o *.out
