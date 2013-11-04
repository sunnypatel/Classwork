/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SlidingBrickPuzzle;

import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author sunnypatel
 */
public class Puzzle extends GameBoard {

    public Puzzle() {
    }

    public Puzzle(int x, int y) {
        this.setBoard(this.createBoard(x, y));
    }

    public Puzzle(ArrayList<ArrayList> newBoard) {
        this.setBoard(newBoard);
    }

    // Create a 2-dim matrix of size X x Y. 
    // TODO: Make this pass by reference for performance 
    private ArrayList<ArrayList> createBoard(int x, int y) {

        // create a X x Y game board
        ArrayList<ArrayList> tempBoard = new ArrayList<ArrayList>();

        for (int j = 0; j < y; j++) {
            ArrayList row = new ArrayList();

            for (int i = 0; i < x; i++) {
                row.add(0);
            }
            tempBoard.add(row);
        }

        return tempBoard;
    }

    /**
     * Checks if the puzzle has been solved.
     *
     * @return
     */
    public boolean checkPuzzle() {
        return !this.contains(-1);
    }

    /**
     * Calculates all possible moves for a given piece in a state
     *
     * @param state
     * @param piece
     * @return
     */
    public ArrayList<Move> calculateMoves(GameBoard state, int piece) {
        // Does the piece exist on the game board
        if (state.contains(piece)) {
            //System.out.println("inside if1");
            // ArrayList of all the moves for this block
            ArrayList allMoves = new ArrayList();
            // how big / shape of piece
            int pieceSize_count = 0;

            // Loop through state looking for piece
            for (int i = 0; i < state.getW(); i++) {
                for (int j = 0; j < state.getH(); j++) {
                    if (state.getPiece(i, j) == piece) {
                        pieceSize_count++;

                        // Once you found the piece, look above it see if it is a zero or the same number
                        // if it is then save the direction up in possibleMoves
                        ArrayList moves = new ArrayList();

                        Position pos = new Position(i, j);
                        // Check UP
                        if (state.getPieceAbove(pos, state) == piece || state.getPieceAbove(pos, state) == 0) {
                            moves.add('u');
                        }
                        // Check RIGHT
                        if (state.getPieceRight(pos, state) == piece || state.getPieceRight(pos, state) == 0) {
                            moves.add('r');
                        }
                        // Check BELOW
                        if (state.getPieceBelow(pos, state) == piece || state.getPieceBelow(pos, state) == 0) {
                            moves.add('b');
                        }
                        // Check LEFT
                        if (state.getPieceLeft(pos, state) == piece || state.getPieceLeft(pos, state) == 0) {
                            moves.add('l');
                        }
                        
                        /**
                         * Check if goal state is available
                         */
                        if ( (state.getPieceAbove(pos, state) == -1)  && (piece == 2))
                            moves.add('u');
                        if ( (state.getPieceRight(pos, state) == -1)  && (piece == 2))
                            moves.add('r');
                        if ( (state.getPieceBelow(pos, state) == -1)  && (piece == 2))
                            moves.add('b');
                        if ( (state.getPieceLeft(pos, state) == -1)  && (piece == 2))
                            moves.add('l');
                        

                        // Only save those moves that are similar to the number nxt to me
                        allMoves.addAll(moves);

                    }
                }
            }

            ArrayList<Move> possibleMoves = new ArrayList<Move>();
            for (Object direction : allMoves) {
                // Make sure the moves are possible for the entire block, not just a part of it.
                int count = Collections.frequency(allMoves, direction);
                if (count == pieceSize_count) {
                    Move move = new Move(piece, direction.toString().charAt(0));
                    
                   
                    // has the move already being added?
                    boolean newMove = true;
                    // search through and make sure it has been added to possibleMove already.
                    for (Move possibleMove : possibleMoves) {
                        if (possibleMove.equals(move)) {
                            newMove = false;
                        }
                    }
                    if (newMove) {
                        possibleMoves.add(move);
                    }
                }
            }


            // return all possible moves for this block
            return possibleMoves;
        } else {
            // Piece isnt even on the board
            // return empty list
            return new ArrayList<Move>();
        }
    }

    /**
     * Calculates all possible moves for a given state
     *
     * @param state
     * @return
     */
    public ArrayList<Move> calculateAllMoves(GameBoard state) {
        ArrayList<Move> allMoves = new ArrayList<Move>();
        // calculate the number of blocks there are in the puzzle
        int lastBlock = this.numberOfBlocks();

        for (int i = 2; i <= lastBlock; i++) {
            allMoves.addAll(this.calculateMoves(state, i));
        }

        return allMoves;
    }

    /**
     * Apply the move to the state given
     *
     * @param state
     * @param move
     * @return state after move was applied
     */
    public Puzzle applyMove(Puzzle state, Move move) {
        // Starts to move each piece one by one 
        // If the move is UP OR Left start from the top down
        // if the move is Down OR Right start from the bottom up
        int debug_counter =0;
        // ABOVE
        if (move.getDirection() == 'u') {
            
            for (int j = 0; j < state.getH(); j++) {
                for (int i = 0; i < state.getW(); i++) {

                    if (state.getPiece(i, j) == move.getPiece()) {
                        if ( (getPieceAbove(i, j, state) == 0) || ( (getPieceAbove(i, j, state) == -1)&&(move.getPiece()==2) )) {
                            Position curPos = new Position(i, j);
                            // actually make the move happen, moves the values over
                            makeMove(curPos, move.apply(curPos), state);
                            debug_counter++;
                        }
                    }
                }
            }
           // System.out.println("Number of digits moved: " + debug_counter);
        }

        // LEFT
        if (move.getDirection() == 'l') {
            //   System.out.println("applying move left");
            int j;
            int x=0;
            for ( j = 0; j < state.getH(); j++) {
                for (x = 0; x < state.getW(); x++) {
// Integer is an object!!! state.getPiece is an int!
                    //System.out.println("state.getPiece = "+state.getPiece(x,j) + "move.getPiece() ="+move.getPiece());
                    if (state.getPiece(x, j) == move.getPiece()) {
                      //  System.out.println("Inside first if");
                      //  System.out.println("getPieceLeft=" + getPieceLeft(x, j, state));
                        if ( (getPieceLeft(x, j, state) == 0) || ( (getPieceLeft(x, j, state) == -1)&&(move.getPiece()==2) )) {
                          //  System.out.println("inside 2nd if");
                            Position curPos = new Position(x, j);
                            // actually make the move happen, moves the values over
                            makeMove(curPos, move.apply(curPos), state);
                            debug_counter++;
                        }
                    }
                }
            }
          //  System.out.println("Number of digits moved: " + debug_counter);
          //  System.out.println("x="+x+"   j="+j);
        }


        // RIGHT
        // same as above but run backwards
        if (move.getDirection() == 'r') {
            for (int j = state.getH() - 1; j >= 0; j--) {
                for (int i = state.getW() - 1; i >= 0; i--) {

                    if (state.getPiece(i, j) == move.getPiece()) {
                        if ((getPieceRight(i, j, state) == 0) || ( (getPieceRight(i, j, state) == -1)&&(move.getPiece()==2) )) {
                            Position curPos = new Position(i, j);
                            // actually make the move happen, moves the values over
                            makeMove(curPos, move.apply(curPos), state);
                        }
                    }
                }
            }
        }

        // BELOW
        // same as above but run backwards
        if (move.getDirection() == 'b') {
            for (int j = state.getH() - 1; j >= 0; j--) {
                for (int i = state.getW() - 1; i >= 0; i--) {

                    if (state.getPiece(i, j) == move.getPiece()) {
                        if ( (getPieceBelow(i, j, state) == 0) || ( (getPieceBelow(i, j, state) == -1)&&(move.getPiece()==2) )) {
                            Position curPos = new Position(i, j);
                            // actually make the move happen, moves the values over
                            makeMove(curPos, move.apply(curPos), state);
                        }
                    }
                }
            }
        }


        state.normalize();
        return state;

    }

    public Puzzle applyMoveSeparate(Puzzle state, Move move) {
        // Clone the original board and make a new one.
        Puzzle newBoard = new Puzzle(state.getW(),state.getH());
        //state.printDimensions();
        for (int h = 0; h < state.getH(); h++) {
            for (int w = 0; w < state.getW(); w++) {
                newBoard.setPiece(w, h, state.getPiece(w, h));
            }
        }
        //newBoard.printDimensions();
        // Use the applyMove method to make the move on this new board of ours
        newBoard = this.applyMove(newBoard, move);
        newBoard.normalize();
        return newBoard;
    }

    public void makeMove(Position pos1, Position pos2, Puzzle state) {
        // get the value in pos1 and put it in pos2
        // change pos1 to 0

        int piece = state.getPiece(pos1);
        int piece2 = state.getPiece(pos2);

        if (piece2 == 0 || piece2 == -1) {

            state.setPiece(pos2, piece);
            state.setPiece(pos1, (Integer) 0);
        }
    }

    public int numberOfBlocks() {
        int maxNum = 0;

        for (int j = 0; j < this.getBoard().size(); j++) {
            for (Object x : this.getBoard().get(j)) {
                if ((Integer) x > maxNum) {
                    maxNum = (Integer) x;
                }
            }
        }
        return maxNum;
    }
    
    
    public void normalize(){
        int nextIdx=3;
        for(int h=0; h < this.getH(); h++){
            for(int w=0; w < this.getW(); w++){
                if(this.getPiece(w, h)==nextIdx){
                    nextIdx++;
                } else if(this.getPiece(w,h) > nextIdx){
                    this.swapIdx(nextIdx,this.getPiece(w,h));
                    nextIdx++;
                }
            }
        }
    }
    
    public void swapIdx(int idx1, int idx2){
        for(int h=0; h < this.getH(); h++){
            for(int w=0; w < this.getW(); w++){
                if(this.getPiece(w,h) == idx1){
                    this.setPiece(w, h, idx2);
                } else if (this.getPiece(w,h) == idx2){
                    this.setPiece(w, h, idx1);
                }
            }
        }
    }
    
}
