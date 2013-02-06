#include <stdio.h>
#include <sys/types.h>
#include <dirent.h>
#include "csapp.h" 

void printDir(char *dir);
/*
void error(char *s) {
	fprintf(stderr, "Error: ");
	fprintf(stderr,s);
	fprintf(stderr,"\n");
	exit(-1);
}
*/
void printDir(char *dir) {
	DIR *directory;
	struct dirent *de;

	if (!(directory=opendir(dir)))
		error("Failed to open directory");

	while(0 != (de = readdir(directory))) {
		struct stat stat_buf;
		
		Stat(de->d_name, &stat_buf);
		if(S_ISDIR(stat_buf.st_mode)) {
			char newDir[100]; // sub directory
			strcpy(newDir,dir);
			strcat(newDir,"/");
			strcat(newDir,de->d_name);
			printDir(newDir);
		}
		else {
			printf("Found file: %s%s \n",dir,de->d_name);
		}
	}
	closedir(directory);
}
int main (int argc, char *argv[]) {
/*
	DIR *directory;
	struct dirent *de;

	//check if proper input
	if (argc != 3)
			error("Not enough input parameters, please enter 2 directories");

	if (!(directory=opendir(argv[1])))
		error("Failed to open directory");

	while(0 != (de = readdir(directory))) {
		printf("Found file: %s\n", de->d_name);

		
	}

	// close open directory
	closedir(directory);
*/
	printDir(argv[1]);
}
