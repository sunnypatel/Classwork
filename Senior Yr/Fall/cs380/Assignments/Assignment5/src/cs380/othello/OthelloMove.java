package cs380.othello;

/**
 *
 * @author santi
 */
public class OthelloMove {
    
    
    int player;
    int x,y;
    
    
    public OthelloMove(int a_player, int a_x, int a_y) {
        player = a_player;
        x = a_x;
        y = a_y;
    }
    
    
    public String toString() {
        return "Player " + OthelloState.PLAYER_NAMES[player] + " to " + x + ", " + y;
    }
    
    public boolean equals(OthelloMove move){
        if(move.x != this.x)
            return false;
        if(move.y != this.y)
            return false;
        if(move.player != this.player)
            return false;
        
        return true;
    }
}
