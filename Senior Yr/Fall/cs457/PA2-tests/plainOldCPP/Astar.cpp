#include "Astar.h"

Astar::Astar(){

}

Astar::~Astar(){

}

void Astar::Astar_search(Node* root){
	root.g = 0;
	root.h = heuristic(root);
}

int Astar::heuristic(Node* a){

}

int Astar::distanceFromGoal(int piece, int pos){
	
}