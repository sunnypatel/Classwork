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
#include <math.h>
#include <cmath>
#include <fstream>
 
using namespace std;
struct CompareNode {
    bool operator()(Node const & n1, Node const & n2) {
        // return "true" if "p1" is ordered before "p2", for example:
        int n1F = n1.g + n1.h;
        int n2F = n2.g + n1.h;
        return n1F < n2F;
    }
};

class Astar {
    Node root;
    priority_queue<Node, vector<Node>, CompareNode> opened;
    vector<Node> closed;

public:
    Astar();
    Astar(Puzzle initState);
    Astar(const Astar& orig);
    ~Astar();
   
    void Astar_search(Node*);
    vector<Move> Astar_search();
    int heuristic(Node*);
    int distanceFromGoal(int, int, int);
    bool goalTest(Node* n);
    bool checkIfClosed(Node* child);
    void printOpen();
    vector<Move> printPath(Node* n);
    void printPathRec(Node*);
};

#endif	/* ASTAR_H */

