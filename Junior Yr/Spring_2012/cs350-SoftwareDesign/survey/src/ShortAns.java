
public class ShortAns extends Essay{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2635843978527364333L;
	private String questionType = "Short Answer";
	
	/**
	 * Maximum number of characters in answer
	 * is by default set to 10
	 */
	public ShortAns(){
		this.setMaxChar(10);
		this.setQuestionType(questionType);
	}
	
	/**
	 * Set the maximum number of characters in answer
	 * @param maxChar integer of max chars allows.
	 * 
	 */
	public ShortAns(int maxChar){
		this.setMaxChar(maxChar);
	}

	public String getQuestionType() {
		return questionType;
	}

	public void displayQuestion(){
		super.displayQuestion();
	}
	
	public void modify(){
		this.changePrompt();
	}
}
