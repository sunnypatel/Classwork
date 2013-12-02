#include "Astar.h"

Astar::Astar(){
	
}

Astar::Astar(Puzzle initState){
	Node root;
	root.state = initState;
}

Astar::~Astar(){

}

void Astar::Astar_search(Node* root){
	root->g = 0;
	root->h = heuristic(root);

	opened.push(root);

	while(!opened.empty()){
		Node n = opened.top();
		opened.pop();

		if(goalTest(&n)){
			cout << "goal reached!" << endl;
		}
		vector<Node>::iterator it = closed.begin();
		closed.insert(it, n);

		vector<Move> allMoves = n.state.calculateMoves();

		for(int moveInx=0; moveInx < allMoves.size(); moveInx++){
			Node newChild(n);

			newChild.g = n.g + 1;
			newChild.move = allMoves[moveInx];
			
			newChild.state = n.state.applyMoveSeparate(allMoves[moveInx]);

			newChild.h = heuristic(&newChild);

			if(!checkIfClosed(&newChild)){
				n.addChild(&newChild);
				opened.push(newChild);
			}
		}


	}
}


bool Astar::checkIfClosed(Node* child){
	

	for(int i=0; i<closed.size(); i++){
		if(closed[i].equals(child))
			return true;
	}
	return false;
}

bool Astar::goalTest(Node* n){
	if(heuristic(n) == 0)
		return true;
	else
		return false;
}

int Astar::heuristic(Node* a){
	int h = 0;
	Puzzle* tmp = &a->state;

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

	// use the variation of distance formula
	int dist = abs(x1 - x2) + abs(y1 - y2);
	

	// if i calulated this correctly, it should be the manhattan distance 
	return dist;

}