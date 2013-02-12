/* Lab 1; Part 1 */

#include <stdio.h>
#include <stdlib.h>

int main (void)
{
        printf("--------------------\n");
        printf("   STARTING PART 1  \n");
        printf("--------------------\n");

	// mem allocate 10 int. blocks consecutively [array format]
	int *ptr;
	ptr = malloc( 10*sizeof(*ptr));

	// insert into the int array integers counting down from 10	
	int i;
	for (i=0; i<10; i++)
	{
	    ptr[i] = 10 - i;
	}

	// print out the ints 
	int j;
	for (j =0; j<10;j++){
	    printf("[%d] = %d\n",j,ptr[j]);
	}
	
	// free mem alloc
	free(ptr);

        printf("--------------------\n");
        printf("     END  PART 1    \n");
        printf("--------------------\n");

	return 0;
}
