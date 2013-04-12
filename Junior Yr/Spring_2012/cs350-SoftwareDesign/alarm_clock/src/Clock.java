
public class Clock extends Time{
	Time clock_time;
	
	
	public Clock(){
		Time clock_time = new Time();
	}
	
	public void tick(){
		clock_time.tick();
	}
	
	
}
