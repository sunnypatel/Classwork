/* Lab 1; Part 1 */

#include <stdio.h>
#include <stdlib.h>

int main (void)
{
	printf("--------------------\n");
	printf("   STARTING PART 2  \n");
	printf("--------------------\n");

	// create a pointer of type char
	char **ptr;
	// allocate 10 chars and set the first mem block to point to char ptr
	ptr = malloc( 10*sizeof(**ptr));

	// begin allocation of  char of size 15 into char array[10] 	
	int i;
	for (i=0; i<10; i++)
	{
	    ptr[i] = malloc(15*sizeof(char));
	}

	// insert test words into char array
	ptr[0] = "word";
	ptr[1] = "word1";
	ptr[2] = "word2";
	ptr[3] = "word3";
	ptr[4] = "wprd4";
	ptr[5] = "word5";
	ptr[6] = "word6";
	ptr[7] = "word7";
	ptr[8] = "word8";
	ptr[9] = "word9";

	// print out inserted words	
	int j;
	for(j=0;j<10;j++){
	    printf("ptr[%d] = %s\n",j,ptr[j]);
	}

        printf("--------------------\n");
        printf("     END  PART 2    \n");
        printf("--------------------\n");


	return 0;
}
