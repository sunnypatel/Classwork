/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SlidingBrickPuzzle;

import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author sunnypatel
 */
public class main {
    public static void main(String[] args){
        Puzzle brickPuzzle = new Puzzle();
        
        Scanner user_input = new Scanner( System.in );
        System.out.println("Enter filename to load:");
        //String filename = user_input.next();
        String filename = "SBP-level2.txt";
        // String filename = "test-not-normalized.txt";
        brickPuzzle.load(filename);
        brickPuzzle.printBoard();
        
        System.out.println("Is puzzle solved="+brickPuzzle.checkPuzzle());
        /** 
        brickPuzzle.normalize();
        brickPuzzle.printBoard();
       
        ArrayList<Move> moves = new ArrayList<Move>();
        moves = brickPuzzle.calculateMoves(brickPuzzle, 3);
        
        System.out.println("Possible Moves for block 3");
        for (Move move : moves){
            System.out.println(move.getDirection());
        }
        
        System.out.println("List all possible moves:");
        System.out.println("l=left, r=right, u=up, b=bottom");
        ArrayList<Move> allMoves = new ArrayList<Move>();
        allMoves = brickPuzzle.calculateAllMoves(brickPuzzle);
        
        for (Move move : allMoves){
            System.out.println("allMoves="+move.getPiece()+" to "+ move.getDirection());
        }
        
         //System.out.println("Number of blocks=" + brickPuzzle.numberOfBlocks());
        
        
        // Pick a move and apply it
        System.out.println("Pick the first move and apply it");
        brickPuzzle.applyMove(brickPuzzle, allMoves.get(0));
        brickPuzzle.printBoard();
        
        System.out.println("Pick the next move and apply it to separate board.");
        brickPuzzle.applyMoveSeparate(brickPuzzle, allMoves.get(1));
        
        
        
        brickPuzzle.printBoard();
        
        */
        A_star searchAlg = new A_star(brickPuzzle);
        searchAlg.run();
        /*if(goalNode != null)
            //searchAlg.printNodeSol(goalNode);
            System.out.println("Horreay");
        else
            System.out.println("No solution found!");
        */
    }
    
}
