#include "Astar.h"



Astar::Astar(){

}

Astar::Astar(Puzzle initState){
	root.g =0;
	root.h = 0;
	root.state = initState;
	root.parent = NULL;
	//root.state.printBoard();
}

Astar::~Astar(){

}
vector<Move> Astar::printPath(Node* n){
	vector<Move> successMoves;
	vector<Move>::iterator it = successMoves.begin();
	int numMoves = 0;
	n->state.printBoard();

	for(int i =0; i < n->movesSoFar.size(); i++){
		n->movesSoFar[i].printMove();
		cout << endl;

		numMoves++;
	}
	cout << "# of moves " << numMoves << endl;
	return n->movesSoFar;
	
}

void Astar::printPathRec(Node* n){
	if(n->parent != NULL){
		printPathRec(n->parent);
	}
	n->move.printMove();
}

vector<Move> Astar::Astar_search(){
	root.g = 0;
	root.h = heuristic(&root);

	opened.push(root);

	while(!opened.empty()){
		
		Node n = opened.top();
		//Applyingcout << "openning --" << (n.h + n.g)<< endl;
		//cout << "Astar_search while loop";
		//n.state.printBoard();
	cout << "888888 REMOVEING 888888888 | open.size()=" << opened.size();
		opened.pop();
		cout << "  |   opened.size() after pop() = " << opened.size() << endl;
		cout << " ** Node n popped from open **" << endl;
		n.state.printBoard();
		
		cout << " n.f = " << (n.h + n.g) << endl;
	
		if(goalTest(&n)){
			cout << "goal reached!" << endl;
			return printPath(&n);
			
		}
		vector<Node>::iterator it = closed.begin();
		closed.insert(it, n);

		vector<Move> allMoves = n.state.calculateMoves();

		for(int moveInx=0; moveInx < allMoves.size(); moveInx++){
			Node newChild(n);

			newChild.g = n.g + 1;
			newChild.depth = n.depth + 1;
			newChild.move = allMoves[moveInx];
			newChild.parent = &n;

			newChild.addMove(allMoves[moveInx]);

			newChild.state = n.state.applyMoveSeparate(allMoves[moveInx]);
			
			newChild.h = heuristic(&newChild);


			if(!checkIfClosed(&newChild)){
			cout << "--- adding child ---" << endl;
				newChild.state.printBoard();
			cout << " f = " << (newChild.h + newChild.g)<< endl;
			cout << endl;
		
				n.addChild(newChild);
				opened.push(newChild);
			}
		}
		cout << "open size : " << opened.size() << endl;
		cout << "closed size : " << closed.size() << endl;
		/*if(opened.size() == 100){
		//	cout << "open size : " << opened.size() << endl;
			cout << "********** printing open ****** " << endl;
			printOpen();	
		}
		*/
	}
}

void Astar::printOpen(){
	while(!opened.empty()){
		Node x = opened.top();
		cout << " " << x.h + x.g;
		opened.pop();
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
	vector<int> tmpBoard = n->state.board;

/*	for(int i=0; i< tmpBoard.size(); i++){
		if( i == 15){
			if(tmpBoard[15] != 0)
				return false;
		}
		if(tmpBoard[i] != i+1)
			return false;


	}
*/
	sleep(100);		
	if(heuristic(n) == 0)
		return true;
	else
		return false;
	
	cout << "IN GOALTEST = TRUE" << endl;
	return true;
	
}

int Astar::heuristic(Node* a){
	int h = 0;
	Puzzle* tmp = &a->state;

	for(int i=0; i < tmp->getBoard().size() ; i++){
		h = h + distanceFromGoal(tmp->findAt(i), i, tmp->getK());
	}
		
	return h;
}

int Astar::distanceFromGoal(int piece, int pos, int k){

	int x1=0;
	int x2=0;
	int y1=0;
	int y2=0;

	//piece = piece - 1;
	if(piece == 0) {
		x1 = k-1;
		y1 = k-1;
	} else {
	  // X1 and Y1 is the position of the piece in the solved puzzle board
		x1 = piece % k;
		y1 = ((piece - x1) / k) + 1;  // which 'row' piece is on in the solved puzzle
	}


	// X2 and Y2 is the position of piece in the current puzzle state
	x2 = pos % k;
	y2 = ((pos - x2) / k) + 1;

	// use the variation of distance formula
	int dist = abs(x1 - x2) + abs(y1 - y2);

	// if i calulated this correctly, it should be the manhattan distance 
	return dist;

}
