
public class Display_Singleton {
	private static Display_Singleton instance = null;
	private DisplayDriver mainDriver;
	
	protected Display_Singleton(){
		mainDriver = new TextDriver();
	}
	
	public static Display_Singleton getInstance(){
		if(instance == null)
			instance = new Display_Singleton();
		
		return instance;
	}
	
	public DisplayDriver getMainDriver(){
		return this.mainDriver;
		
	}
	
}
