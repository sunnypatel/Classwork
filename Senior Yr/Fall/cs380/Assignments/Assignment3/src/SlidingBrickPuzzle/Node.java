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
    public Move move;
    public int depth;
    public double gFunc;
    public Puzzle state;
    
    public Node(Node parent){
        this.parent = parent;
        this.depth = parent.depth + 1;
        this.children = new ArrayList<Node>();
    }
    
    public Node(Puzzle state){
        this.state = state;
        this.parent = null;
        this.depth = 0;
        this.children = new ArrayList<Node>();
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
}
