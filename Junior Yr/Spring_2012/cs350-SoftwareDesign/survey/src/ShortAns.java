
public class ShortAns extends Essay{
	
	private String questionType = "Short Answer";
	
	/**
	 * Maximum number of characters in answer
	 * is by default set to 10
	 */
	public ShortAns(){
		this.setMaxChar(10);
		
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

}
