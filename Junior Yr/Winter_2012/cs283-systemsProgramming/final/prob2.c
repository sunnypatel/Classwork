#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <errno.h>

void main(){
	int status;
	printf("%s\n", "Hello");
	printf("%d\n", !fork());


//	printf("**\n%d\n", !1);
//	printf("**\n%d\n", !0);

	
	if(wait(&status) != -1)
		printf("%d\n", WEXITSTATUS(status));

	printf("%s\n", "Bye");

	exit(2);
}
