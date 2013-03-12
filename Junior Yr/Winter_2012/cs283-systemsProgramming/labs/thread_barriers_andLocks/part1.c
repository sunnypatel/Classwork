#include "csapp.h"

// Define the linked list node
struct node{
	int data;
	struct node *prev;
	struct node *next;
};

typedef struct{
	struct node *node;
	pthread_mutex_t *mutex;
} args;

// insert a node after the node given
struct node *insert(struct node *prevNode, int data);
struct node *insert_end(struct node *node, int data);
// remove this node from list
void delete(struct node *node);
// print list from starting node
void printList(struct node *start);
// print node count
void printNodeCount(struct node *start);
// print node
void printNode(struct node *node);


/** Thread definitions **/

void *insert_thread(void *arg){

	struct node *tmp = ((args*)arg)->node;
	pthread_mutex_t *mutex = ((args*)arg)->mutex;


	int newData = rand() % 100;

	// insert a new node at the end of list
	int i;


	for(i=0; i<100; i++){

		tmp = insert( tmp, newData );

	}

	pthread_exit(0);
}

void *insert_thread_lock(void *arg){

	struct node *tmp = ((args*)arg)->node;
	pthread_mutex_t *mutex = ((args*)arg)->mutex;


	int newData = rand() % 100;

	// insert a new node at the end of list
	int i;

	pthread_mutex_lock(mutex);

	for(i=0; i<100; i++){

		tmp = insert( tmp, newData );

	}
	pthread_mutex_unlock(mutex);

	pthread_exit(0);
}


void *delete_thread(void *arg){

	struct node *tmp = ((args*)arg)->node;
	pthread_mutex_t *mutex = ((args*)arg)->mutex;

	pthread_mutex_lock(mutex);
	delete(tmp);	
	pthread_mutex_unlock(mutex);
	pthread_exit(0);
}





int main(){

	int numOfThreads = 1000;
	pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;


	struct node *root;
	root = Malloc(sizeof(struct node));
	// creates a new first node
	struct node *listp;
	// allocates room for first node
	listp = root;

	printf("\nCreating a linked list (single thread)\n");
	// create linked list
	int i;
	for(i=1; i<10; i++){
		listp = insert(listp,i);
	}

	printList(root);


	printf("\nDeleting second to last node (single thread)\n");
	// delete 2nd to last node	
	delete(listp->prev);

	printList(root);


	/** STARTING MULTI-THREADED INSERTION AND DELETETION **/

	printf("Adding %d threads to insert into one hundred nodes into linked list\n starting from the last node\n\n", numOfThreads);

	args arg;
	arg.node = root;
	arg.mutex = &mutex;

	// init. thread ids
	pthread_t tid[numOfThreads];
	int threadCount = 0;
	// create x number of threads
	for(threadCount = 0; threadCount < numOfThreads; threadCount++){
		Pthread_create(&tid[threadCount], NULL, insert_thread, &arg);
	}

	// loop to join the threads to main, prevents main from exiting until all the 
	// threads are finished executing
	int joinCount;
	for(joinCount = 0; joinCount < threadCount; joinCount++){
		Pthread_join(tid[joinCount],NULL);
	}


	//	printList(root);
	printNodeCount(root);
	printf("Total nodes should be %d.\n", (100*numOfThreads) + 9);
	printf("Sometimes this is correct, other runs it's inaccurate\n");

	/* ****************************************************** 
		 Threads with locks
	 ******************************************************
	 */

	printf("******************************************************\n");
	printf("                  Threads with locks                  \n");
	printf("******************************************************\n");
	
	// count how many nodes are there before doing locks
  int count= 1;
  listp = root;
  while(listp->next != NULL){
    listp = listp->next;
    count++;
  }


	pthread_t tid2[numOfThreads];
	for(threadCount = 0; threadCount < numOfThreads; threadCount++){
		Pthread_create(&tid2[threadCount], NULL, insert_thread_lock, &arg);
	}

	// loop to join the threads to main, prevents main from exiting until all the 
	// threads are finished executing
	for(joinCount = 0; joinCount < threadCount; joinCount++){
		Pthread_join(tid2[joinCount],NULL);
	}
	
	printNodeCount(root);	
	printf("Total nodes should be %d.\n",(numOfThreads * 100) + count);
	printf("Should always be 100 percent accurate\n\n");	
	pthread_exit(0);

}


struct node *insert_end(struct node *node, int data){

	while (node->next != NULL){
		node = node->next;
		printf("%p\n",node->next);
	}

	struct node *tmp;
	tmp = Malloc(sizeof(struct node));
	tmp->data = data;
	tmp->prev = node;
	tmp->next = NULL;
	node->next = tmp;
	return tmp;
}


// creates a  new node and inserts it after the
// prevNode
struct node *insert(struct node *prevNode, int data){

	struct node *tmp;
	// make room for the new node
	tmp = Malloc(sizeof(struct node));

	tmp->data = data;
	// set this node's prev to be prevNode
	tmp->prev = prevNode;
	// set this node's next ptr to prevNode's next ptr
	tmp->next = prevNode->next;
	// set prevNode's next ptr to point to new node 
	prevNode->next = tmp;


	return tmp;
}

void delete(struct node *node){
	// set the node before this node to point to next node
	node->prev->next = node->next;
}

// print out list from starting node 
void printList(struct node *start){
	struct node *tmp;
	tmp = start;
	int i =0;
	printf("\n+-----------------------------------+\n");
	printf("            Printing list           \n");
	printf("+-----------------------------------+\n");
	while(tmp != NULL){
		printf("   {node %d}.data = %d    | 	location: %p, next: %p \n", i++, tmp->data, tmp, tmp->next);
		tmp = tmp->next;
	}
	printf("+-----------------------------------+\n");
}


void printNodeCount(struct node *start){
	struct node *tmp;
	tmp = start;
	int i =0;
	while(tmp != NULL){
		tmp = tmp->next;
		i++;
	}
	printf("Total nodes: %d\n",i);
}	
