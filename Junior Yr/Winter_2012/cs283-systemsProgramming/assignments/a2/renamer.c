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
	// print the pattern length just for fun
	printf("\nPattern Length: %u\n\n",pattern_len);	

	// begin looping through dir finding files
	while (0 != (de = readdir(directory))) {
		// Ignore the .. & .
		if( (strcmp(de->d_name, "..") != 0) &&
			(strcmp(de->d_name, "." ) != 0) ) {
			
			printf("Found file: %s\n", de->d_name);

			// create a tmp substring containing the 
			char *tmp;
			// allocate the same amt of mem as PATTERN
			tmp = (char*) Malloc (sizeof(de->d_name));
			// copy first x number of characters of filename 
			strncpy(tmp, de->d_name, pattern_len);
			printf("First %u chars: %s\n\n", pattern_len, tmp);	

			if( strcmp(tmp, pattern) == 0 ) { // string matchs
				// begin replacment
				printf("*** STRING MATCHES ***\n");
				// calculate new filename size in bytes
				unsigned int filename_size = strlen(de->d_name) - (pattern_len) + (strlen(replace));
				printf("Size of new filename: %u \n",filename_size);
				//  first x number of characters of filename 
           		char *newName;
				newName = (char*) Malloc (filename_size);
				// begin making the word	
				newName = Replace_str(de->d_name, pattern, replace);
		
				printf("New filename: %s \n",newName);
			 
//				rename("files/cs283","files/matched");
			}
		}			
	}
}
