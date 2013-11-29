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

        if( (y+1)%k == 0 )
            cout << "\n";
    }
    cout << "\n";
}

vector<Move> Puzzle::calculateMoves(){
    vector<Move> possibleMoves;


    int zeroPosIndex = this->findZero();

    Move moveAbove;
    moveAbove.setPositions(0, this->getAbovePiece(zeroPosIndex));
    possibleMoves.push_back(moveAbove);


    
    int leftPiece = this->getLeftPiece(zeroPosIndex);
    if(leftPiece != -1) {
        Move moveLeft;
        moveLeft.setPositions(0, leftPiece);
        possibleMoves.push_back(moveLeft);
    }

    int rightPiece =  this->getRightPiece(zeroPosIndex);
    if(rightPiece != -1) {
        Move moveRight;
        moveRight.setPositions(0, rightPiece);
        possibleMoves.push_back(moveRight);
    }

    int belowPiece = this->getBelowPiece(zeroPosIndex);
    if(belowPiece != -1) {
        Move moveBelow;
        moveBelow.setPositions(0, belowPiece);
        possibleMoves.push_back(moveBelow);
    }
}

/*void Puzzle::applyMove(Move move){
    
}
Puzzle Puzzle::applyMoveSeparate(Puzzle state, Move move){
    Puzzle newState;
    
    // set new state's board
    newState.setBoard(state.getBoard());

    
    
    return newState;
}



vector<Move> Puzzle::calculateMoves(Puzzle state){
    
}

*/

/**
Return the piece above the piece at the index,
return -1 if off of board
*/
int Puzzle::findAbovePiece(int index){

    int abovePos = index - k;

    if((abovePos) < 0)  // out of bounds
        return -1;
    else
        return board[abovePos];
}

/**
Return the piece left the piece at the index,
return -1 if off of board
*/
int Puzzle::findLeftPiece(int index){
    if( (index % k) == 0)
        return -1;

    int leftPos = index - 1;

    if( (leftPos+1 % k) == 0)
        return -1;
    else
        return board[leftPos];
}

/**
Return the piece to the right of the piece at the index,
return -1 if off of board
*/
int Puzzle::findRightPiece(int index){
    int rightPos = index + 1;

    if ( (rightPos % k) == 0)
        return -1;
    else 
        return board[rightPos];
}

/**
Return the piece below the piece at the index,
return -1 if off of board
*/
int Puzzle::findBelowPiece(int index){
    int belowPiece = index + k;
    int kSq = k*k;

    if((belowPiece) >= kSq)
        return -1;
    else
        return board[belowPiece];
}


int Puzzle::findZero(){
    int kSq = k*k;

    for(int i=0; i < kSq; i++){
        if(board[i] == 0)
            return i;
    }    
}

