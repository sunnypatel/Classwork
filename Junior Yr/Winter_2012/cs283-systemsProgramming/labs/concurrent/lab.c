#include "csapp.h"

// struct to pass args to thread 
typedef struct{
	int *a;
	pthread_mutex_t *mutex;
} args;

/* Thread function to add 1 to &count 1000 times each */
void *thread(void *arg){
	int *a = ((args*)arg)->a;
	int i;
	// being looping
	for(i=0; i < 1000; i++) {
		(*a)++;
	}
	pthread_exit(0);
}

int main(){
	// init clock vars
	clock_t begin, end;
	double time_spent;
	// saved time program started
	begin = clock();

	// shared var to be summed
	int count = 0;	
	int numOfThreads = 1000;
	// create a list of thread ids 
	pthread_t tid[numOfThreads];
	// create mutex lock
	pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;	
	// prepare thread args
	args args1;	
	args1.a = &count;
	args1.mutex = &mutex;

	int threadCount = 0;
	// loop to create the threads
	for(threadCount = 0; threadCount < numOfThreads; threadCount++){
		Pthread_create(&tid[threadCount], NULL, thread, &args1);
	}

	// loop to join the threads to main, prevents main from exiting until all the 
	// threads are finished executing
	int joinCount;
	for(joinCount = 0; joinCount < threadCount; joinCount++){
		Pthread_join(tid[joinCount],NULL);	
	}


	// work finished, get clock time
	end = clock();
	// calculate how much time was spent
	time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
	printf("*********************\n");
	printf("*     No Locks      *\n");
	printf("*********************\n");

	printf("Threads created: %d\n", threadCount);   
	printf("count= %d\n",count);
	printf("Time = %f\n",time_spent);
	// exit main thread
	pthread_exit(0);
}
