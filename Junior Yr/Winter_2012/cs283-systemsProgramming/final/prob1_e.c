#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <errno.h>

int val = 10;

void handler(sig){
		val += 5;
		return;
}

int main(){
	int pid;
	
	if ((pid = fork()) == 0){
		printf("\n\n\n****child exit******\n");
		exit(0);
	}
		int i=0;
    
	while(i<1000){
			      printf("parenting");
						//      sleep(1);
						      i++;
									      }
		    exit(0);

	printf("\n****************\n PARENT EXIT \n ************* \n");
	exit(0);
}
