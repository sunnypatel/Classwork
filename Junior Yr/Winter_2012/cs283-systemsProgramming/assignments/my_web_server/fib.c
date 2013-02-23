#include "csapp.h"

int main(int argc, char *argv[]){
	int n = argv[1];

	int a = 0;
	int b = 1;
	int i = 0;
	int tmp;
	for(i=0;i<=n;i++){
		tmp = a + b;
		a = b;
		b = tmp;	
		printf("%d\n",i);
	}
	printf("The %s digit of fibonacci is %d",n,tmp);
}
