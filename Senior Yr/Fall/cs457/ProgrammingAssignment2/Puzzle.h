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
#include "Position.h"

using namespace std;

class Puzzle {
    
public:
    Puzzle();
    Puzzle(const Puzzle& orig);
    virtual ~Puzzle();
    
    void initBoard(int k);
    void printBoard();
    
    Position getBlankSq();
    void setBlankSq(Position blankSqPos);
    
    vector< vector<int> > getBoard();
    void setBoard(vector< vector<int> > board);

    void applyMove(Move move);
    Puzzle applyMoveSeparate(Puzzle state, Move move);
    
    vector<Move> calculateMoves();
    vector<Move> calculateMoves(Puzzle state);
    
private:
    Position blankSqPos;
    vector< vector<int> > board;
};

#endif	/* PUZZLE_H */

