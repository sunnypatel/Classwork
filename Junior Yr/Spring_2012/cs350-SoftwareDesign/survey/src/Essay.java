
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
		this.setQuestionType(questionType);
	}
	
	public Essay(int maxChar){
		this.setMaxChar(maxChar);
		this.setQuestionType(questionType);		
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
	public void displayMaxChar(DisplayDriver console){
		if(this.getMaxChar() > 0){
			console.draw(" (Warning: Max characters allowed " + this.getMaxChar());
			console.draw(", remaining characters will be truncated.)");
			console.draw();
		}
	}
	
	public void displayMaxChar(){
		this.displayMaxChar(this.console);
	}
	
	public void displayQuestion(){
		super.displayQuestion();
		displayMaxChar();

	}

	public String getQuestionType() {
		return questionType;
	}	
	
	public void modify(){
		this.changePrompt();
	}
	
}
