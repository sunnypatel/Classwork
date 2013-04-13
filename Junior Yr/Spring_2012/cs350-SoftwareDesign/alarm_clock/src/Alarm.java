import java.io.Console;

public class Alarm extends Clock {

	private Time alarmTime;
	private Time snoozeTime;
	private Time snoozeTimer; 	 		// how much time snoozed for since last snooze
	private boolean alarmActive; 		// is this alarm activated?
	private boolean snoozeActive; 		// are we snoozing right now?
	private boolean soundRadio; 		// shall this alarm play buzzbuzzbuzz or some
										// nice radio station?
	private String noise;

	public Alarm() {
		alarmTime = new Time();
		snoozeTime = new Time(0, 0); 	// ensures snoozeTime by default set to
										// midnight
		snoozeActive = false;
		alarmActive = false;
		soundRadio = false; 			// init. sound buzzbuzzbuzz
		noise = "buzzbuzzbuzz";
	}

	public Alarm(int hour, int minute) {
		alarmTime = new Time(hour, minute);
		snoozeTime = new Time(0, 0);
		snoozeActive = false;
		alarmActive = false;
		soundRadio = false; 			// init. sound buzzbuzzbuzz
		noise = "buzzbuzzbuzz";
	}

	public Time getAlarmTime() {
		return alarmTime;
	}

	public Time getSnoozeTime() {
		return snoozeTime;
	}

	public void setSnooze(Time snoozeTime) {
		this.snoozeTime.setHour(snoozeTime.getHour());
		this.snoozeTime.setMinute(snoozeTime.getMinute());

		// set snooze to active
		snoozeActive = true;
		resetSnoozeTimer();
		checkSnooze();
		
	}
	
	/**
	 * set up snooze for default 9min
	 */
	public void setSnooze(){
		this.snoozeTime.setHour(0);
		this.snoozeTime.setMinute(9);
		
		snoozeActive = true;
		resetSnoozeTimer();
		checkSnooze();
	}
	public void setNoise(String noise) {
		this.noise = noise;
	}

	public void setActive() {
		alarmActive = true;
	}

	public boolean isAlarmActive() {
		return alarmActive;
	}

	public boolean isSnoozeActive() {
		return snoozeActive;
	}

	
	
	/**
	 * Sounds alarm depending on soundRadio plays either radio station or
	 * buzzbuzzbuzz
	 * 
	 * @return true if sound played if alarm isn't active then don't play sound
	 *         really just for safe programming
	 */
	public boolean soundAlarm() {
		if (!alarmActive)
			return false;

		if (soundRadio) {
			this.radio.play();

		} else {
			System.out.println(noise);

		}

		displaySnoozeMenu();

		return true;
	}

	public void checkSnooze(){
		if(snoozeActive && alarmActive){
			
			if(snoozeTimer.isEqual(snoozeTime)){
				soundAlarm();
			} else {
				snoozeTimer.tick();
			}
		}
	}
	
	public void displaySnoozeMenu() {
		Console c = System.console();

		if (c == null) {
			System.err.println("No console.");
			System.exit(1);
		}
		
		System.out.println("- Snoozer Menu -");
		System.out.println(" (1) Snooze. ");
		System.out.println(" (2) Turn off alarm. ");
		System.out.println("---------------------");
		String opt = c.readLine("(default 2): ");
		
		if(opt == "1"){
			setSnooze();
		} else {
			resetAlarm();
		}
			
	}
	
	public void resetSnoozeTimer(){
		snoozeTimer.setTime(0,0);
	}
	
	public void resetAlarm(){
		snoozeActive = false;
		resetSnoozeTimer();
	}	
}
