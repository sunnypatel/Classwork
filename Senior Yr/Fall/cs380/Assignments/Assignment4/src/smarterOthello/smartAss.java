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
    int depth;
    
    public smartAss(int depth){
        this.depth = depth;
    }
    
    @Override
    /**
     * Will search entire min-max tree for the best solution each time
     */
    public OthelloMove getMove(OthelloState state) {
       return minimaxDecision(state, this.depth);
    }
    
    public OthelloMove getMove(OthelloState state, int depth){
        return minimaxDecision(state, depth);
    }
    
    public OthelloMove minimaxDecision(OthelloState state, int depth){
        int max =0;
        OthelloMove curBestMove = null;
        
        for(OthelloMove a : state.generateMoves()){
            
            int tmpMax = maxValue(state.applyMoveCloning(a), depth);
            
            if(tmpMax > max){
                max = tmpMax;
                curBestMove = a;
            }
        }
        return curBestMove;
    }
    /**
     * Recrusively traverse tree all the way down to the leaves,
     * to determine the backed-up value of a state
     * @param state
     * @return 
     */
    public int maxValue(OthelloState state, int depth){
        if(state.gameOver() || (state.generateMoves().isEmpty())){
            return state.score();
        }
        
        if(depth == 0)
            return state.score();
        
        // set some sample score for now as basis
        int v = state.applyMoveCloning(state.generateMoves().get(0)).score();
        
        for(OthelloMove a : state.generateMoves()){
            int u = minValue(state.applyMoveCloning(a), depth--);
            if(u >= v){
                v = u;
            }
        }
        return v;
    }
    
    public int minValue(OthelloState state, int depth){
        if(state.gameOver() || (state.generateMoves().isEmpty())) return state.score();
        
        if(depth == 0)
            return state.score();
        
        // set some sample score for now as basis
        int v = state.applyMoveCloning(state.generateMoves().get(0)).score();
        
        for(OthelloMove a : state.generateMoves()){
            int u = maxValue(state.applyMoveCloning(a), depth--);
            if(u <= v){
                v = u;
            }
        }
        return v;
    }
    
    
}
