/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SlidingBrickPuzzle;

import java.util.LinkedList;

/**
 *
 * @author sunnypatel
 */
public class UninformedSearchAlg {
    public LinkedList<Node> tree;
    
    public UninformedSearchAlg(){
        tree = new LinkedList<Node>();
    }
    
    public boolean goalTest(Node node){
        return node.state.checkPuzzle();
    }
    
    public void printNodeSol(Node solNode){
        
        if(solNode.depth>0){
            printNodeSol(solNode.parent);
            
        }
        solNode.move.printMove();
    }
}
