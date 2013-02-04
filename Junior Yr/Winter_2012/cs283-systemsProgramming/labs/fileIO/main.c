#include <stdio.h>
#include <fcntl.h>
#include <sys/types.h>
#include <dirent.h>

void error(char *s) {
	fprintf(stderr, "Error: ");
	fprintf(stderr,s);
	fprintf(stderr,"\n");
	exit(-1);
}

int main (int argc, char *argv[]) {

	DIR *directory;
	struct dirent *de;

	//check if proper input
	if (argc != 3)
			error("Not enough input parameters, please enter 2 directories");

	if (!(directory=opendir(argv[1])))
		error("Failed to open directory");

	while(0 != (de = readdir(directory))) {
		printf("Found file: %s%s\n",de, de->d_name);

		
	}

	// close open directory
	closedir(directory);

}
