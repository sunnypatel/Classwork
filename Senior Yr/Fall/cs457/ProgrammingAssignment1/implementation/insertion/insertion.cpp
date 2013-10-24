// my first program in C++

#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <sys/time.h>

using namespace std;

void printArray(int array[], int size);
static long getTime();

int main (int argc, char *argv[])
{
	char* inputFile = argv[1];
	char* outputFile = argv[2];


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
	// create an array with incoutputSize
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

	// INSERTION SORT
	int i,j,tmp;
	for( i=1; i<arraySize; i++){
		j = i;
		while( j > 0 && (array[j-1] > array[j]) ){
			
			tmp = array[j];
			array[j] = array[j-1];
			array[j-1] = tmp;
			j--;
			
		}
	}

	// Write to output file
	std::ofstream outFile;
	outFile.open(outputFile, std::ofstream::out);
	if(outFile.is_open()){
		outFile << "# Size of input array:\n";
		outFile << inputSize << "\n";
		outFile << "# Elements of the array:\n";

		for(i=0; i<arraySize; i++){
			outFile << array[i] << "\n";
		}		

	} else {
		cout << "Could not open output file!" << endl;
	}

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
