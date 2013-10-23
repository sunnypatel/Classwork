// my first program in C++

#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <sys/time.h>

using namespace std;

void printArray(int array[], int size);
static long getTime();
void quickSort(int arr[], int left, int right);

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

	// 	QUICKSORT
	quickSort(array, 0, arraySize-1);
	
	int endTime = getTime();
	
	printf("Time elapsed:  %ld \n", endTime - startTime);
	

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

	//analytics.open("Analysis.txt", std::ofstream::app);
	fprintf(pfile, "Time elapsed: %ld \n", endTime - startTime);

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

void quickSort(int input[], int left, int right) {
      // select start and end
      int i = left, j = right;
      int tmp;
      // calculate pivot
      int pivot = input[(left + right) / 2];
 
      while (i <= j) {
            while (input[i] < pivot)
                  i++;
            while (input[j] > pivot)
                  j--;
            if (i <= j) {
                  tmp = input[i];
                  input[i] = input[j];
                  input[j] = tmp;
                  i++;
                  j--;
            }
      };

      if (left < j)
            quickSort(input, left, j);
      if (i < right)
            quickSort(input, i, right);
}
