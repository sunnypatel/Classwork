/* Lab 1; Part 1 */

#include <stdio.h>
#include <stdlib.h>

// data struct defining the linked list
struct list_struct{
	int val;
	struct list_struct *next;
};

// will point the first element
struct list_struct *head = NULL;
struct list_struct *curr = NULL;

// creates a new linked list
struct list_struct* create_list(int val){
	printf("\ncreating new list w/ first node val= %d\n",val);
	
	struct list_struct *ptr = (struct list_struct*)malloc(sizeof(struct list_struct));

	// creates the first node
	ptr->val = val;
	ptr->next = NULL;
	// sets the first and last ptrs to the same single node	
	head = curr = ptr;
	return ptr;
};

struct list_struct* list_insert(int val){

	// if a linked list does not exist create one
	if(NULL == head){
		return(create_list(val));
	}
	struct list_struct *ptr = (struct list_struct*)malloc(sizeof(struct list_struct));

	// insert element to beginning of list
	ptr->val = val;
	ptr->next = head;
	head = ptr;

	return ptr;
};

// sort using bubble sort algorithm
struct list_struct* sort(){
	
	int count=0;
	struct list_struct *ptr = head;
	// count nodes
	while(ptr->next != NULL) { 
	    ptr = ptr->next;
	    count++;
	}
	printf("Final node count: %d",count);
	
	//being bubble sort
	int j, z;

	for(j = count; j>=0; j--){
	    for(z=1;z<=j;z++){
		// swap if node is greater than nxt node	
		if( ptr->val > ptr->next->val ){
		    // temp node
		    struct list_struct *t = (struct list_struct*)malloc(sizeof(struct list_struct));
		    t = ptr;
		    ptr = ptr->next;
		    t->next = ptr;	
		} 
	    }
	}
	
};

// Prints out the entire linked list started with head
void print_list(void){
	struct list_struct *ptr = head;
	while(ptr != NULL) {
		printf("\n [%d] \n", ptr->val);
		ptr = ptr->next;
	}
	printf("Done loop");
	return;

}
int main (void)
{
	printf("--------------------\n");
	printf("   STARTING PART 4  \n");
	printf("--------------------\n");

	int i =3, ret = 0;
	struct list_struct *ptr = NULL;

	print_list();

	list_insert(i);
	list_insert(32);
	list_insert(4);
	list_insert(8);

	// print the list before sorting
	print_list();
	// sort the list using bubble sort
	sort();
	// print the list after sorting
        print_list();
	 
	printf("--------------------\n");
        printf("     END  PART 4    \n");
        printf("--------------------\n");


	return 0;
}
