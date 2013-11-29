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

using namespace std;

class Puzzle {
    
public:
    Puzzle();
    Puzzle(int kTmp);

    void printBoard();
    
    vector<int>* getBoard();
    void setBoard(int tmpBoard[]);
    void setK(int kTmp);
    int getK();

//    void applyMove(Move move);
//    Puzzle applyMoveSeparate(Puzzle state, Move move);
    
//    vector<Move> calculateMoves();
//    vector<Move> calculateMoves(Puzzle state);
    
private:
    vector<int> board;
    int k;
};

#endif	/* PUZZLE_H */

