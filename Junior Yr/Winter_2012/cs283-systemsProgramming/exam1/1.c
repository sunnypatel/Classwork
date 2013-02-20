#include "csapp.h"

int main(int argc, char *argv[])
{
	int fd1, fd2, fd3;
	char c1, c2, c3;
	char *fname = argv[1];
	fd1 = Open(fname, O_RDONLY, 0);
	fd2 = Open(fname, O_RDONLY, 0);
	fd3 = Open(fname, O_RDONLY, 0);

	Dup2(fd2, fd3);
	Read(fd1, &c1, 1);
	Read(fd2, &c2, 1);
	Read(fd3, &c3, 1);
	printf("c1 = %c, c2 = %c, c3 = %c\n", c1, c2, c3);
    return 0;
}
