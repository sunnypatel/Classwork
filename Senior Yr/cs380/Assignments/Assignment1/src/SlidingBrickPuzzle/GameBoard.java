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
public class GameBoard {
   
    private ArrayList<ArrayList> board;
    
    public GameBoard(int x, int y){
       // create a X x Y game board
       board = new ArrayList<ArrayList>();
       
       for(int j=0; j<x; j++){
           ArrayList row = new ArrayList();
           
           for(int i=0; i<y; i++)
               row.add(0);
           board.add(row);
       }
    }
    
    public void printDimensions(){
        System.out.println(board.size() + " x " + board.get(0).size());
    }
    
    // Display the game board
    public void printBoard(){
        for(int j=0; j<board.size(); j++){
            for(int i=0; i<board.get(j).size(); i++){
                
                
                System.out.print(board.get(j).get(i));
                
                // Little formating tidyness
                if(i!=(board.get(j).size()-1))
                    System.out.print(",");
            }
            System.out.println();
        }

    }
}
