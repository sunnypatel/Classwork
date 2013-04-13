
public class Radio {
	private double station;
	private double volume;
	private boolean power;
	
	public Radio(){
		station = 96.5;
		volume = 50;
		power = true;
	}
	
	public void play(){
		if( (power) && (volume > 0) )
			System.out.println("[Radio] Playing station:" + station);
		else
			System.out.println("[Radio] ... ... ...");
	}
	
	public double getStation(){
		return this.station;
	}
	
	public void setStation(double station){
		this.station = station;
	}
	
	public void setVolume(double volume){
		this.volume = volume;
	}
	
	public void setPower(boolean power){
		this.power = power;
	}
}
