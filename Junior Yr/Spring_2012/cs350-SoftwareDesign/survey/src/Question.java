import java.io.Serializable;



public abstract class Question implements Serializable{

	private static final long serialVersionUID = 5363456947254228772L;
	private String questionType = null;
	// to make my life easier for now i just included this here.
	public Menu askUser = new Menu();
	public transient Creader rd = new Creader();
	public DisplayDriver console = new TextDriver();
	private String prompt;
	private Response response;
	
	public Question(){
		
		System.out.println("Enter the prompt for question:");
		this.prompt = rd.readLine();		
		
	}

	public Response getReponse(){
		return this.response;
	}
	
	public void setResponse(String r){
		this.response.setResponse(r);
	}
	
	public void setResponse(Response r){
		this.response = r;
	}
	
	public String getPrompt() {
		return prompt;
	}

	public void setPrompt(String prompt) {
		this.prompt = prompt;
	}
	
	public void displayQuestion(){
		this.displayQuestion(this.console);
	}
	
	public void displayQuestion(DisplayDriver console){
		console.draw("| " + this.getQuestionType() + " | ");
		console.draw(this.getPrompt());

	}
	
	public void changePrompt(){
		console.draw(this.getPrompt());

		if(askUser.askYesNo("Would you like to change prompt (Y/N) ?")){
			this.setPrompt(askUser.askUser("New prompt:"));
		}
	}
	
	public void modify(){
		
	}
	
	public String getQuestionType(){
		return questionType;
	}
	
	public void setQuestionType(String questionType){
		this.questionType = questionType;
	}
}
