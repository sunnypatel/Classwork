#include "Node.h"

Node::Node(){
	parent = NULL;
	h=0;
	g=0;
	depth = 0;
}

Node::Node(Node* parentTmp){
	parent = parentTmp;
	h = 0;
	g = 0;
	depth = 0;
}

Node::Node(const Node& orig){
	parent = orig.parent;
    children = orig.children;
    move = orig.move;
    depth = orig.depth;
    g = orig.g;
    h = orig.h;
    hash = orig.hash;
    state = orig.state;
   movesSoFar = orig.movesSoFar;
}

Node::~Node(){

}

void Node::setParent(Node p){
	parent = &p;
}

void Node::addMove(Move move){
	movesSoFar.push_back(move);
}

void Node::addChild(Node child){
	
	children.push_back(child);
}

bool Node::equals(Node* n){
	if((n->move.equals(&this->move)) && (this->state.compare(&n->state)))
		return true;

	return false;
}