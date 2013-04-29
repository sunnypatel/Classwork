

public class Question {
	// to make my life easier for now i just included this here.
	public Creader rd = new Creader();
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
}
