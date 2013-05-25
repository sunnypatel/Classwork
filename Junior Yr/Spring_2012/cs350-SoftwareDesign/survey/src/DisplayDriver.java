import java.io.Serializable;


public abstract class DisplayDriver implements Serializable {


	private static final long serialVersionUID = 5320033258894212217L;

	public DisplayDriver(){
		
	}
	
	public abstract void draw();
	
	public abstract void draw(Object x);
}
