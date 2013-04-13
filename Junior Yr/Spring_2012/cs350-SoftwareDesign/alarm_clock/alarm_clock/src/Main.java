
public class Main {

	/**
	 * Alarm clock 
	 * @param args
	 */
	public static void main(String[] args) {
		
		// Create new clock starting at midnight
		Clock a_Clock = new Clock();
		
		System.out.println("Created new clock starting at midnight");
		
		// create new alarm
		Alarm wakeUp_Alarm = new Alarm();
		// set alarm for noon
		wakeUp_Alarm.setAlarmTime(1,00); 
		
		// add this alarm to our clock
		a_Clock.addAlarm(wakeUp_Alarm);
		
		for(int i=0; i< 120; i++){
			a_Clock.tick();
			a_Clock.printTime();
		}
		
		System.out.println("Done. With clock 1");
		
		System.out.println("Let's create clock 2 with a radio!");
		Clock b_Clock = new Clock(15,0);
		System.out.println("Created b_Clock starting at 3pm");
		
		System.out.println("let's see if we can: turn the radio on, change the radio station to 96.5,and turn the volume up to 78/100.");
		b_Clock.radio.setPower(true);
		b_Clock.radio.setStation(96.5);
		b_Clock.radio.setVolume(78);
		b_Clock.radio.play();
		
		Alarm gotoClass_Alarm = new Alarm();
		gotoClass_Alarm.setAlarmTime(15, 15);
		b_Clock.addAlarm(gotoClass_Alarm);
		
		System.out.println("starting clock ticks 24hr");
		for(int i=0; i< 1440; i++){
			b_Clock.tick();
			b_Clock.printTime();
		}
		
	}
}
