// my first program in C++

#include <iostream>

using namespace std;

int main (int argc, char *argv[])
{
	if(argc < 2){
	  cout << "Not enough input params!\n";
		return 0;
	}

	string inputFile = argv[0];
	string outputFile = argv[1];

	cout << inputFile << "\n";
	cout << outputFile << "\n";
}
