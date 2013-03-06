#include "csapp.h"

int main(){
	char c='x';
	int childpid, nbytes;
	int fd[2];
	char readbuffer[100];
	
	pipe(fd);

	// creates a fork or gives error
	if((childpid = fork()) == -1){
		perror("fork");
		exit(1);
	}

	// child
	if(childpid == 0){
		/* Child process closes up input side of pipe */
		close(fd[0]);
		char *string;
		string = "Hello World\n";
		/* Send "string" through the output side of pipe */
		write(fd[1],string, (strlen(string)+1));
		exit(0); 
	}
	// parent
	else
	{
		/* Parent process closes up output side of pipe */
		close(fd[1]);

		/* Read in a string from the pipe */
		nbytes = read(fd[0], readbuffer, sizeof(readbuffer));
		printf("Received string: %s", readbuffer);
	}

	return(0);
}
