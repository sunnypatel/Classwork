#include "csapp.h"

void print1(){
	printf("here\n");
}
void print2(){
	printf("Hello World");
}
void main(int argc, char *argv[]){
	printf("%s",argv[1]);
	void (*a)();
	a = print1;
	
	a();
}
