import java.io.Serializable;



public class Question implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5363456947254228772L;
	private String questionType = null;
	// to make my life easier for now i just included this here.
	
	public transient Creader rd = new Creader();
	private String prompt;
	
	public Question(){
		
		System.out.println("Enter the prompt for question:");
		this.prompt = rd.readLine();		
		
	}

	public String getPrompt() {
		return prompt;
	}

	public void setPrompt(String prompt) {
		this.prompt = prompt;
	}
	
	public void displayQuestion(){
		// Check if question mark is included in prompt
		if(this.getPrompt().lastIndexOf("?") == -1){
			this.setPrompt(this.getPrompt() + "?");
		}
		System.out.println(" | " + this.getQuestionType() + " | ");
		System.out.println("");
		System.out.println(this.getPrompt());
	}
	
	public String getQuestionType(){
		return questionType;
	}
	
	public void setQuestionType(String questionType){
		this.questionType = questionType;
	}
}
