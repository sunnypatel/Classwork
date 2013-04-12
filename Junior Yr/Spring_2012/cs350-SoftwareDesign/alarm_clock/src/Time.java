
public class Time {
	private int hour;
	private int minute;
	
	public Time(){
		hour = 0;
		minute = 0;
	}
	
	public void tick(){
		minute = minute + 1;
		refractor();
	}
	
	private void refractor(){
		while(minute >= 60){
			hour = hour + 1;
			minute = minute - 60;
		}
		
		while(hour >= 24){
			hour = hour - 24;
		}
	}
	
	public int getHour(){
		return hour;
	}
	
	public int getMinute(){
		return minute;
	}
	
	public boolean isGreaterThanEqual(Time b){
		if( this.getHour() >= b.getHour() ){
			return true;
		} 
		else if(this.getHour() == b.getHour()){
			if(this.getMinute() >= b.getMinute()){
				return true;
			}
		}
		else{
			return false;
		}
		
		return false;
	}
	
	public void setHour(int newHour){
		hour = newHour;
	}
	
	public void setMinute(int newMinute){
		minute = newMinute;
	}
}
