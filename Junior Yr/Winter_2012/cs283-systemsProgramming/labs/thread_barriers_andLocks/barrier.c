#include <pthread.h>
#include "error.h"

typedef struct{
	pthread_mutex_t mutex;	// Control access to barrier
	pthread_cond_t	cv;			// condition var
	int threshold;					// number of threads to pool before unlocking
	int counter;						// current number of threads
	int	cycle;							// wait cycles
} barrier;

int barrier_init(barrier *b1, int count);
int barrier_destory(barrier *b1);
int barrier_wait(barrier *b1);


// Initialize the barrier
int barrier_init(barrier *b1, int count){
	// set counter and threshold
	b1->threshold = count;
	b1->counter = count;

	b1->cycle = 0;
	// init a pthread mutex
	int stat = pthread_mutex_init (&b1->mutex, NULL);
	if (stat != 0)
		return stat; // mutex init unsucessful
	
	// initilize condition variable
	stat = pthread_cond_init(&b1->cv, NULL);
	// error creating pthread cond. var.
	if(stat != 0)
		return stat; // init. cond. var. unsuccessful

	// sucessful!
	return 0;
}

/*
 * Wait for threads to reach barrier stage
 * the count (of remaining members) reaches 0, broadcast to wake
 * all threads waiting.
 */
int barrier_wait (barrier *b1)
{
    int status, cancel, tmp, cycle = 0;

    pthread_mutex_lock (&b1->mutex);

    cycle = b1->cycle;   /* Remember which cycle we're on */

		
    if ( (--b1->counter) == 0) {
        b1->cycle = !b1->cycle;
        b1->counter = b1->threshold;
        status = pthread_cond_broadcast (&b1->cv);
        /*
					 Return -1 to indicate pool is full and threads are now 
					 allowed to continue execution.
         */
        if (status == 0)
            status = -1;
    } else {
        
				/*
         * Wait with cancellation disabled, because barrier_wait
         * should not be a cancellation point.
         */
        pthread_setcancelstate (PTHREAD_CANCEL_DISABLE, &cancel);

        /*
         * Wait until the barrier's cycle changes, which means
         * that it has been broadcast, and we don't want to wait
         * anymore.
         */
        while (cycle == b1->cycle) {
            status = pthread_cond_wait (
                    &b1->cv, &b1->mutex);
            if (status != 0) break;
        }

        pthread_setcancelstate (cancel, &tmp);
    }
    
		pthread_mutex_unlock (&b1->mutex);
    return status;          /* error, -1 for waker, or 0 */
}

int barrier_destroy(barrier *b1){
	pthread_mutex_lock(&b1->mutex);

	// are there threads in waiting pool
	if(b1->counter != b1->threshold){
		pthread_mutex_unlock (&b1->mutex);
		return -1;
	}
	
	int status = pthread_mutex_unlock(&b1->mutex);
	if (status != 0)
			return status;

	int status1 = pthread_mutex_destroy (&b1->mutex);
	int status2 = pthread_cond_destroy (&b1->cv);
	return (status == 0 ? status1 : status2);
}
