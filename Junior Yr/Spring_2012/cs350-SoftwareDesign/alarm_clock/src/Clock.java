import java.util.ArrayList;
import java.util.Iterator;

public class Clock extends Time{
	Time clock_time;
	// array of alarm objects
	ArrayList<Alarm> alarms;
	
	// create a new radio
	Radio radio;
	
	public Clock(){
		// ensures clock starts at 0:00
		clock_time = new Time(0,0);
		
		// array of alarms for this clock
		alarms = new ArrayList<Alarm>();
		
		// adds radio
		radio = new Radio();
	}
	
	public void tick(){
		clock_time.tick();
		
		// check all alarm times, do any of the times match?		
		Iterator<Alarm> itr = alarms.iterator();
		while( itr.hasNext() ){
			if( (itr.next().isEqual(clock_time)) && itr.next().isAlarmActive() ){
				// call soundAlarm
				
			}
			
			// check if there are any snoozers
			if( itr.next().isSnoozeActive()){
				// subject 1 from snoozeTimeLeft 
				// if snoozeTimeLeft is <= 0 then
				// soundAlarm again
			}
		}		
 
		// if so then call that alarm's soundAlarm()
		// prompt user if they want to snooze
	}
	
	
	
}
