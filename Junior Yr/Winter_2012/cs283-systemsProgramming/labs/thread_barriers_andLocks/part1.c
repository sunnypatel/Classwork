#include "csapp.h"

// Define the linked list node
struct node{
	int data;
	struct node *prev;
	struct node *next;
};

// insert a node after the node given
struct node *insert(struct node *prevNode, int data);
// remove this node from list
void delete(struct node *node);
// print list from starting node
void printList(struct node *start);


/** Thread definitions **/

void *insert_thread(void *arg){
	int newData = ((struct node*)arg)->data + 1;
	// insert a new node at the end of list
	arg =	insert(((struct node*)arg), newData);

	printf("new node created %d\n", newData);
	printf("new node data %d\n", ((struct node*)arg)->data);
	pthread_exit(0);
}

void *delete_thread(void *arg){
}





int main(){

	int numOfThreads = 10000;

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

	// init. thread ids
	pthread_t tid[numOfThreads];
	int threadCount = 0;
	// create x number of threads
	for(threadCount = 0; threadCount < numOfThreads; threadCount++){
		Pthread_create(&tid[threadCount], NULL, insert_thread, listp);
	}

	printList(root);
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
		printf("   {node %d}.data = %d\n", i++, tmp->data);
		tmp = tmp->next;
	}
	printf("+-----------------------------------+\n");
}
