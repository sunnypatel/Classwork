/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package smarterOthello;

import cs380.othello.OthelloMove;
import cs380.othello.OthelloState;

/**
 *
 * @author sunnypatel
 */
public class smartAss extends cs380.othello.OthelloPlayer {

    @Override
    public OthelloMove getMove(OthelloState state) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public OthelloMove minimaxDecision(OthelloState state){
        return null;
    }
    /**
     * Recrusively traverse tree all the way down to the leaves,
     * to determine the backed-up value of a state
     * @param state
     * @return 
     */
    public int maxValue(OthelloState state){
        if(state.gameOver()){
            return state.score();
        }
        
        // set some sample score for now as basis
        int v = state.applyMoveCloning(state.generateMoves().get(0)).score();
        
        for(OthelloMove a : state.generateMoves()){
            int u = minValue(state.applyMoveCloning(a));
            if(u >= v){
                v = u;
            }
        }
        return v;
    }
    
    public int minValue(OthelloState state){
        if(state.gameOver()) return state.score();
        
        // set some sample score for now as basis
        int v = state.applyMoveCloning(state.generateMoves().get(0)).score();
        
        for(OthelloMove a : state.generateMoves()){
            int u = maxValue(state.applyMoveCloning(a));
            if(u <= v){
                v = u;
            }
        }
        return v;
    }
    
    
}
