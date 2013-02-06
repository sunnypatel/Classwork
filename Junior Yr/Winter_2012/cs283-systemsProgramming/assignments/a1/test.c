#include < stdio.h>
#include < stdlib.h>

#define HASHSIZE    1000
#define MAXLINE     1024

typedef struct tnode {
 char *data;
 struct tnode *next;
} node;

void htable_init(node *hashtable);                        // fire up hashtable
void htable_insert(node *hashtable, char *str);           // insert data into hashtable
void htable_resolve(node *hashtable, int loc, char *str); // resolve collisions in hashtable
void htable_display(node *hashtable);                     // display hashtable
int  htable_delete(node *hashtable, char *str);           // delete an entry from hashtable
int  htable_hash(char *str);                              // hash data for hashtable

int main(void) {
 char line[MAXLINE];
 node *hashtable;

 hashtable = (node *)malloc(HASHSIZE * sizeof(node));

 htable_init(hashtable);

 while((fgets(line, MAXLINE, stdin)) != NULL)
  htable_insert(hashtable, line);

 htable_display(hashtable);

 return 0;
}

/* fire up hashtable */
void htable_init(node *hashtable) {
 int i = 0;

 for(i = 0; i < HASHSIZE; i++)
  hashtable[i].data = NULL, hashtable[i].next = NULL;
}

/* insert data into hashtable */
void htable_insert(node *hashtable, char *str) {
 int index = 0;
  
 /* 
 // determine hash function 
 */
 index = htable_hash(str);
 if(hashtable[index].data != NULL) {
  /*
  // collision occurs - resolve by chaining
  */
  htable_resolve(hashtable, index, str);
 } else {
  hashtable[index].data = calloc(strlen(str) + 1, sizeof(char));
  strcpy(hashtable[index].data, str);
 }
}

/* hash data for hashtable */
int htable_hash(char *str) {

   int i, size, result = 0;
    size = sizeof(word);

    printf("Word size: %d\n", size);
    // start counting letter values
    for(i=0; i<size; i++){
        // test if capital
        if(word[i] > 64 && word[i] < 91){
            // letter is capital
        result = result + (word[i] - 64);
        } else if(word[i] > 96 && word[i] < 123){
            // letter is lowercase
            result = result + (word[i] - 96);
        } else {}
    }

    printf("Hash result = %d \n",result);
    return result;


}

/* resolve collisions in hashtable */
void htable_resolve(node *hashtable, int loc, char *str) {
 node *tmp;
 tmp = hashtable + loc;

 while(tmp->next != NULL)
  tmp = tmp->next;
  tmp->next = (node *)malloc(sizeof(node));
  tmp->next->data = calloc(strlen(str) + 1, sizeof(char));
  strcpy(tmp->next->data, str);
  tmp->next->next = NULL;
}

/* display hashtable */
void htable_display(node *hashtable) {
 int i = 0;
 node *target;

 for(i = 0; i < HASHSIZE; i++) {
  if(hashtable[i].data != NULL) {
   target = hashtable + i;
   while(target) 
    /* printf("location: %d, data: %s", i, target->data), target = target->next; */
    printf("%s", target->data), target = target->next;
  } /* if */
 } /* for */
}

/* delete an entry from hashtable */
int htable_delete(node *hashtable, char *str) {
 node *bla;
 node *blb;
 char *tmp = NULL;
 int index = 0;

 index = htable_hash(str);

 /* no item at this location */
 if(hashtable[index].data == NULL)
  return 1;

 /* only one item at this location */
 if(hashtable[index].next == NULL) {
  if(strcmp(hashtable[index].data, str) == 0) {
   /* item found */
   tmp = hashtable[index].data;
   hashtable[index].data = NULL;
   free(tmp);
  }
 } else {
  /* there is a chaining case */
  bla = hashtable + index;
  /* linked list similar */
  while(bla->next != NULL) {
   if(strcmp(bla->next->data, str) == 0) {
    blb = bla->next;
    if(bla->next->next)
     bla->next = bla->next->next;
    else
     bla->next = NULL;

    free(blb);
   } /* if */
  } /* while */
 } /* else */

 return 0;
}

Read more: http://cmagical.blogspot.com/2010/01/c-data-structures-source-codesbasic_2541.html#ixzz2IeSnFsFZ 
Under Creative Commons License: Attribution Non-Commercial No Derivatives
