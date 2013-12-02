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

Puzzle::Puzzle(const Puzzle& orig) {
    board = orig.board;
    k = orig.k;
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

void Puzzle::setBoard(vector<int> tmpBoard){
    int kSq = k*k;
    for(int i=0; i < kSq; i++){
        board[i] = tmpBoard[i];
    }   
}

vector<int> Puzzle::getBoard(){
    return this->board;
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
bool Puzzle::compare(Puzzle* p){
    for(int i=0; i<board.size(); i++){
        if(p->board[i] != board[i])
            return false;
    }
    return true;
}
/**
    Find all possible moves for moving the zero
    @return vector of moves
*/
vector<Move> Puzzle::calculateMoves(){
    vector<Move> possibleMoves;
    
    int zeroPosIndex = this->findPiece(0);
    int abovePos = this->findAbovePos(zeroPosIndex);

    if(abovePos != -1) {
        Move moveAbove(zeroPosIndex, abovePos);
        possibleMoves.push_back(moveAbove);

    }

    
    int leftPos = this->findLeftPos(zeroPosIndex);
    if(leftPos != -1) {
        Move moveLeft(zeroPosIndex, leftPos);
        possibleMoves.push_back(moveLeft);
    }

    int rightPos =  this->findRightPos(zeroPosIndex);
    if(rightPos != -1) {
        Move moveRight(zeroPosIndex, rightPos);
        possibleMoves.push_back(moveRight);
    }

    int belowPos = this->findBelowPos(zeroPosIndex);
    if(belowPos != -1) {
        Move moveBelow(zeroPosIndex, belowPos);
        possibleMoves.push_back(moveBelow);
    }

    return possibleMoves;
}

void Puzzle::printPossibleMoves(){
    vector<Move> possibleMoves = this->calculateMoves();


    for(int i=0; i<possibleMoves.size(); i++){\
        possibleMoves[i].printMove();
        cout << endl;
    }
}

void Puzzle::applyMove(Move move){
    int pos1 = move.getPos1();
    int pos2 = move.getPos2();

    int tmpPiece = board[pos2];
    board[pos2] = board[pos1];
    board[pos1] = tmpPiece;
}


Puzzle Puzzle::applyMoveSeparate(Puzzle state, Move move){
    Puzzle newState(state);
    newState.applyMove(move);

    return newState;
}
Puzzle Puzzle::applyMoveSeparate(Move move){
    Puzzle newState(*this);
    newState.applyMove(move);

    return newState;
}

/**
Return the piece above the piece at the index,
return -1 if off of board
*/
int Puzzle::findAbovePos(int index){

    int abovePos = index - k;

    if((abovePos) < 0)  // out of bounds
        return -1;
    else
        return abovePos;
}

/**
Return the piece left the piece at the index,
return -1 if off of board
*/
int Puzzle::findLeftPos(int index){
    if( (index % k) == 0)
        return -1;

    int leftPos = index - 1;

    if( (leftPos+1 % k) == 0)
        return -1;
    else
        return leftPos;
}

/**
Return the piece to the right of the piece at the index,
return -1 if off of board
*/
int Puzzle::findRightPos(int index){
    int rightPos = index + 1;

    if ( (rightPos % k) == 0)
        return -1;
    else 
        return rightPos;
}

/**
Return the piece below the piece at the index,
return -1 if off of board
*/
int Puzzle::findBelowPos(int index){
    int belowPiece = index + k;
    int kSq = k*k;

    if((belowPiece) >= kSq)
        return -1;
    else
        return belowPiece;
}


int Puzzle::findPiece(int piece){
    int kSq = k*k;

    for(int i=0; i < kSq; i++){
        if(board[i] == piece)
            return i;
    }    
}

int Puzzle::findAt(int pos){
    return board[pos];
}
