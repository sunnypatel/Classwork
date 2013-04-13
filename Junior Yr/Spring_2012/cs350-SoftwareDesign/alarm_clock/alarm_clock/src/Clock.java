import java.util.ArrayList;
import java.util.Iterator;

public class Clock extends Time {
	Time clock_time;
	// array of alarm objects
	ArrayList<Alarm> alarms;

	// create a new radio
	Radio radio;

	public Clock() {
		// ensures clock starts at 0:00
		clock_time = new Time(0, 0);

		// array of alarms for this clock
		alarms = new ArrayList<Alarm>();

		// adds radio
		radio = new Radio();
	}
	
	public Clock(int hour, int minute) {
		// ensures clock starts at 0:00
		clock_time = new Time(hour, minute);

		// array of alarms for this clock
		alarms = new ArrayList<Alarm>();

		// adds radio
		radio = new Radio();
	}	

	public void tick() {
		clock_time.tick();

		// does this clock have any alarms setup?
		if (alarms.size() > 0) {
		
			// check all alarm times, do any of the times match?
			Iterator<Alarm> itr = alarms.iterator();
			while (itr.hasNext()) {

				Alarm alarm = itr.next();
			
				if ((alarm.getAlarmTime().isEqual(clock_time))
						&& alarm.isAlarmActive()) {
					alarm.soundAlarm();

				}

				// check if there are any snoozers
				if (alarm.isSnoozeActive()) {
					alarm.checkSnooze();
				}
			}
		}
	}
	
	public boolean addAlarm(Alarm a){
		return alarms.add(a);
	}
	
	public void printTime(){
		this.clock_time.printTime();
	}
}
