/**

	Author: Sunny Patel
	University : Drexel University
	Course : CS283 "Systems Programming"
	Professor: William M. Mongan

*/

#include "renamer.h"

int pattern_parser(char *pattern) {
	// check if * is in beginning of pattern
	// tmp pointer to pattern string
	char *p;
	// point p to the first occurance of * in pattern
	p = strstr( pattern, "*");
	int pos = pattern - p;

	// make sure * actually exists in pattern
	if(p) {
		if(pos == 0) {
			//check for another occurance of * in rest of string
			char *rest_pat;
			rest_pat = pattern + (pos + 1);
			// get the nxt occurence of *
			char *p2 = strstr(rest_pat, "*");
			if(p2) // pattern has another *
				return 2;
			else
				return 3;
		}	
		else if(pos ==(strlen(pattern)-1))
			// * is at the end - ex. matches cs283*
			return 1;
		else // no * was found
			return 0;
	} 
}

/**
	Rename old filename with new filename in sub directory
	dir_path
*/
void Rename(char *oldFile, char *newFile, char *dir_path){
	// create the file path of old file
    char *oldFilePath;
    strcat(oldFilePath, dir_path);
    strcat(oldFilePath, oldFile);    
    // create the file path of new file
    char *newFilePath;
    strcat(newFilePath, dir_path);
    strcat(newFilePath, newFile);
    // rename the file
    rename(oldFilePath, newFilePath);
}

int main(int argc, char **argv){
	if(argc < 4){
		unix_error("Please provide PATTERN, REPLACE, and FNAMES arguments");
		return 0;	
	}
	// varable up
	char *pattern = argv[1];
	char *replace = argv[2];
	char *fnames = argv[3];
	// subdirectory where files are located
	char dir_name[] = "files/";

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
	//printf("\nPattern Length: %u\n\n",pattern_len);	
	//printf("OldPattern=%s\n",pattern);
	//	pattern = Replace_str(pattern, "*", "%");
	printf("newPattern=%s\n",pattern);
	int task = pattern_parser(pattern);

	// parse pattern to determine what matching we want to do
	// match beginning of filename? end? 
	// begin looping through dir finding files
	while (0 != (de = readdir(directory))) {
		// Ignore the .. & .
		if( (strcmp(de->d_name, "..") != 0) &&
			(strcmp(de->d_name, "." ) != 0) ) {
			
//			printf("Found file: %s\n", de->d_name);
		
			if(task == 1) {	
				printf("Matched task 1\n");		
				char *tmp;
				strncpy(tmp,de->d_name,pattern_len-2);
				char *pattern_word = Replace_str(pattern, "*", "");
				if(strcmp(tmp,pattern_word) == 0){
					// word matches! Replace the filename
					char *newFileName = Replace_str(de->d_name, pattern_word,replace);
					Rename(newFileName, de->d_name, dir_name);	
				}
			} else if(task == 2) {
				// match something like *_cs283*
				char *pattern_word = Replace_str(pattern, "*", "");
				char *tmp;
				if(!(tmp = strstr(de->d_name, pattern_word))) { //filename contains match
					char *newFileName = Replace_str(de->d_name, pattern_word, replace);
					Rename(newFileName, de->d_name, dir_name);
				}
			} else if(task == 3) {
				// match something like *.txt
				char *fn = de->d_name;	
				char *pattern_word = Replace_str(pattern, "*", "");
				// get the length of pattern
				int pattern_word_len = strlen(pattern_word);
				// move pointer to end of filename right before 
				// where the pattern could be  
				fn = fn + (strlen(de->d_name) - pattern_word_len);
				if(strcmp(fn,pattern_word) == 0){
					char *newFileName = Replace_str(de->d_name, pattern_word, replace);
					Rename(newFileName, de->d_name, dir_name);
				}
					
			}
		}		
	}
}
