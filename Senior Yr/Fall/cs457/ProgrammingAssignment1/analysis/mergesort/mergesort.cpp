// my first program in C++

#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <sys/time.h>

using namespace std;

void printArray(int array[], int size);
static long getTime();
void mergeSort(int input[], int temp[],  int left, int right);
void merge(int input[], int temp[], int left, int mid, int right);

int main (int argc, char *argv[])
{
	char* inputFile = argv[1];
	char* outputFile = argv[2];

	cout << "inputFile=" << inputFile << "\n";
	cout << "outputFile=" << outputFile << "\n";

	string line;
	string inputSize;
	int arraySize;

	std::ifstream ifs;
	ifs.open (inputFile, std::ifstream::in);
	// ignore the first line
	getline(ifs,line);
	// get the input array size
	getline(ifs,inputSize);
	// ignore the 3rd line
	getline(ifs,line);
	// convert inputSize from string to int
	arraySize = atoi(inputSize.c_str());	
	// create an array with inputSize
	int array[arraySize];
	// print out the input size	
	cout << "Input size= " << inputSize << endl;
	
	// if file was able to open
	if(ifs.is_open()){
		int i=0;
		// open through and add inputs to array	
		while ( getline(ifs,line) ){
			// convert input line from string to int and 
			// save in array
			array[i] = atoi(line.c_str());
			i++;
		}
		ifs.close();
	} else{
		cout << "Unable to open file";
	}

	// Before sorting
	//cout << "Before sorting" << endl;
	//printArray(array,arraySize);

	int startTime = getTime();
	int temp[arraySize];
	// 	MERGESORT
	mergeSort(array, temp, 0, arraySize-1);
	
	int endTime = getTime();
	
	printf("Sorted: %d numbers, in ~%ld milliseconds. \n", arraySize, endTime - startTime);
	

	//cout << "After sorting" << endl;
	//printArray(array, arraySize);

	// Write to output file
	std::ofstream outFile;
	outFile.open(outputFile, std::ofstream::out);
	if(outFile.is_open()){
		outFile << "# Size of input array:\n";
		outFile << inputSize << "\n";
		outFile << "# Elements of the array:\n";
		int i;
		for(i=0; i<arraySize; i++){
			outFile << array[i] << "\n";
		}		

	} else {
		cout << "Could not open output file!" << endl;
	}


	FILE *pfile;
	pfile = fopen("Analytics.txt","a");
	fprintf(pfile, "Sorted: %d numbers, in %ld milliseconds. \n", arraySize, endTime - startTime);
	
	return 0;
}

void printArray(int array[], int size){
	int i;
	cout << " Array: " << endl;
	for(i=0; i<size; i++){
		cout << " " << array[i];
	}
	cout << endl;
}

static long getTime() 
{ 
 long timeMilliseconds; 
 struct timeval time_data; /* seconds since 0 GMT */ 
 
 gettimeofday(&time_data,NULL); 
 
 timeMilliseconds = time_data.tv_usec; 
 timeMilliseconds /= 1000; 
 timeMilliseconds += time_data.tv_sec * 1000 ; 
 
 return timeMilliseconds; 
} 

void mergeSort(int input[], int temp[],  int left, int right)
{
  if (right > left){
    int mid = (right + left) / 2;
    mergeSort(input, temp, left, mid);
    mergeSort(input, temp, mid+1, right);
 
    merge(input, temp, left, mid+1, right);
  }
}
 
void merge(int input[], int temp[], int left, int mid, int right){
  int i, left_end, arraySize, tempPos;
 
  left_end = mid - 1;
  tempPos = left;
  arraySize = right - left + 1;
 
  while ((left <= left_end) && (mid <= right)){
    if (input[left] <= input[mid]){
      temp[tempPos] = input[left];
      tempPos = tempPos + 1;
      left = left +1;
    } else {
      temp[tempPos] = input[mid];
      tempPos = tempPos + 1;
      mid = mid + 1;
    }
  }
 
  while (left <= left_end){
    temp[tempPos] = input[left];
    left = left + 1;
    tempPos = tempPos + 1;
  }
  while (mid <= right){
    temp[tempPos] = input[mid];
    mid = mid + 1;
    tempPos = tempPos + 1;
  }
 
  for (i=0; i <= arraySize; i++){
    input[right] = temp[right];
    right = right - 1;
  }
}