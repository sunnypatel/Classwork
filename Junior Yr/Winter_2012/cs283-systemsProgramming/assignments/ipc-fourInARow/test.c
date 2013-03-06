#include "csapp.h"

int main(){
	char c='x';
	int m = 10; // number of children to make
	int fd[m][2];
	int i=0;	

	for(i=0; i<=2*m; i+2){
		pipe(fd[i]);
		int pid;
		// create fork or give error
		if((pid = fork()) == -1){
				perror("Error creating fork");
				exit(1);
		}
		if(pid==0){
			// child do work
      
			//write
      write(fd[i+1][1], &i, (sizeof(i)));
			
			//	read
			int nbytes;
			int readi;
			nbytes = read( fd[i][0], &readi, sizeof(readi));
			char *childString = Malloc(sizeof(readi));
			sprintf(childString, "%d", readi);
      printf("Child ;  %s\n", childString);
		}
		else {
			// parent
// parent loops through all the children looking if anyone has made a move,
// if they have it will respond otherwize move on.
									
			// read
			int nbytes;
			int readi;
			nbytes = read(fd[i+1][0], &readi, sizeof(readi));
			int new = readi + 10;
			char *string = Malloc(sizeof(new));	
			sprintf(string, "%d", new);
			printf("i = %d   ; %s\n",i,string);	

			// write 
			write( fd[i][1], &new, (sizeof(new)));

		}
	}

	return(0);
}
