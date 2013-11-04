/*
 * To make life easier I made varibles public
 */
package SlidingBrickPuzzle;

import java.util.ArrayList;

/**
 *
 * @author sunnypatel
 */
public class Node {
    public Node parent;
    public ArrayList<Node> children;
    public Move move;                       // the move that was applied to get to this state
    public int depth;
    public double g;
    public double h;
    public Puzzle state;
    
    public Node(Node parent){
        this.parent = parent;
        this.depth = parent.depth + 1;
        this.children = new ArrayList<Node>();
        this.h = 0;
        this.g = 0;
        this.move = null;
    }
    
    public Node(Puzzle state){
        this.state = state;
        this.parent = null;
        this.depth = 0;
        this.children = new ArrayList<Node>();
        this.move = null;
        this.h = 0;
        this.g = 0;
    }
    
    public void addChild(Node child){
        this.children.add(child);
    }
    
    public void setState(Puzzle state){
        this.state = state;
    }
    
    public void setMove(Move m){
        this.move = m;
    }
    /**
     * Two nodes are considered equal if both their states are the same
     * and the move is the same
     * @param n
     * @return 
     */
    public boolean equals(Node n){
       /*if(this.state.compare(n.state))
           return true;
        */
         if((n.move.equals(this.move)) && (this.state.compare(n.state)))
            return true;
      /* if((n.move.equals(this.move)) && (this.h == n.h))
            return true;
        */
        return false;
    }
}
