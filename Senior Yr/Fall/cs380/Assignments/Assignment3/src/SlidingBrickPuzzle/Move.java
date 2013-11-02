/*
 * 
 */
package SlidingBrickPuzzle;

/**
 *
 * @author sunnypatel
 */
public class Move {
    private int piece;
    private char direction;
    
    public Move(int piece, char direction){
        this.piece = piece;
        this.direction = direction;
    }
    
    public int getPiece(){
        return this.piece;
    }
    
    public void setPiece(int piece){
        this.piece = piece;
    }
    
    public char getDirection(){
        return this.direction;
    }
    
    public void setDirection(char dir){
        this.direction = dir;
    }
    
    public boolean equals(Move m){
        if((m.piece == this.piece) && (m.direction == this.direction)){
            return true;
        } 
        return false;
    }
    
    public void printMove(){
        System.out.print("("+this.piece+", "+this.direction+")");
    }
    /**
     * Takes the position from params and 
     * returns the new position after this move
     * is applied to it.
     * @param pos
     * @return new position after move is applied
     */
    public Position apply(Position pos){
        if(direction == 'u'){
            return new Position(pos.getX(),pos.getY()-1);
        }
        else if(direction == 'r'){
            return new Position(pos.getX()+1,pos.getY());
        }
        else if(direction == 'b'){
            return new Position(pos.getX(),pos.getY()+1);
        }
        else if(direction == 'l'){
            return new Position(pos.getX()-1,pos.getY());
        }
        else return null;
    }
}
