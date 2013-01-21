#include <stdio.h>

int hash(char word[]);

int main(void) {

	FILE* dict = fopen("/usr/share/dict/words", "r"); // open the dictionary for read-only access

    if(dict == NULL) {
        return;
    }

    // Read each line of the file, and print it to screen
    char word[128];
	int i =0;
    while(fgets(word, sizeof(word), dict) != NULL) {
		//printf("%s", word);
		i++;
    }
//	printf("Total:%d \n",i);
	
	char sample[] = "";
	hash(sample);
}

// return the hash number for each word based on letters 
// in the word
int hash(char word[]){
	int size = sizeof(word);	
	int i, result = 0;

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
		}
	}

	printf("Hash result = %d \n",result);
	return result;
}
