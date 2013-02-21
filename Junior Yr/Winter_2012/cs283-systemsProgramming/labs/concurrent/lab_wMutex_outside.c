#include "csapp.h"

typedef struct{
	int *a;
	pthread_mutex_t *mutex;
} args;

void *thread(void *arg){
	int *a = ((args*)arg)->a;
	pthread_mutex_t *mutex = ((args*)arg)->mutex;
	int i;
	// mutex lock here
	pthread_mutex_lock(mutex);
	// being looping
	for(i=0; i < 1000; i++) {
		(*a)++;
	}
	// remove lock
	pthread_mutex_unlock(mutex);
	pthread_exit(0);
}

int main(){
	clock_t begin, end;
	double time_spent;
	begin = clock();

	// shared var to be summed
	int count = 0;	
	int numOfThreads = 1000;

	pthread_t tid[numOfThreads];
	// prepare thread args
	pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;	

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


	end = clock();
	time_spent = (double)(end - begin) / CLOCKS_PER_SEC;

	printf("*********************\n");
	printf("* Lock Outside for  *\n");
	printf("*********************\n");

	printf("Threads created: %d\n", threadCount);   
	printf("count= %d\n",count);
	printf("Time = %f\n",time_spent);

	pthread_exit(0);
}
