/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SlidingBrickPuzzle;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.PriorityQueue;

/**
 *
 * @author sunnypatel
 */
public class A_star {

    public Node root;
    public LinkedList<Node> tree;
    Comparator<Node> openedComparator = new OpenedComparator();
    public PriorityQueue<Node> opened;
    //public HashMap<Double,LinkedList<Node>> closed;
    public ArrayList<Node> closed;
    
    public A_star(Puzzle initState) {
        tree = new LinkedList<Node>();
        opened = new PriorityQueue<Node>(10, openedComparator);
        //closed = new HashMap<Double,LinkedList<Node>>();
        closed = new ArrayList<Node>();
        // create root node
        this.root = new Node(initState);
        // add root node to tree
        this.tree.addLast(this.root);
    }
    
    public void run(){
        this.AStar_search(root);
    }
    
    public void AStar_search(Node start) {
        start.g = 0;
        start.h = heuristic(start);
        opened.add(start);

        while (!opened.isEmpty()) {
            
            // Print out the open array
            
            
      /*
            for( Node open : opened){
                if(open.move != null){
                open.move.printMove();
               System.out.print("  |  ");
                }
            }
            System.out.println();
            for( Node open : opened){
                if(open.move != null){
                System.out.print("  f()=  "+(open.g+open.h) + "  ");
                }
            }
            System.out.println();
     */
            
            
            
            
           // Node n = this.removeLowestF(opened);
            Node n = opened.poll();
      /*
            if(n.move != null){
                System.out.print("Picked:");
                n.move.printMove();
                System.out.println();
            }
       */
            if (this.goalTest(n)) {
                // return path to n
                //System.out.println("Solved!");
                
                this.printPath(n);
                n.state.printDimensions();
                n.state.printBoard();
                return;
            }
            // The linkedList with all nodes of the same h
            // adding nodes to closed list, hopefully...
         /*   double distFromZero = this.distFromZero(n);
            if(closed.get(distFromZero) != null){
                closed.get(distFromZero).addFirst(n);
            } else{
                LinkedList<Node> tmp = new LinkedList<Node>();
                tmp.addFirst(n);
                closed.put(distFromZero, tmp);
            }
            */
           closed.add(n);
            
            ArrayList<Move> allMoves = n.state.calculateAllMoves(n.state);
            
            
       /*
           System.out.println();
            System.out.println("************");
            n.state.printBoard();
           // System.out.println("g= " +n.g);
           // System.out.println("h= " +n.h);
            
            System.out.println("List all possible moves:");
            System.out.println("l=left, r=right, u=up, b=bottom");
       
            for (Move move : allMoves){
                System.out.println("allMoves="+move.getPiece()+" to "+ move.getDirection());
            }
            
       
            System.out.println("************");
            System.out.println();
        */
            
            
            // create children
            for (Move move : allMoves) {
                Node newChild = new Node(n);

                newChild.g = n.g + 1;
                
                newChild.move = move;
    //            System.out.println("Before:");
    //           n.state.printBoard();
                newChild.state = n.state.applyMoveSeparate(n.state, move);
    //            System.out.println("After:");
    //            newChild.state.printBoard();
                
                newChild.h = this.heuristic(newChild);
                
                // add as child only if not in closed already
                if (!checkIfClosed(newChild)) {
                    n.state.normalize();
                    n.addChild(newChild);
                    opened.add(newChild);
    /*                System.out.print("Made move: ");
                    move.printMove();
                   System.out.println();
   */                 
                    
                } else {
     /*         
                    System.out.print("Move was already made: ");
                    move.printMove();
                   System.out.println();
     */              
                }
                //System.out.println("done");
            }
            
            // temp ish
            int openSize = opened.size();
            if(openSize%1000 == 0){
          //      System.out.println("Opened size= " + openSize);
          //      System.out.println("Closed size= " +closed.size());
                /*for(Node closed : closed){
                    System.out.println("******************");
                    closed.state.printBoard();
                    System.out.println("******************");
                }*/
            }
        }
    }

    public void printPath(Node n){
        ArrayList<Move> successFullMoves = new ArrayList<Move>();
        //Node parent = n;
        
        while(n.parent != null){
            successFullMoves.add(0,n.move);
            n = n.parent;
        }
        for(Move m : successFullMoves){
            m.printMove();
            System.out.println();
        }
    }
    
    public boolean goalTest(Node a) {
        return a.state.checkPuzzle();
    }

    /**
     * Check if child node exists in closedNode already
     *
     * @param child
     * @param closedNode
     * @return
     */
    private boolean checkIfClosed(Node child) {
        if(child.move == null){
           // System.out.println("Child move is null");
            return false;
        }
      /*  LinkedList<Node> tmpBucket = closed.get(child.h);
        if(tmpBucket == null)
            return false;
        
        for(Node bucketNode : tmpBucket){
            if(bucketNode.equals(child))
                return true;
        }
        return false;
        */
        
        for (Node closeNode : this.closed) {
            if(closeNode.move == null){
               // System.out.println("Node in closed is move=null");
                //return false;
            } 
            else if (closeNode.move != null && child.move != null){
               // System.out.println("Both Nodes have moves**");
            }
            if (closeNode.equals(child)) {
               return true;
            }
        }
        return false;
        
        
    }

    private Node removeLowestF(ArrayList<Node> opened) {
        Node lowestF = opened.get(0);
        int indexOfLowestF = 0;
        for(int i=0; i< opened.size();i++){
            Node a = opened.get(i);
            if ((a.g + a.h) < (lowestF.g + lowestF.h)) {
                lowestF = a;
                indexOfLowestF = i;
            }           
        }
        // remove lowest F node from opened
        opened.remove(indexOfLowestF);
        return lowestF;
    }

    /**
     * Pretty ugly heuristic because it will run x*y time on a x*y board.
     *
     * @param a node
     * @return shortest distance to goal
     */
    public double heuristic(Node a) {
        ArrayList<Position> master = new ArrayList<Position>();
        ArrayList<Position> goal = new ArrayList<Position>();

        for (int w = 0; w < a.state.getW(); w++) {
            for (int h = 0; h < a.state.getH(); h++) {
                int piece = a.state.getPiece(w, h);
                if (piece == 2) {
                    // add you're position to masterBlock arrayList<Posotion>
                    master.add(new Position(w, h));

                } else if (piece == -1) {
                    // you're the goal block add yourself to the goal location
                    goal.add(new Position(w, h));
                }
            }
        }
        // Here we know that the master block is on the goal
        if(goal.isEmpty())
            return 0;
        
        
        // TODO now that we know where the goal block and master block,
        //      calculate the difference between them
        // Hold min distance
        double min = -1;
        for (Position mBlock : master) {
            for (Position gBlock : goal) {
                // Use the distance formula
                int tmpX = mBlock.getX() - gBlock.getX();
                int tmpY = mBlock.getY() - gBlock.getY();
                /*
                int tmp = (tmpX * tmpX) + (tmpY * tmpY);
                double dist = Math.sqrt(tmp);
                */
                double dist = tmpX + tmpY;
                if (min == -1) {
                    min = dist;
                } else if (dist < min) {
                    min = dist;
                }
                
                
                
            }
        }

        
        return min;
    }
    
    
        public double distFromZero(Node a) {
        ArrayList<Position> master = new ArrayList<Position>();
        ArrayList<Position> zero = new ArrayList<Position>();

        for (int w = 0; w < a.state.getW(); w++) {
            for (int h = 0; h < a.state.getH(); h++) {
                int piece = a.state.getPiece(w, h);
                if (piece == 2) {
                    // add you're position to masterBlock arrayList<Posotion>
                    master.add(new Position(w, h));

                } else if (piece == 0) {
                    // you're the zero block add yourself to the zero location
                    zero.add(new Position(w, h));
                }
            }
        }
        // Here we know that the master block is on the zero
        if(zero.isEmpty())
            return 0;
        
        
        // TODO now that we know where the zero block and master block,
        //      calculate the difference between them
        // Hold min distance
        double max = -1;
        for (Position mBlock : master) {
            for (Position gBlock : zero) {
                // Use the distance formula
                int tmpX = mBlock.getX() - gBlock.getX();
                int tmpY = mBlock.getY() - gBlock.getY();
                /*
                int tmp = (tmpX * tmpX) + (tmpY * tmpY);
                double dist = Math.sqrt(tmp);
                */
                double dist = tmpX + tmpY;
                if (max == -1) {
                    max = dist;
                } else if (dist > max) {
                    max = dist;
                }
                
                
                
            }
        }

        
        return max;
    }
}
