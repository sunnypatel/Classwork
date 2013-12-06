/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package smarterOthello;

import cs380.othello.*;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

/**
 *
 * @author sunnypatel
 */
public class monty extends OthelloPlayer {
    public monty(){
        
    }
    
    @Override
    public OthelloMove getMove(OthelloState state) {
        int iterations = 100000;
        return this.MonteCarloTreeSearch(state, iterations).move;
    }    
    /**
     * MonteCarloTreeSearch(board,iterations):
        root = createNode(board);
        for i = 0...iterations:
          node = treePolicy(root);
          if (node!=null)
            node2 = defaultPolicy(node);
            Node2Score = score(node2);
            backup(node,Node2Score);
        return action(bestChild(root))
     * @param board
     * @return 
     */
    public Node MonteCarloTreeSearch(int[][] board, int iterations){
        Node root = createNode(board);
        for(int i=0; i<iterations; i++){
            Node node = treePolicy(root);
            if(node!=null){
                Node node2 = defaultPolicy(node);
                int node2Score = score(node2);
                backup(node, node2Score);
            }
        }
        return bestChild(root);
    }
    
    public Node MonteCarloTreeSearch(OthelloState state, int iterations){
        Node root = new Node(null, state);
        for(int i=0; i<iterations; i++){
            Node node = treePolicy(root);
            if(node!=null){
                Node node2 = defaultPolicy(node);
                int node2Score = score(node2);
                backup(node, node2Score);
            }
        }
        return bestChild(root);
    }    
    
    public Node createNode(int[][] board){
        Node newNode = new Node();
        if(board[0].length > 0){
            OthelloState state = new OthelloState(board[0].length);

            newNode.setState(state);
        }
        return newNode;
    }
    
    public Node bestChild(Node node){
        Node returnChild = null;
        if(node.state.getNextPlayerToMove() == node.state.PLAYER1){
            
            for(Node child : node.children){
                if(returnChild == null)
                    returnChild = child;
                
                if(child.avgScore > returnChild.avgScore)
                    returnChild = child;
            }
            return returnChild;
        }
        
        if(node.state.getNextPlayerToMove() == node.state.PLAYER2){
            
            for(Node child : node.children){
                if(returnChild == null)
                    returnChild = child;
                
                if(child.avgScore < returnChild.avgScore)
                    returnChild = child;
            }
            return returnChild;            
        }

        return returnChild;
    }
    
    public Node treePolicy(Node node){
        // If 'node' still has any children that are not in the tree,
        // then it generates one of those children ('newnode'),
        // it adds 'newnode' as a child to 'node', and returns 'newnode'  
        List<OthelloMove> possibleMoves = node.state.generateMoves();
        List<OthelloMove> alreadyHaveMoves = new LinkedList<OthelloMove>();
        
        if(possibleMoves.size() != node.children.size()){
            for(OthelloMove move : possibleMoves){
                boolean found = false;
                // Search through all the children
                for(Node child : node.children){
                    if(move.equals(child.move)){
                        found = true;
                    }
                }
                // if found a move that isnt a childNode then create it and add
                if(!found){
                    // a child with this move was not found
                    // generate this child and add it
                    Node newChild = new Node(node, node.state.applyMoveCloning(move));
                    node.addChild(newChild);   
                    return newChild;
                }
            }
        }
        
        // If 'node' is a terminal node (no actions can be performed). Then it returns "node"
        if(possibleMoves.isEmpty())
            return node;
        
        // If 'node' is not a terminal but all its children are in the tree,
        // then: 90% of the times "nodetmp = bestChild(node)",
        // and 10% of the times "nodetmp = [a child of node at random]" (if you are curious,
        // this is called an epsilon-greedy strategy).
        // Then, the function returns "treePolicy(nodetmp)"
        Random r = new Random();
        Node tmpNode = null;
        if(r.nextInt(10) == 9){
            //10% of the times "nodetmp = [a child of node at random]"
            tmpNode = node.children.get(r.nextInt(node.children.size()));
        } else {
            // 90% of the times "nodetmp = bestChild(node)"
            tmpNode = this.bestChild(node);
        }
        return treePolicy(tmpNode);
    }
    
    /**
     * This function just uses the random agent to select actions at random for each player,
     * until the game is over, and returns the final state of the game.
     */
    public Node defaultPolicy(Node node){
        OthelloRandomPlayer randomPlayer = new OthelloRandomPlayer();
        List<OthelloMove> possibleMoves = node.state.generateMoves();
        
        Node tmpNode = node;
        boolean gameOver = false;
        
        while(!gameOver){
            OthelloMove move = randomPlayer.getMove(tmpNode.state);
            tmpNode.state.applyMove(move);
            
            if(tmpNode.state.gameOver())
                gameOver = true;
        }
        
        return tmpNode;
    }
    
    /**
     * Returns the score of the game.
     * 
     * @param node
     * @return 
     */
    public int score(Node node){
        return node.state.score();
    }
    
    /**
     * Increments in 1 the number of times "node" has been visited,
     * and updates the average score in "node" with the value "score"
     * If "node" has a parent, then it calls "backup(node.parent,score)".
     * @param node
     * @param score 
     */
    public void backup(Node node, int score){
        node.visitCount++;
        node.avgScore = score;
        
        if(node.parent != null){
            this.backup(node.parent, score);
        }
    }


}
