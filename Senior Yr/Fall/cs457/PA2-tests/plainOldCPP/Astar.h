/* 
 * File:   Puzzle.h
 * Author: sunnypatel
 *
 * Created on November 16, 2013, 4:02 PM
 */

#ifndef ASTAR_H
#define	ASTAR_H

#include <vector>
#include <iostream>
#include <queue>
#include "Puzzle.h"
 #include "Node.h"

using namespace std;

class Astar {
    Node root;
    priority_queue<Node, vector<Node>, Node> opened;
    vector<Node> closed;

public:
    Astar();
    Astar(const Astar& orig);
    ~Astar();
   
    void Astar_search(Node*);
    int heuristic(Node*);
    int distanceFromGoal(int, int);
};

#endif	/* ASTAR_H */

