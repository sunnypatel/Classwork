
public class Time {
	private int hour;
	private int minute;
	
	public Time(){
		hour = 0;
		minute = 0;
	}
	
	public Time(int hour, int minute){
		this.hour = hour;
		this.minute = minute;
	}
	
	public void tick(){
		minute = minute + 1;
		refractor();
	}
	
	public int getHour(){
		return hour;
	}
	
	public int getMinute(){
		return minute;
	}
	
	/**
	 * Check if time is greater than or equal (>=) to b.
	 * @param Time b
	 * @return true if this time is >= b
	 */
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

	/**
	 * Check if Time b is equal to this time
	 * @param Time b
	 * @return true; else false
	 */
	public boolean isEqual(Time b){
		if( (this.getHour() == b.getHour()) && (this.getMinute() == b.getMinute()) ){
			return true;
		} 
		return false;
	}
	
	
	public void setHour(int hour){
		this.hour = hour;
	}
	
	public void setMinute(int minute){
		this.minute = minute;
	}
	
	public void setTime(int hour, int minute){
		this.hour = hour;
		this.minute = minute;
	}
	
	public void printTime(){
		System.out.println(this.hour + " : " + this.minute);
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
}
