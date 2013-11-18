/* 
 * File:   Position.h
 * Author: sunnypatel
 *
 * Created on November 16, 2013, 4:23 PM
 */

#ifndef POSITION_H
#define	POSITION_H

#include "Puzzle.h"

class Position {
    
public:
    Position();
    Position(const Position& orig);
    virtual ~Position();
    
    int getX();
    int getY();
    void setX(int x);
    void setY(int y);
    bool outOfBounds(Puzzle state);
    
private:
    int x;
    int y;
};

#endif	/* POSITION_H */

