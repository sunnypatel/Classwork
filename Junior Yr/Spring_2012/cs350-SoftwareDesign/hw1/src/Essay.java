
public class Essay extends Question{
	
	// maximum number of characters allowed for essay;
	// -1 for infinite
	private int maxChar = -1;  
	
	public Essay(){
		this.setMaxChar(-1);
		
	}
	
	public Essay(int maxChar){
		this.setMaxChar(maxChar);
		
	}

	public int getMaxChar() {
		return maxChar;
	}

	public void setMaxChar(int maxChar) {
		this.maxChar = maxChar;
	}
	
	/**
	 * Display the maximum number of characters warning
	 */
	public void displayMaxChar(){
		if(this.getMaxChar() > 0){
			System.out.print(" (Warning: Max characters allowed " + this.getMaxChar());
			System.out.print(", remaining characters will be truncated.)");
		}
	}
	public void displayQuestion(){
		System.out.println("");
		System.out.println(this.getPrompt());
		displayMaxChar();
		System.out.println("");
	}
	
	
}
