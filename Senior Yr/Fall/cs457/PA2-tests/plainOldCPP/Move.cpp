/* 
 * File:   Move.cpp
 * Author: sunnypatel
 * 
 * Created on November 16, 2013, 4:21 PM
 */

#include "Move.h"


Move::Move(int a, int b) {
	pos1 = a;
	pos2 = b;
}
Move::Move(){

}
Move::Move(const Move& orig) {
	pos1 = orig.pos1;
	pos2 = orig.pos2;
}

Move::~Move() {
}

void Move::setPositions(int a, int b){

	pos1 = a;
	pos2 = b;
}

void Move::printMove(){
	cout << "move " << pos1 << " to " << pos2;
}

int Move::getPos1(){
	return this->pos1;
}

int Move::getPos2(){
	return this->pos2;
}
