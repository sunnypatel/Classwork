#include <iostream>
#include <fstream>
#include <vector>
#include <stdlib.h>     /* atoi */
#include <stdio.h>
#include "Puzzle.h"
#include "Astar.h"

using namespace std;

int main(int argc, char** argv){
	
	string inputFileName;
	string outputFileName;

	// make sure args are passed
	if (argc >= 2){
		inputFileName = argv[1];
		outputFileName = argv[2];
		
		string line;
		string inputSize_str;
		string boardPiece;
		

		ifstream the_file ( inputFileName.c_str() );
		// Check if file is open
		if(!the_file.is_open()){
			cout << "Could not open file: " << inputFileName << "\n";
		} else {
			
			// ignore the first line
    		the_file >> line;
			// get the input array size
    		the_file >> inputSize_str;
    		// ignore the 3rd line
			//getline(the_file, line);
			the_file >> line;			// ignores "#initial"
			the_file >> line;			// ignores "state"
			
			// convert str board size to int
			int inputSize = atoi(inputSize_str.c_str());

			int board[inputSize * inputSize];

			for(int i=0; the_file >> boardPiece; i++){
				int piece = atoi(boardPiece.c_str());
				
				board[i] = piece;

			}
			
			cout << "k= " << inputSize << "\n";

			Puzzle initBoard;
			initBoard.setK(inputSize);

			initBoard.setBoard(board);
			initBoard.printBoard();
	/*		initBoard.printPossibleMoves();

			vector<Move> tmpMoves = initBoard.calculateMoves();
			cout << "Applying move " ;
			/*tmpMoves[0].printMove();
			cout << endl;
			initBoard.applyMove(tmpMoves[0]);
			initBoard.printBoard();
	*/

			Astar alg(initBoard);
			vector<Move> solution = alg.Astar_search();	
			ofstream myfile;
    		myfile.open(outputFileName);
    		
    		myfile << "#k" << endl;
    		myfile << inputSize << endl;
    		myfile << "#moves" << endl;
    		for(int y=0; y < (solution.size()); y++){
    			myfile << solution[i].getPos1() << " ";
    		}
		}
	} else {
		cout << "Missing cmd line args\n";
	}


	return 0;
}
