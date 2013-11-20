/* 
 * File:   Puzzle.cpp
 * Author: sunnypatel
 * 
 * Created on November 16, 2013, 4:02 PM
 */

#include "Puzzle.h"


Puzzle::Puzzle() {
}

Puzzle::Puzzle(const Puzzle& orig) {
}

Puzzle::~Puzzle() {
}

void Puzzle::initBoard(int k){
    for(int y=0; y < k; y++){
        this->board.push_back(new vector<int>(k));
    }
}

void Puzzle::printBoard(){
    int k = this->board.size();
    
    for(int y=0; y<k; y++){
        for(int x=0; x<k; x++){
            cout << "[" << this->board.at(y).at(x) << "] ";
        }
        cout << "\n";
    }
}
void Puzzle::applyMove(Move move){
    
}

Puzzle Puzzle::applyMoveSeparate(Puzzle state, Move move){
    Puzzle newState();
    
    // set new state's board
    newState.setBoard(*state.getBoard());
    // set new state's blankSq pos
    newState.setBlankSq(state.getBlankSq());
    
    
    return newState;
}

vector<Move> Puzzle::calculateMoves(){
    
}

vector<Move> Puzzle::calculateMoves(Puzzle state){
    
}

Position Puzzle::getBlankSq(){
    return this->blankSqPos;
}

void Puzzle::setBlankSq(Position blankSqPos){
    this->blankSqPos = blankSqPos;
}

vector< <vector<int> > *Puzzle::getBoard(){
    return &this->board;
} 

void Puzzle::setBoard(vector <vector<int> > &board){
    this->board = board;
}

