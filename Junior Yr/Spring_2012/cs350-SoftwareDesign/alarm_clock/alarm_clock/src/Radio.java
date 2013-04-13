
public class Radio {
	private double station;
	private double volume;
	private boolean power;
	
	public Radio(){
		station = 96.5;
		volume = 50;
		power = true;
	}
	
	/**
	 * Play the radio station
	 */
	public void play(){
		// turn on radio before trying to play from it dummy!
		if(!this.power){ setPower(true); }
		
		
		if( (volume > 0) )
			System.out.println("[Radio] Playing station:" + station);
		else
			System.out.println("[Radio] ... ... ...");
	}
	
	public double getStation(){
		return this.station;
	}
	
	public void setStation(double station){
		this.station = station;
		System.out.println("[Radio] Station: " + station);
	}
	
	public void setVolume(double volume){
		this.volume = volume%100;
		System.out.println("[Radio] Volume: " + volume%100);
	}
	
	public void setPower(boolean power){
		this.power = power;
		System.out.println("[Radio] Power:" + power);
	}
}
