#include "Node.h"

Node::Node(){
	h=0;
	g=0;
}

Node::Node(Node* parentTmp){
	this->parent = parentTmp;
	h = 0;
	g = 0;

}

Node::Node(const Node& orig){
	parent = orig.parent;
    children = orig.children;
    move = orig.move;
    depth = orig.depth;
    g = orig.g;
    h = orig.h;
    state = orig.state;
}

Node::~Node(){

}

bool Node::operator()(Node& n1, Node& n2){

	int n1F = n1.g + n1.h;
	int n2F = n1.g + n1.h;

	if(n1F < n2F)
		return true;

	return false;
}

void Node::addChild(Node* child){
	children.push_back(child);
}

bool Node::equals(Node* n){
	if((n->move.equals(&this->move)) && (this->state.compare(&n->state)))
		return true;

	return false;
}