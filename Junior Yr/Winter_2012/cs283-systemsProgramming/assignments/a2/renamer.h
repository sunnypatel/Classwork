#ifndef RENAMER_H
#define RENAMER_H

#include <stdlib.h>
#include <string.h>
#include "csapp.h"

int pattern_parser(char *pattern);
void Rename(char *oldFile, char *newFile, char *dir_path);
#endif
