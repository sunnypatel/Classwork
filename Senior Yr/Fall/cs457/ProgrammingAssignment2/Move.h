/* 
 * File:   Move.h
 * Author: sunnypatel
 *
 * Created on November 16, 2013, 4:21 PM
 */

#ifndef MOVE_H
#define	MOVE_H

#include "Position.h"

class Move {

public:
    Move();
    Move(const Move& orig);
    virtual ~Move();
private:
    Position pos1;
    Position pos2;
    
};

#endif	/* MOVE_H */

