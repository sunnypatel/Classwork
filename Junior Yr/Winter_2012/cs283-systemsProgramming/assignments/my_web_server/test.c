#include "csapp.h"

void main(){
	char a[] = "test1/test2/test3";
	char *b;
	b = strtok(a,"/");

	printf("%s\n",b);
	printf("%s\n",b+(strlen(b)+1));
	b = strtok(NULL,"/");
	printf("%s\n",b);
	printf("%s\n",b+(strlen(b)+1));
}
