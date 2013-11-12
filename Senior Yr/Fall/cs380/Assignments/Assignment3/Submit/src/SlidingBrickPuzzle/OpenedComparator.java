/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SlidingBrickPuzzle;

import java.util.Comparator;

/**
 *
 * @author Sunny
 */
public class OpenedComparator implements Comparator<Node> {
    
    @Override
    public int compare(Node a, Node b){
        double aF = a.g + a.h;
        double bF = a.g + a.h;
        
        if(aF == bF)
            return 0;
        else if(aF > bF)
            return 1;
        else
            return -1;
    }
}
