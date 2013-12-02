/* 
 * File:   Position.cpp
 * Author: sunnypatel
 * 
 * Created on November 16, 2013, 4:23 PM
 */

#include <stdlib.h>

#include "Position.h"

Position::Position() {
    this->x = 0;
    this->y = 0;
    
}

Position::Position(const Position& orig) {
}

Position::~Position() {
}

/**
 * check if position is out of bounds
 * @param state
 * @return 
 */
//bool outOfBounds(Puzzle state){
  //  return false;
//}

/**
 * Returns the X coordinate
 * @return 
 */
int Position::getX(){
    return this->x;
}
/**
 * Return the Y coordinate
 * @return 
 */
int Position::getY(){
    return this->y;
}

void Position::setX(int x){
    this->x = x;
}

void Position::setY(int y){
    this->y = y;
}
