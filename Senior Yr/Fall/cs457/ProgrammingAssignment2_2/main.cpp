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
        // ignore the first line
        the_file >> str;
        // get the input array size
        the_file >> inputSize;
        // ignore the 3rd line
        the_file >> str;
        str.
        // convert inputSize from string to int
        int arraySize = atoi(inputSize.c_str());
        // create a board of k size
        //Puzzle initState = new Puzzle();
        initState.initBoard(arraySize);
        initState.printBoard();
    }
    
    return 0;
}

