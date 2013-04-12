
public class Radio {
	private double station;
	private double volume;
	private boolean power;
	
	public Radio(){
		station = 96.5;
		volume = 50;
		power = false;
	}
	
	public void play(){
		System.out.println("Playing station:" + station);
	}
	
	public void setStation(double newStation){
		station = newStation;
	}
	
	public void setVolume(double newVolume){
		volume = newVolume;
	}
	
	public void setPower(boolean setPower){
		power = setPower;
	}
}
