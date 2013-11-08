/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SlidingBrickPuzzle;

import java.util.ArrayList;

/**
 *
 * @author sunnypatel
 */
public class BreadthFirst extends UninformedSearchAlg {
    public Node root;
    
    public BreadthFirst(Puzzle initState){
        // create root node
        this.root = new Node(initState);
        // add root node to tree
        this.tree.addLast(this.root);
    }
    
    public Node expand(Node node){
        // Get all the moves for this node,
        // thus get all children of this node
        ArrayList<Move> allMoves = new ArrayList<Move>();
        allMoves = node.state.calculateAllMoves(node.state);
        
        for (Move move : allMoves){
           //if((node != this.root) && (!node.parent.move.equals(move))){
                Puzzle newState = node.state.applyMoveSeparate(node.state, move);

                // create new node w/ this node as it's parent
                Node newNode = new Node(node);
                // set newNode move to be the move that got it here
                newNode.setMove(move);
                // add this newNode as child of parent node
                node.addChild(newNode);
                // set puzzle state of this new node
                newNode.setState(newState);
                this.tree.addFirst(newNode);

                
                
          //  }
        }
        
        // expand all of this node's children one by one that are not already expanded
        for(Node child : node.children){
            if(child.children == null){
                Node innerNode = this.expand(child);
                if(innerNode != null){
                    return innerNode;
                }
            }
        }
        
        return null;
    }
    
    public Node search(Node node){
        if(this.goalTest(node))
            return node;
        
        Node newSearch;
        if(tree.size()>1){
            // for inner nodes only
            newSearch = expand(tree.removeFirst());
        }
        else{
            // for root node only
            newSearch = expand(tree.getFirst());
        }
        if(newSearch != null)
            return newSearch;
        
        return null;
    }
    
    public Node run(){
        return this.search(tree.getFirst());
    }
}
