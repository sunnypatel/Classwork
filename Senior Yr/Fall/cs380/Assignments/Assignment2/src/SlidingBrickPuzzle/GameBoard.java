/*
 * This Class helps create a simple X x Y grid-board.
 * 
 */
package SlidingBrickPuzzle;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sunnypatel
 */
public class GameBoard {
   
    private ArrayList<ArrayList> board;
    
    // Generic game board 10 X 10
    public GameBoard(){
        board = this.createBoard(10, 10);
    }
    public GameBoard(ArrayList<ArrayList> newBoard){
        board = newBoard;
    }
    public GameBoard(int x, int y){
       // create a X x Y game board
       board = this.createBoard(x, y);
    }
    
    
    
    public void printDimensions(){
        System.out.println(board.size() + " x " + board.get(0).size());
    }
    
    // Display the game board
    public void printBoard(){
        int j =0;
        int i =0;
        for(j=0; j<board.size(); j++){
        /*    for(i=0; i<board.get(j).size(); i++){
                
                
                System.out.print(board.get(j).get(i));
                
                // Little formating tidyness
                if(i!=(board.get(j).size()-1))
                    System.out.print(",");
            }
            System.out.println();
         */
            System.out.println(board.get(j));
        }
        //System.out.println("j="+j+"i="+i);
    }
    
    
    // Create a 2-dim matrix of size X x Y. 
    // TODO: Make this pass by reference for performance 
    private ArrayList<ArrayList> createBoard(int x, int y){
        
       // create a X x Y game board
       ArrayList<ArrayList> tempBoard = new ArrayList<ArrayList>();
       
       for(int j=0; j<y; j++){
           ArrayList row = new ArrayList();
           
           for(int i=0; i<x; i++)
               row.add(0);
           tempBoard.add(row);
       }
       
       return tempBoard;
    }
    
    // Creates a game board from input file
    // All Gameboards should be in the GameBoards folder of src/
    public void load(String fileName){
        try { 
            BufferedReader in = new BufferedReader(new FileReader("src/GameBoards/" + fileName));
            // First line of input file always should be the dim. of matrix
            String xy = in.readLine();
            int x = Integer.parseInt(xy.charAt(0) + "");
            int y = Integer.parseInt(xy.charAt(2) + "");
            //System.out.println("x="+x);
            //System.out.println("y="+y);
            
            // create a tempBoard w/ those dim
            ArrayList<ArrayList> tempBoard = this.createBoard(x, y);
            //System.out.println("tempBoardY=" + tempBoard.size());
            //System.out.println("tempBoardX=" + tempBoard.get(0).size());
            
            // start reading each line after and storing the values in the tempBoard
            int countY=0;
            while(in.ready()){
                
                String line = in.readLine();
                
                String[] states = line.split(",");

                for(int i=0; i<x; i++){
                 //   System.out.print("[ " + states[i] + "]"); 
                   tempBoard.get(countY).set(i,(int)Integer.parseInt(states[i]));
                   //System.out.println("i="+i+" state=" +states[i]+ " countY="+countY);
                } 
                
                countY++;
            }
            in.close();
            
            // load the tempBoard to this board
            board = tempBoard;
            
        } catch (FileNotFoundException ex) {
            Logger.getLogger(GameBoard.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error loading input file");
        } catch (Exception e){
            System.out.println("Something went wrong while loading board from file.");
            e.printStackTrace();
        }
    }
    
    /**
     * Linear search entire game board to find needle, 
     * return true if found. Otherwise false.
     * @param needle item being searched for
     * @return Boolean
     */
    public boolean contains(Integer needle){
        
        for(int j=0; j<board.size(); j++){
           
            if(board.get(j).contains(needle))
                return true;    
        }      
        return false;
    }
    
    public ArrayList<ArrayList> getBoard(){
        return this.board;
    }
    
    public void setBoard(ArrayList<ArrayList> tempBoard){
        this.board = tempBoard;
    }
    
    public GameBoard cloneBoard(){
        return new GameBoard(this.board);
    }
    
    /**
     * Check to see if b is the same as this board
     * 
     * @param b
     * @return 
     */
    public boolean compare(GameBoard b){
        if((b.getW() != getW()) || b.getH() != getH())
            return false;
        
        for(int x=0; x<getW(); x++){
            for(int y=0; y<getH(); y++){
                if(this.getPiece(x, y) != b.getPiece(x, y))
                    return false;
            }
        }
        return true;
    }
    
    /**
     * Finds all the pieces = i around position.
     * return a list of those positions
     * @param pos
     * @param i
     * @return 
     */
    public ArrayList findPositionAround(Position pos, int i){
        ArrayList<Position> piecesAdj = new ArrayList<Position>();
        
        if(board.get(pos.getX()-1).get(pos.getY()).equals(i)){
            // add the piece above this position    - UP
            piecesAdj.add(new Position(pos.getX()-1,pos.getY()));   
        }
        
        if(board.get(pos.getX()).get(pos.getY()+1).equals(i)){
            // add the piece right of this position - RIGHT
            piecesAdj.add(new Position(pos.getX(),pos.getY()+1));    
        }
        
        if(board.get(pos.getX()+1).get(pos.getY()).equals(i)){
            // add the piece below of this position - BOTTOM
            piecesAdj.add(new Position(pos.getX()+1,pos.getY()));   
        }
        
        if(board.get(pos.getX()).get(pos.getY()-1).equals(i)){
            // add the piece left of this position  - LEFT
            piecesAdj.add(new Position(pos.getX(),pos.getY()-1));
        }
        
        
        return piecesAdj;
    }

    public ArrayList findPositionAround(int x, int y, int i){
        Position pos = new Position(x, y);
        return findPositionAround(pos, i);
    }
    
    public int getPiece(Position pos){
        return (Integer) board.get(pos.getY()).get(pos.getX());
    }
    
    public int getPiece(int x, int y){
        return (Integer) board.get(y).get(x);
    }
    
    public void setPiece(Position pos, int piece){
        board.get(pos.getY()).set(pos.getX(), piece);
    }
    
    public void setPiece(int x, int y, int piece){
        this.setPiece(new Position(x,y), piece);
    }
    
    public int getPieceAbove(int x, int y){
        return getPieceAbove(new Position(x,y));
    }
    
    public int getPieceAbove(Position pos){
        if(pos.getY()-1 >= 0)
            return (Integer)board.get(pos.getY()-1).get(pos.getX());
        else 
            return -1;
    }
    public int getPieceRight(int x, int y){
        return getPieceRight(new Position(x,y));
    }
    public int getPieceRight(Position pos){
        if(pos.getX()+1 < board.get(pos.getY()).size())
            return (Integer)board.get(pos.getY()).get(pos.getX()+1);
        else
            return -1;
    }
    public int getPieceBelow(int x, int y){
        return getPieceBelow(new Position(x,y));
    }
    
    public int getPieceBelow(Position pos){
        if(pos.getY()+1 < board.size())
            return (Integer)board.get(pos.getY()+1).get(pos.getX());
        else
            return -1;
    }
    
    public int getPieceLeft(int x, int y){
        return getPieceLeft(new Position(x,y));
    }
    
    public int getPieceLeft(Position pos){
        if(pos.getX()-1 >= 0){
            return (Integer)board.get(pos.getY()).get(pos.getX()-1);
        }
        else
            return -1;
    }
    
    public int getW(){
        if(this.board.size()>0){
            return this.board.get(0).size();
        }
        return 0;
    }
    
    public int getH(){
       return this.board.size();
    }
}
