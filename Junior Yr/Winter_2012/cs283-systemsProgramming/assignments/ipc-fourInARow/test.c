#include "csapp.h"

int main(){
	char c='x';
	int m = 10; // number of children to make
	int fd[m][2];
	int i=0;	

	for(i=0; i<=m; i++){
		pipe(fd[i]);
		int pid;
		// create fork or give error
		if((pid = fork()) == -1){
				perror("Error creating fork");
				exit(1);
		}
		if(pid==0){
			// child do work
			char *string;
			sprintf(string, "%d", i);
			write(fd[i][1], string, (strlen(string)+1));
			exit(0);
		}
		else {
			// parent
			int nbytes;
			char readbuffer[10];
			nbytes = read(fd[i][0], readbuffer, sizeof(readbuffer));
	    printf("i= %d ;   Received string: %s\n", i, readbuffer);

		}
	}

	return(0);
}
