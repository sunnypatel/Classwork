/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package smarterOthello;

import cs380.othello.*;

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
}
