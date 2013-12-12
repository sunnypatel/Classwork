/* 
 * File:   Puzzle.h
 * Author: sunnypatel
 *
 * Created on November 16, 2013, 4:02 PM
 */

#ifndef NODE_H
#define	NODE_H

#include <vector>
#include <iostream>
#include <queue>
#include "Puzzle.h"
 #include "Node.h"

using namespace std;

class Node {

public:
    Node* parent;
    vector<Node> children;
    Move move;
    int depth;
    int hash;
    double g;
    double h;
    Puzzle state;
    vector<Move> movesSoFar;

	Node();
    Node(Node*);
    Node(const Node& orig);
    ~Node();
   
    void addChild(Node);
    void addMove(Move);
    void setParent(Node p);
    bool operator()(Node& n1, Node& n2);
    bool equals(Node* n);
};

#endif	/* NODE_H */

