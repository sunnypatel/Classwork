/* 
 * File:   Puzzle.h
 * Author: sunnypatel
 *
 * Created on November 16, 2013, 4:02 PM
 */

#ifndef PUZZLE_H
#define	PUZZLE_H

#include<vector>
#include<iostream>
#include "Move.h"

using namespace std;

class Puzzle {
    vector<int> board;
    int k;

public:
    Puzzle();
    Puzzle(const Puzzle& orig);
    Puzzle(int kTmp);

    void printBoard();
	void printPossibleMoves();
    void setBoard(int tmpBoard[]);
    void setBoard(vector<int> tmpBoard);

    vector<int> getBoard();

    void setK(int kTmp);
    int getK();

	void applyMove(Move move);
	Puzzle applyMoveSeparate(Puzzle state, Move move);
    
	vector<Move> calculateMoves();
//    vector<Move> calculateMoves(Puzzle state);

    int findAbovePos(int index);
    int findLeftPos(int index);
    int findRightPos(int index);
    int findBelowPos(int index);
	int findPiece(int);
    int findAt(int pos);

};

#endif	/* PUZZLE_H */

