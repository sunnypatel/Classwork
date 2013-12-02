/* 
 * File:   main.cpp
 * Author: sunnypatel
 *
 * Created on November 16, 2013, 3:49 PM
 */

#include <cstdlib>
#include <iostream>
#include <fstream>
#include "Puzzle.h"

using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {
    cout << "Hello World" ;
/*
    // first arg will be name of input file
    string inputFileName = argv[1];
    string outputFileName = argv[2];
    
    string line;
    string inputSize;
    
    string str;
    ifstream the_file ( argv[1] );
    // Check if file is open
    if( !the_file.is_open() )
        cout << "Could not open file: " << inputFileName;
    else {
        the_file >> str;
        cout << "got: " << str << "\n";
    }
    
    // ignore the first line
    getline(ifs, line);
    // get the input array size
    getline(ifs, inputSize);
    // ignore the 3rd line
    getline(ifs, line);
    // convert inputSize from string to int
    int arraySize = atoi(inputSize.c_str());
    // create a board of k size
    Puzzle initState = new Puzzle();
    initState.initBoard(arraySize);
    initState.printBoard();
    */
    return 0;
}

