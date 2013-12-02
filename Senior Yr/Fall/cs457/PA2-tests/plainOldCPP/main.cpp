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
			initBoard.printPossibleMoves();

			vector<Move> tmpMoves = initBoard.calculateMoves();
			cout << "Applying move " ;
			tmpMoves[0].printMove();
			cout << endl;
			initBoard.applyMoveSeparate(initBoard,tmpMoves[0]);
			initBoard.printBoard();


			Astar alg;
			cout << "Dist of 6= " << alg.distanceFromGoal(6, 4, 3) << endl;
			cout << "Dist of 7= " << alg.distanceFromGoal(7, 2, 3) << endl;
			cout << "Dist of 8= " << alg.distanceFromGoal(8, 7, 3) << endl;

			cout << "Dist of 0= " << alg.distanceFromGoal(0, 6, 3) << endl;
			cout << "Dist of 1= " << alg.distanceFromGoal(1, 3, 3) << endl;
			cout << "Dist of 2= " << alg.distanceFromGoal(2, 5, 3) << endl;

			cout << "Dist of 3= " << alg.distanceFromGoal(3, 1, 3) << endl;
			cout << "Dist of 4= " << alg.distanceFromGoal(4, 0, 3) << endl;
			cout << "Dist of 5= " << alg.distanceFromGoal(5, 8, 3) << endl;
		}
	} else {
		cout << "Missing cmd line args\n";
	}


	return 0;
}
