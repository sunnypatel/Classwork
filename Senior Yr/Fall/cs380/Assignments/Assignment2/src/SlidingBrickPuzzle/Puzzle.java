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
public class Puzzle extends GameBoard{
    
    
    
    /**
     * Checks if the puzzle has been solved.
     * @return 
     */
    public boolean checkPuzzle(){
        return !this.contains(-1);
    }
    
    /**
     * Calculates all possible moves for a given piece in a state
     * @param state
     * @param piece
     * @return 
     */
    public ArrayList<Move> calculateMoves(GameBoard state, int piece){
        // Does the piece exist on the game board
        if(state.contains(piece)){
            //System.out.println("inside if1");
            // ArrayList of all the moves for this block
            ArrayList allMoves = new ArrayList();
            
            // Loop through state looking for piece
            for(int i=0; i<state.getW(); i++){
                for(int j=0; j<state.getH(); j++){
                    if(state.getPiece(i,j) == piece){
                        
                        
                        // Once you found the piece, look above it see if it is a zero or the same number
                        // if it is then save the direction up in possibleMoves
                        ArrayList moves = new ArrayList();
                        
                        Position pos = new Position(i,j);
                        // Check UP
                        if(state.getPieceAbove(pos) == piece || state.getPieceAbove(pos) == 0){
                            moves.add('u');
                        }
                        // Check RIGHT
                        if(state.getPieceRight(pos) == piece || state.getPieceRight(pos) == 0){
                            moves.add('r');
                        }                       
                        // Check BELOW
                        if(state.getPieceBelow(pos) == piece || state.getPieceBelow(pos) == 0){
                            moves.add('b');
                        }                         
                        // Check LEFT
                        if(state.getPieceLeft(pos) == piece || state.getPieceLeft(pos) == 0){
                            moves.add('l');
                        }                          
                        
                        
                        // Only save those moves that are similar to the number nxt to me
                        if(allMoves.isEmpty()){
                            allMoves.addAll(moves);
                        } else{
                            allMoves.retainAll(moves);
                        }
                    }
                }
            }
            ArrayList<Move> possibleMoves = new ArrayList<Move>();
            for(Object direction : allMoves){
                possibleMoves.add(new Move(piece, direction.toString().charAt(0)));
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
     * @param state
     * @return 
     */
    public ArrayList<Move> calculateAllMove(GameBoard state){
        ArrayList<Move> allMoves = new ArrayList<Move>();
        // calculate the number of blocks there are in the puzzle
        int lastBlock = this.numberOfBlocks();
        
        for(int i=2; i<=lastBlock; i++){
            allMoves.addAll(this.calculateMoves(state,i));
        }
        
        return allMoves;
    }
    
    /**
     * Apply the move to the state given
     * @param state
     * @param move
     * @return state after move was applied
     */
    public GameBoard applyMove(GameBoard state, Move move){
        // Starts to move each piece one by one 
        // If the move is UP OR Left start from the top down
        // if the move is Down OR Right start from the bottom up
        
        // ABOVE
        if(move.getDirection() == 'u'){
            for(int j=0; j<state.getH(); j++){
                for(int i=0; i<state.getW(); i++){
                    
                    if(state.getPiece(i, j) == move.getPiece()){
                        if(getPieceAbove(i,j) == 0){
                            Position curPos = new Position(i,j);
                            // actually make the move happen, moves the values over
                            makeMove(curPos, move.apply(curPos));
                        }
                    }
                }
            }
        }
        
        // LEFT
        if(move.getDirection() == 'l'){
         //   System.out.println("applying move left");
            for(int j=0; j<state.getH(); j++){
                for(int i=0; i<state.getW(); i++){
                    
                    if(state.getPiece(i, j) == move.getPiece()){
                        
                        if(getPieceLeft(i,j) == 0){
                            
                            Position curPos = new Position(i,j);
                            // actually make the move happen, moves the values over
                            makeMove(curPos, move.apply(curPos));
                        }
                    }
                }
            }
        }
        
        
        // RIGHT
        // same as above but run backwards
        if(move.getDirection() == 'r'){
            for(int j=state.getH()-1; j>=0; j--){
                for(int i=state.getW()-1; i>=0; i--){
                    
                    if(state.getPiece(i, j) == move.getPiece()){
                        if(getPieceRight(i,j) == 0){
                            Position curPos = new Position(i,j);
                            // actually make the move happen, moves the values over
                            makeMove(curPos, move.apply(curPos));
                        }
                    }
                }
            }
        }
        
        // BELOW
        // same as above but run backwards
        if(move.getDirection() == 'r'){
            for(int j=state.getH()-1; j>=0; j--){
                for(int i=state.getW()-1; i>=0; i--){
                    
                    if(state.getPiece(i, j) == move.getPiece()){
                        if(getPieceBelow(i,j) == 0){
                            Position curPos = new Position(i,j);
                            // actually make the move happen, moves the values over
                            makeMove(curPos, move.apply(curPos));
                        }
                    }
                }
            }
        }
        
        
        
        return state;
        
    }
    
    public GameBoard applyMoveSeparate(GameBoard state, Move move){
        // Clone the original board and make a new one.
        GameBoard newBoard = new GameBoard((ArrayList<ArrayList>)state.getBoard().clone());
        // Use the applyMove method to make the move on this new board of ours
        newBoard = applyMove(newBoard, move);
        
        return newBoard;
    }
    
    public void makeMove(Position pos1, Position pos2){
        // get the value in pos1 and put it in pos2
        // change pos1 to 0
        
        int piece = this.getPiece(pos1);
        int piece2 = this.getPiece(pos2);
       
        if(piece2 == 0 || piece2 == -1){

            this.setPiece(pos2, piece);
            this.setPiece(pos1, (Integer)0);
        }
    }
    public int numberOfBlocks(){
        int maxNum = 0;
        
        for(int j=0; j<this.getBoard().size(); j++){
            for(Object x : this.getBoard().get(j)){
                if((Integer)x > maxNum)
                    maxNum = (Integer)x;
            }
        }
        return maxNum;
    }

    
}
