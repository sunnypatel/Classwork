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
public class monty {
    public monty(){
        
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
    public OthelloState defaultPolicy(Node node){
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
        
        return tmpNode.state;
    }
}
