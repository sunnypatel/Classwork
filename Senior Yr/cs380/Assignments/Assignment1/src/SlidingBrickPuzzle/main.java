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
public class main {
    public static void main(String[] args){
        Puzzle brickPuzzle = new Puzzle();
        
        brickPuzzle.load("SBP-level0.txt");
        brickPuzzle.printBoard();
        
        System.out.println("Solved="+brickPuzzle.checkPuzzle());
        
        ArrayList<Move> moves = new ArrayList<Move>();
        moves = brickPuzzle.calculateMoves(brickPuzzle, 3);
        
        System.out.println("Possible Moves for block 3");
        for (Move move : moves){
            System.out.println(move.getDirection());
        }
        ArrayList<Move> allMoves = new ArrayList<Move>();
        allMoves = brickPuzzle.calculateAllMove(brickPuzzle);
        
        for (Move move : allMoves){
            System.out.println("allMoves="+move.getPiece()+" to "+ move.getDirection());
        }
        System.out.println("Number of blocks=" + brickPuzzle.numberOfBlocks());
        
        brickPuzzle.applyMove(brickPuzzle, allMoves.get(0));
        brickPuzzle.printBoard();
        brickPuzzle.appleMoveSeparate(brickPuzzle, allMoves.get(1));
        
        
        
        brickPuzzle.printBoard();
    }
}
