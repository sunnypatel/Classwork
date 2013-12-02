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
        this->board.push_back(-1);
    }
}

void Puzzle::printBoard(){
    int k = this->board.size();
    
    for(int y=0; y<k; y++){
        
        cout << "[" << this->board.at(y) << "] ";
        
        if((y%k) == 0){
            cout << "\n";
        }
    }
}
void Puzzle::applyMove(Move move){
    
}

Puzzle Puzzle::applyMoveSeparate(Puzzle state, Move move){
    Puzzle newState;
    
    // set new state's board
    newState.setBoard(state.getBoard());

    
    
    return newState;
}

vector<Move> Puzzle::calculateMoves(){
    
}

vector<Move> Puzzle::calculateMoves(Puzzle state){
    
}

vector<int>* Puzzle::getBoard(){
    return &this->board;
} 

void Puzzle::setBoard(vector<int> *board){
    this->board = *board;
}

