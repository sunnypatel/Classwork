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
#include <fstream>
 
using namespace std;

class Puzzle {

public:
    vector<int> board;
    int k;

    Puzzle();
    Puzzle(const Puzzle& orig);
    Puzzle(int kTmp);

    void printBoard();
	void printPossibleMoves();
    void setBoard(int tmpBoard[]);
    void setBoard(vector<int> tmpBoard);
    bool compare(Puzzle*);
    vector<int> getBoard();

    void setK(int kTmp);
    int getK();

	void applyMove(Move move);
	Puzzle applyMoveSeparate(Puzzle state, Move move);
    Puzzle applyMoveSeparate(Move move);

	vector<Move> calculateMoves();

    int computeHash();
    int findAbovePos(int index);
    int findLeftPos(int index);
    int findRightPos(int index);
    int findBelowPos(int index);
	int findPiece(int);
    int findAt(int pos);

};

#endif	/* PUZZLE_H */

