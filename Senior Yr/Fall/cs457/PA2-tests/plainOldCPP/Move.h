/* 
 * File:   Move.h
 * Author: sunnypatel
 *
 * Created on November 16, 2013, 4:21 PM
 */

#ifndef MOVE_H
#define	MOVE_H

#include <iostream>

using namespace std;

class Move {

    int pos1;
    int pos2;

public:
	Move();
    Move(int, int);
    Move(const Move& orig);
    virtual ~Move();

    void setPositions (int, int);

    void printMove();

    int getPos1();
    int getPos2();

    
};

#endif	/* MOVE_H */

