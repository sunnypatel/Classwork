#include <stdio.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <errno.h>
#include <string.h>
#include <signal.h>
#include <stdlib.h>
 
 
int sock;
 
void sig_hndlr(int sig){
        close(sock);
        exit(0);
}
 
int main(){
        struct sockaddr_in svr_addr, cli_addr;
        socklen_t cli_sz = sizeof(struct sockaddr_in);
        char buf[4096];
        char ret[4096];
 
        (void) signal(SIGINT, sig_hndlr);
 
        sock = socket(AF_INET, SOCK_STREAM, 0);
 
        svr_addr.sin_family = AF_INET;
        svr_addr.sin_port = htons(8080);
        svr_addr.sin_addr.s_addr = INADDR_ANY;
 
        bind(sock, (struct sockaddr*)&svr_addr, sizeof(svr_addr));
 
        listen(sock, 1);
        //while(1){
                int cli_sock = accept(sock, (struct sockaddr*)&cli_addr, &cli_sz);
                int bytesRead = recv(cli_sock, buf, 4096, 0);
                sprintf(ret, "HTTP/1.0 200 OK\r\n");
                sprintf(ret, "%sServer: My Server\r\n", ret);
                sprintf(ret, "%sContent-length: 116\r\n", ret);
                sprintf(ret, "%sContent-type: text/html\r\n\r\n", ret);
							
								printf("\n\n\n\n %s \n\n\n\n",buf);

                send(cli_sock, ret, 4096, 0);
                printf("%s\n", ret);
                memset(ret, '\0', 4096);
                int fd = open("base.html", O_RDONLY);
                read(fd, ret, 116);
                printf("%s\n", ret);
                send(cli_sock, ret, 116, 0);
                printf("%s\n", strerror(errno));
                close(fd);
                close(cli_sock);
        //}
        close(sock);
}
