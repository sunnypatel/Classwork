/* Lab 1; Part 1 */

#include <stdio.h>
#include <stdlib.h>

void sort(int* a, int size);

int main (void)
{
	printf("--------------------\n");
	printf("   STARTING PART 3  \n");
	printf("--------------------\n");

	// init. array of 10 int.s pointer
	int *ptr;
	ptr = malloc( 10*sizeof(*ptr) );

	// add in int. counting down from 10
        int i;
        for (i=0; i<10; i++)
        {
            *(ptr + i) = 10 - i;
        }


	// unsorted; in fact decending in this case
	printf("\nPrint unsorted array\n");
        int j;
        for (j =0; j<10;j++){
            printf("[%d] = %d\n",j,*(ptr+j));
        }

	// sorted ascending
	sort(ptr,10);	

	// print again sorted this time
	printf("\nPrint again sorted this time\n");
        
	int g;
        for (g =0; g<10;g++){
            printf("[%d] = %d\n",g,ptr[g]);
        }

        printf("--------------------\n");
        printf("     END  PART 3    \n");
        printf("--------------------\n");


	return 0;
}

/** Perform bubble sort */
void sort(int* a, int size){

	int i,j,z;

	for(i = size-1; i >=0; i--) {
	    for( j=1; j<=i; j++){
		// swap if needed; using z as temp
		if( a[j-1] > a[j]) {
		    z = a[j-1];
		    a[j-1] = a[j];
		    a[j] = z;
		} 
	    }
	}

}
