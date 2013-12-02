#include "Astar.h"

Astar::Astar(){

}

Astar::~Astar(){

}

void Astar::Astar_search(Node* root){
	root->g = 0;
	root->h = heuristic(root);
}

int Astar::heuristic(Node* a){
	int h = 0;
	Puzzle* tmp = a->state;

	for(int i=0; tmp->getBoard().size() ; i++){
		h = h + distanceFromGoal(tmp->findAt(i), i, tmp->getK());
	}
	return h;
}

int Astar::distanceFromGoal(int piece, int pos, int k){

	int x1=0;
	int x2=0;
	int y1=0;
	int y2=0;

	// X1 and Y1 is the position of the piece in the solved puzzle board
	x1 = piece % k;
	y1 = ((piece - x1) / k) + 1;  // which 'row' piece is on in the solved puzzle

	// X2 and Y2 is the position of piece in the current puzzle state
	x2 = pos % k;
	y2 = ((pos - x2) / k) + 1;

	// use the floor of distance formula and just add 1
	//int dist = pow((x1 - x2), 2) + pow((y1 - y2), 2);
	//dist = sqrt(dist) + 1; // since it's an integer it already gets floored and the just add one
	int dist = abs(x1 - x2) + abs(y1 - y2);
	

	// if i calulated this correctly, it should be the manhattan distance 
	return dist;

}