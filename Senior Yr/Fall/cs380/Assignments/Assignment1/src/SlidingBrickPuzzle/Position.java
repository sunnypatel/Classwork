/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SlidingBrickPuzzle;

/**
 *
 * @author sunnypatel
 */
public class Position {
    int x;
    int y;
    
    public Position(){
        x = 0;
        y = 0;
    }
    
    public Position(int x, int y){
        this.x = x;
        this.y = y;
    }
    
    public int getX(){
        return this.x;
    }
    
    public void setX(int x){
        this.x = x;
    }
    
    public int getY(){
        return this.y;
        
    }
    
    public void setY(int y){
        this.y = y;
    }
    
}
