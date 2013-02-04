#include <stdio.h>
#include <fcntl.h>

void error(char *s) {
	fprintf(stderr, "Error: ");
	fprintf(stderr,s);
	fprintf(stderr,"\n");
	exit(-1);
}

int main (int argc, char *argv[])
{    char buf[1024]; 
     int fd1, fd2, n;
     if (argc != 3)    
         error("Usage: copy from to");
     if ((fd1 = open(argv[1], O_RDONLY, 0)) == -1)
         error("unable to opening source file");
     if ((fd2 = creat(argv[2], 0666)) == -1)
         error("unable to creating new file");
     while ((n = read(fd1, buf, 1024) )> 0)
         write ( fd2, buf, n);
     return 0;
}
