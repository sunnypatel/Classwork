#include "csapp.h"
#include "barrier.c"

void *thread(void *arg){

	barrier *b1 = ((barrier*)arg);
	while(barrier_wait(b1) != -1){
		printf("waiting\n...");
		usleep(1000000 * 5); // sleep for 5 sec	
	}
	printf("passed\n");

	pthread_exit(0);
}


int main(){
	int numOfThreads = 10;
	int barrier_count = 5;
	int threadCount, joinCount = 0;

	// initialize barrier
	barrier *b1;
	b1 = Malloc(sizeof(barrier));
	int err = barrier_init(b1, barrier_count);
	if (err != 0){
		printf("Error creating barrier!\n");
		return 1;
	}

	pthread_t tid[numOfThreads];
  // create x number of threads
  for(threadCount = 0; threadCount < numOfThreads; threadCount++){
    Pthread_create(&tid[threadCount], NULL, thread, b1);
  }

  // loop to join the threads to main, prevents main from exiting until all the 
  // threads are finished executing
  for(joinCount = 0; joinCount < threadCount; joinCount++){
    Pthread_join(tid[joinCount],NULL);
  }
	

	pthread_exit(0);
}
