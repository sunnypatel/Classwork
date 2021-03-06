#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

#define HASHSIZE 100000 

typedef struct node{

	char* data;
	struct node *next;

} node;

int hash(char *word);
void htable_init(node *hashtable);
int htable_insert(node *hashtable, char *word);
void htable_resolve(node *hashtable, int loc, char *word);
void htable_display(node *hashtable);
int htable_delete(node *hashtable, char *word);
int lookup(node *hashtable, char *word);
int checkAnagram(char *word, char *sample);

int main(void) {
	
	
	FILE* dict = fopen("/usr/share/dict/words", "r"); // open the dictionary for read-only access

    if(dict == NULL) {
        return;
    }

	node *hashtable;
    char word[128];

	// init hash table
	hashtable = (node *)malloc(HASHSIZE * sizeof(node));
	htable_init(hashtable);

	int i,count,cols,test =0;
    while(fgets(word, sizeof(word), dict) != NULL) {
		test = htable_insert(hashtable,word);
		if(test == 1)
			cols++;		
		count++;
    }
	printf("Read %d words\n",count);
	printf("Collisions: %d \n",cols);
	printf("Start\n");
	htable_display(hashtable);	
	//lookup(hashtable,"act");
	printf("Done\n");	
}

/* fire up hashtable */
void htable_init(node *hashtable) {
	int i = 0;

	for(i = 0; i < HASHSIZE; i++)
		hashtable[i].data = NULL, hashtable[i].next = NULL;
}


/* insert data into the table */
int htable_insert(node *hashtable, char *word) {
	int index=0;
	int count,cols = 0;
	// eval the hash index value
	index = hash(word);
	if(hashtable[index].data != NULL){
		// there is a collision, fix 
		htable_resolve(hashtable,index, word);
		cols = 1;
	//	count = count + 1;
	} else { // no collision
		hashtable[index].data = calloc(strlen(word)+1,sizeof(char));
		strcpy(hashtable[index].data, word);
	//	count++;
	
	}
	return cols;	
}

/* conflict/collision resolver */
void htable_resolve(node *hashtable, int loc, char *word) {
	node *tmp;
	tmp = hashtable + loc;

	// shift the linked list make room for the new word
	while(tmp->next != NULL) {
		tmp = tmp->next;
		tmp->next = (node *)malloc(sizeof(node));
//		tmp->next->data = calloc(strlen(word) + 1, sizeof(char));
//		strcpy(tmp->next->data, word);
		tmp->next->data = word;
		tmp->next->next = NULL;
	}
}
	
int lookup(node *hashtable, char *word){

    // get hash index
    int index = hash(word);
	
	node tmp;
	tmp = hashtable[index];
	//printf("tmp=%s\n",tmp->next.data);
	// print anagrams
/*	while(tmp.next != NULL){
		//if(checkAnagram(word, tmp->data)){
			printf("Anagram found: %s \n", tmp->data);
		//}
		tmp = tmp.next;
	}
*/	

}
// check if sample is actually an anagram of the word
int checkAnagram(char *word, char *sample){
	int i,size = 0;
	size = sizeof(word);

	int char_list[26] = { 0 };
	int char_list2[26] = { 0 };
	// start tracking how many letters word has, then compare 
	// results to how many of each letter sample word has
	for(i=0; i<size; i++){
		// test if letter is cap.
        if(word[i] > 64 && word[i] < 91){
            // letter is capital
        	char_list[word[i] - 64] = char_list[word[i] - 64] + 1;
        } else if(word[i] > 95 && word[i] < 123){
            // letter is lowercase
            char_list[word[i] - 95] = char_list[word[i] - 95] + 1;
        } else {}

	}
		
	// count how many of each letter sample has
    for(i=0; i<size; i++){
        // test if letter is cap.
        if(sample[i] > 64 && sample[i] < 91){
            // letter is capital
            char_list2[sample[i] - 64] = char_list2[sample[i] - 64] + 1;
        } else if(sample[i] > 95 && sample[i] < 123){
            // letter is lowercase
            char_list2[sample[i] - 95] = char_list2[sample[i] - 95] + 1;
        } else {}
    }

	// compare
	if(sizeof(char_list) == sizeof(char_list2))	
		return 1;
	else 
		return 0;
}

/* display hashtable */
void htable_display(node *hashtable) {
	int i = 0;
	node *target;
	int forc, whilec = 0;
	for(i = 0; i < HASHSIZE; i++) {
		forc++;
		if(hashtable[i].data != NULL) {
	//		printf("data=%s",hashtable[i].data);
			target = hashtable + i;
			while(target) {
				whilec++;
				printf("location: %d, data: %s , whilec: %d \n", i, target->data, whilec);
				target = target->next;
			
			}
		} /* if */
	} /* for */
	printf("for = %d \n",forc);
	printf("while = %d \n",whilec);
}

// return the hash number for each word based on letters 
// in the word
int hash(char *word){
	int i, size, result = 0;
	size = sizeof(word);	

	// start counting letter values
	for(i=0; i<size; i++){
		// test if capital
		if(word[i] > 64 && word[i] < 91){
			// letter is capital
		result = result + pow(2,((word[i] - 64) - 1));
		} else if(word[i] > 95 && word[i] < 123){
			// letter is lowercase
			result = result + pow(2,((word[i] - 95) - 1));
		} else {}
	}

//	printf("Hash result = %d \n",result);
	return result;
}
