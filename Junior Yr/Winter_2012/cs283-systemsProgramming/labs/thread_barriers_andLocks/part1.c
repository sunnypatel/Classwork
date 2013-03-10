#include "csapp.h"

// Define the linked list node
struct node{
	int data;
	struct node *prev;
	struct node *next;

};

void *thread(void *arg){

}

// insert a node after the node given
struct node *insert(struct node *prevNode, int data);
// remove this node from list
void delete(struct node *node);
// print list from starting node
void printList(struct node *start);

int main(){
	int d = 1;
	struct node *root;
	root = Malloc(sizeof(struct node));
	// creates a new first node
	struct node *listp;
	// allocates room for first node
	listp = root;

	// create linked list
	int i;
	for(i=0; i<10; i++){
		listp = insert(listp,i);
	}	

	printList(root);

	
	printf("*** Deletion ***\n");
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
	while(tmp->next != NULL){
		printf("{node %d}.data = %d\n", i++, tmp->data);
		tmp = tmp->next;
		
	}
}
