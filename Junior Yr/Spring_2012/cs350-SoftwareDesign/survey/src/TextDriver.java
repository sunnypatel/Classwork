
public class TextDriver extends DisplayDriver {

	/**
	 * Prints an empty line
	 */
	@Override
	public void draw() {
		System.out.println("");
	}

	/**
	 * Prints object x to console as long as 
	 * x has a way to print itself. Does NOT print empty line
	 */
	@Override
	public void draw(Object x) {
		
		System.out.print(x);
		
	}
	

}
