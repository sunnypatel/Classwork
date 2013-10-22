// my first program in C++

#include <iostream>

using namespace std;

int main (int argc, char *argv[])
{
	string inputFile = argv[1];
	string outputFile = argv[2];

	cout << "inputFile=" << inputFile << "\n";
	cout << "outputFile=" << outputFile << "\n";

	string line;
	ifstream fileStream (inputFile);

	if(fileStream.is_open()){
		while ( getline(fileStream,line) ){

			cout << line << endl;

		}
		fileStream.close();
	} else{
		cout << "Unable to open file";
	}

	return 0;
}
