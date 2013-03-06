#include "csapp.h"
#include "math.h"

void Send(int fd, char* msg);
void process(int fd);
void parse_uri(int fd, char uri[MAXLINE], int param);
int parse_json_params(int *param, char buf[MAXLINE]);
void fib(int fd, int n);
char *intToChar(int x);
char *doubleToChar(double x);
void sin_func(int fd, int n);
void tan_func(int fd, int n);
void cos_func(int fd, int n);

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

		Close(connfd);

	}
}

void process(int fd){
	struct stat sbuf;
	char buf[MAXLINE], method[MAXLINE], uri[MAXLINE], version[MAXLINE];

	int bytesRead = recv(fd, buf, 4096, 0);
	sscanf(buf, "%s %s %s",method, uri, version);
	printf("%s\n",buf);
	int k = 0;
	// get parameter for our function
	int *param;
	param	= &k;
	if(parse_json_params(param, buf) != -1)
		// look for function	
		parse_uri(fd, uri, k);
	else{
		Send(fd, "No function parameters found. \nYou can pass parameters via POST message body formatted in json with identifer \"params\"\n");
	}
	return;
}

/*
	 Parses JSON and returns func_detail struct with function name and it's parameteres
	 @return -1 : failed to read varable properly
						1 : read parameters correctly	
 */
int parse_json_params(int *param, char buf[MAXLINE]){
	// skip all the jazz and move to the json
	char *buf2 = malloc(sizeof(char)*1024);
	int *param_val ;
	// make sure param actually exists in buf
	if(buf2 = strstr(buf, "param")){
		// parse json 
		// looking for param value  
		sscanf(buf2+(7), "%d",param);
	} else{ 
		return -1; 
	}
	return 1;	
}

/*
	 Parse uri to figure out what function needs to be run,
	 and run that function with parameters 
 */
void parse_uri(int fd, char uri[MAXLINE], int param){
	// check if uri is empty, no function was supplied
	if((strcmp(uri,"/") == 0) || (strcmp(uri,"") == 0)){

		Send(fd,"No function name found.\n");
		Send(fd,"Please add function name at the end of / in url\n");

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
		// figure out what function needs to be run
		if(strcmp(uri_args,"fibonacci") == 0) {
			fib(fd, param);
		}
		else if(strcmp(uri_args,"fib") == 0) {
			fib(fd, param);
		}
		else if(strcmp(uri_args,"sin") == 0) {
			sin_func(fd, param);
		}
		else if(strcmp(uri_args,"cos") == 0) {
			cos_func(fd, param);
		}
		else if(strcmp(uri_args,"tan") == 0) {
			tan_func(fd, param);
		}

		else {
			Send(fd,uri_args);
			Send(fd," function does not exist yet.\n");
		}
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
	int first = 0, second = 1, next, c;
	char *fib_num = malloc(sizeof(int)*n);

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
		sprintf(fib_num, "%d\n", next);
		Send(fd,fib_num);
	}

	Send(fd, "\n The ");
	Send(fd, intToChar(n));
	Send(fd, "th digit of Fibonacci is ");
	Send(fd, intToChar(next));
}

/* calc of Tan func */
void tan_func(int fd, int n)
{
	// do calculation
	double ans = tan((double) n);

	char *msg = malloc(sizeof(char)*128);
	char *n_char = intToChar(n);
	strcpy(msg,"Tan(");
	strcat(msg,n_char);
	strcat(msg,") = ");

	Send(fd, msg);
	Send(fd, doubleToChar(ans));
}


/* calc of cos func  */
void cos_func(int fd, int n)
{
	// do calculation
	double ans = cos((double) n);

	char *msg = malloc(sizeof(char)*128);
	char *n_char = intToChar(n);
	strcpy(msg,"Cos(");
	strcat(msg,n_char);
	strcat(msg,") = ");

	Send(fd, msg);
	Send(fd, doubleToChar(ans));
}


/* calc of Sin func ***Will only calculate sin of ints */
void sin_func(int fd, int n)
{
	// do calculation
	double ans = sin((double) n);

	char *msg = malloc(sizeof(char)*128);
	char *n_char = intToChar(n);
	strcpy(msg,"Sin(");
	strcat(msg,n_char);
	strcat(msg,") = ");

	Send(fd, msg);
	Send(fd, doubleToChar(ans));
}

char *doubleToChar(double x){
	char *result = Malloc(sizeof(char)*(int)x);
	sprintf(result, "%f", x);
	return result;
}
char *intToChar(int x){
	char *result = Malloc(sizeof(char)*x);
	sprintf(result, "%d", x);
	return result;
}
