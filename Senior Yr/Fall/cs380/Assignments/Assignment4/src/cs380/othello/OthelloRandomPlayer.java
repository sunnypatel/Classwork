/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cs380.othello;

import java.util.List;
import java.util.Random;

/**
 *
 * @author santi
 */
public class OthelloRandomPlayer extends OthelloPlayer {
    Random r = new Random();
   
    public OthelloMove getMove(OthelloState state) {
        // generate the list of moves:
        List<OthelloMove> moves = state.generateMoves();           
        
        // return one at random:
        if (!moves.isEmpty()) return moves.get(r.nextInt(moves.size()));
        
        // If there are no possible moves, just return "pass":
        return null;
    }
    
}
