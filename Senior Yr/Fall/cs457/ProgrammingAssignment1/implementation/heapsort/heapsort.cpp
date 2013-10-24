// my first program in C++

#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <sys/time.h>

using namespace std;

void heapify(int* array, int low, int high);
void heapSort(int* array, int size);
void shiftRight(int* array, int low, int high);

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

	int temp[arraySize];
	// 	HEAPSORT
	heapSort(array, arraySize);


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

void heapSort(int* array, int size){

    // move max value to root
    heapify(array, 0, size-1);
    int high = size - 1;
    while (high > 0) {
        
        int tmp = array[high];
        array[high] = array[0];
        array[0] = tmp;
        --high;
        
        shiftRight(array, 0, high);
    }
    return;
}
void heapify(int* array, int low, int high) {
    // choose the last parent node
    int midIdx = (high - low -1)/2;
    while (midIdx >= 0) {
        shiftRight(array, midIdx, high);
        --midIdx;
    }
    return;
}
void shiftRight(int* array, int low, int high)
{
    int root = low;

    while ( (root*2)+1 <= high )
    {
        int leftChild = (root * 2) + 1;
        int rightChild = leftChild + 1;
        int swapI = root;

        // Left check
        if (array[swapI] < array[leftChild])
        {
            swapI = leftChild;
        }
        // Right check
        if ( (rightChild <= high) && (array[swapI] < array[rightChild]) ) {
            swapI = rightChild;
        }
        
        if (swapI != root){
            int tmp = array[root];
            array[root] = array[swapI];
            array[swapI] = tmp;
            
            root = swapI;
        }
        else{
            break;
        }
    }
    return;
}