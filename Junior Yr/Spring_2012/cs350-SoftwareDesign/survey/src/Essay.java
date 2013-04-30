
public class Essay extends Question{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1877377563437219685L;

	private String questionType = "Essay";
	
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
			System.out.println(", remaining characters will be truncated.)");
		}
	}
	public void displayQuestion(){
		super.displayQuestion();
		displayMaxChar();

	}

	public String getQuestionType() {
		return questionType;
	}	
	
}
