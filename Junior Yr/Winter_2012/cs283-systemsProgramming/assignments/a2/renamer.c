/**

	Author: Sunny Patel
	University : Drexel University
	Course : CS283 "Systems Programming"
	Professor: William M. Mongan

*/

#include "renamer.h"

int main(int argc, char **argv){
	// varable up
	char *pattern = argv[1];
	char *replace = argv[2];
	char *fnames = argv[3];
	// subdirectory where files are located
	char *dir_name = "files/";

	printf("PATTERN=%s\n",argv[1]);
	printf("REPLACE / BEFORE=%s\n",argv[2]);
	printf("FNAMES=%s\n",argv[3]);

	// Start pringing files in the dir
	DIR *directory;
	struct dirent *de;

	if (!(directory = opendir(dir_name)))
			error("Failed to open directory");

	// get the length of pattern
	size_t pattern_len = strlen(pattern);
	while (0 != (de = readdir(directory))) {
		
		printf("Found file: %s\n", de->d_name);
	}
}
