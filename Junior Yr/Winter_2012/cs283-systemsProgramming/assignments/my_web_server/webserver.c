#include "csapp.h"

void Send(int fd, char* msg);
void process(int fd);
void parse_uri(int fd, char uri[MAXLINE], int param);
int parse_json_params(char buf[MAXLINE]);
void fib(int fd, int n);


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
		//	char buf[4096];
		//	int bytesRead = recv(connfd, buf, 4096, 0);
		//	Send(connfd,buf);	
		process(connfd);

		Close(connfd);

	}
}

void process(int fd){
	struct stat sbuf;
	char buf[MAXLINE], method[MAXLINE], uri[MAXLINE], version[MAXLINE];

	int bytesRead = recv(fd, buf, 4096, 0);
	sscanf(buf, "%s %s %s",method, uri, version);

	// get parameter for our function
	int param = parse_json_params(buf);
	// look for function	
	parse_uri(fd, uri, param);
	return;
}



/*
	Parse uri to figure out what function needs to be run,
	and run that function with parameters 
*/
void parse_uri(int fd, char uri[MAXLINE], int param){
	// check if uri is empty, no function was supplied
	if((strcmp(uri,"/") == 0) || (strcmp(uri,"") == 0)){
//		html = malloc(sizeof(*html)*10);
//		html = Malloc(sizeof(char)*1024);
//		FILE *err_html = fopen("noFunc.html","R");
//		int read_c = fread(html,1,1,err_html);
//		Send(fd,"No function name found.\n");
//		Send(fd,"Please add function name at the end of / in url\n");
		Send(fd,"asdfasdf");
		
		return;
	}

	char *uri_args;
	// parse uri
	uri_args = strtok(uri,"/");
	// double check to make sure something was found
	if(strcmp(uri_args,"") == 0){
		Send(fd,"No function name found.");
	}
	else{
		// a function was found, now get the params sent to the 
		// function via json
		Send(fd,uri_args);

		// figure out what function needs to be run
		if(strcmp(uri_args,"fibonacci") == 0) {
			fib(fd, param);
		}
		else if(strcmp(uri_args,"fib") == 0) {
			fib(fd, param);
		}
		else {
			Send(fd,uri_args);
			Send(fd,"function does not exist yet.\n");
		}
	}

}


/*
	 Parses JSON and returns func_detail struct with function name and it's parameteres
 */
int parse_json_params(char buf[MAXLINE]){
	// skip all the jazz and move to the json
	char *buf2 = malloc(sizeof(char)*1024);
	buf2 = strstr(buf, "param");
	int *param_val = malloc(sizeof(int));

	if(strlen(buf2)){
	// parse json 
	// looking for param value  
	sscanf(buf2+(7), "%d",param_val);
	// converts int param to str
	//char* param_str = malloc(sizeof(char)*1024);
	//sprintf(param_str,"%d" ,*param_val);
	return *param_val;
	}
}

/*
	 Function to wrap a wrapper, no need to specify strlen
 */
void Send(int fd, char* msg){
	if(strcmp(msg, "") != 0)
		Rio_writen(fd, msg, strlen(msg));
}

/* 
	Print the fib sequence
*/
void fib(int fd,int n){
  int first = 0, second = 1, c;
	long int next;

	 Send(fd, "\nPrinting the Fibonacci sequence:\n"); 
	 
   for ( c = 0 ; c < n ; c++ )
   {
      if ( c <= 1 )
         next = c;
      else
      {
         next = first + second;
         first = second;
         second = next;
      }
			// convert int to str
			char *fib_num = malloc(sizeof(long int)*n*n);
			sprintf(fib_num, "%d\n", next);
      Send(fd,fib_num);
   }
 
}
