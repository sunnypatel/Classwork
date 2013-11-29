/* 
 * File:   Move.h
 * Author: sunnypatel
 *
 * Created on November 16, 2013, 4:21 PM
 */

#ifndef MOVE_H
#define	MOVE_H

class Move {

public:
    Move();
    Move(const Move& orig);
    virtual ~Move();

    void setPositions(int a, int b);
private:
    int pos1;
    int pos2;
    
};

#endif	/* MOVE_H */

