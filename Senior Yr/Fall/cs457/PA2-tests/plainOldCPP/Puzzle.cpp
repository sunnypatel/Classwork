/* 
 * File:   Puzzle.cpp
 * Author: sunnypatel
 * 
 * Created on November 16, 2013, 4:02 PM
 */

#include "Puzzle.h"


Puzzle::Puzzle() {
    this->k = 4;
    int kSq = k*k;

    for(int i=0; i < kSq; i++){
        board.push_back(-1);
    }
}

Puzzle::Puzzle(int kTmp){
    this->k = kTmp;

    for(int i=0; i < (this->k * this->k); i++){
        board[i] = -1;
    }
}

void Puzzle::setBoard(int tmpBoard[]){
    int kSq = k*k;
    
    for(int i=0; i < kSq; i++){
        board[i] = tmpBoard[i];
    }

}

void Puzzle::setK(int kTmp){
 
    k = kTmp;
}

int Puzzle::getK(){
    return this->k;
}

void Puzzle::printBoard(){

    for(int y=0; y < (this->k * this->k); y++){
        cout << "[" << this->board[y] << "]";
    }
    cout << "\n";
}
/*void Puzzle::applyMove(Move move){
    
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

*/


