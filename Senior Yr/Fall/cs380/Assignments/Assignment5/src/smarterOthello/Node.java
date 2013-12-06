/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package smarterOthello;

import cs380.othello.*;
import java.util.ArrayList;

/**
 *
 * @author Sunny
 */
public class Node {
    OthelloState state;
    Node parent;
    ArrayList<Node> children;
    OthelloMove move; // move that led to this state
    int visitCount;
    int avgScore;
    
    public Node(){
        state = null;
        parent = null;
        children = new ArrayList<Node> ();
        move = null;
        visitCount = 0;
        avgScore = 0;
    }
    
    public Node(Node parent, OthelloMove move){
        this.parent = parent;
        children = new ArrayList<Node>();
        this.move = move;
        visitCount = 0;
        avgScore = 0;
    }
    
    public void addChild(Node child){
        children.add(child);
    }
    
    public void setState(OthelloState state){
        this.state = state;
    }
}
