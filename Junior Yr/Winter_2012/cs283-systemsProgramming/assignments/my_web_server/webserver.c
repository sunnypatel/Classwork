#include "csapp.h"

void process(int fd);
void func1(int fd);
void func2(int fd);
void func3(int fd);

void main(int argc, char *argv[]){
	int listenfd, connfd, port, clientlen;
	struct sockaddr_in clientaddr;

	/* Check command line args */
	if (argc != 2) {
		fprintf(stderr, "usage: %s <port>\n", argv[0]);
		exit(1);
	}   
	port = atoi(argv[1]);

	listenfd = Open_listenfd(port);

	while(1) {
		clientlen = sizeof(clientaddr);
		connfd = Accept(listenfd, (struct sockaddr *)&clientaddr, &clientlen);

		process(connfd);
	/*	char *test = "asdlfaksdjf\n";
		int i;
		for(i=0;i<1;i++)	
			Rio_writen(connfd,test,strlen(test)); */
		Close(connfd);
	}
}

void process(int fd){
	struct stat sbuf;
	char buf[MAXLINE], method[MAXLINE], uri[MAXLINE], version[MAXLINE];
	char *uri_args;
	rio_t rio;

	// Read request line and headers
	Rio_readinitb(&rio, fd);
	Rio_readlineb(&rio, buf, MAXLINE); 
	sscanf(buf, "%s %s %s",method, uri, version);
	
	// parse uri
	uri_args = strtok(uri,"/");	
	Rio_writen(fd, uri_args,sizeof(uri_args));
	printf("123456");
}

void func1(int fd){}
void func2(int fd){}
void func3(int fd){}
