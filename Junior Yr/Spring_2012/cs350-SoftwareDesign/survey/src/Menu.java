import java.io.Serializable;
import java.util.*;


public class Menu implements Serializable{

	private static final long serialVersionUID = -682387028201373104L;
	// how the menu is going to be printed out
	DisplayDriver console;
	// List of options for the user
	ArrayList<String> options;
	// Menu title
	String title;
	// prompt user text
	String userPrompt;
	// error to display when user types unrecognized input.
	String errMsg;
	
	/**
	 * Creates menu with no title
	 */
	public Menu(){
		this.options = new ArrayList<String>();
		// Menu title
		this.setTitle("");
		// Default error message
		this.setErrMsg("Sorry, input not recognized. Please try again.");
		
		console = new TextDriver();
	}
	
	/** 
	 * Creates a menu with given title
	 * @param title
	 */
	public Menu(String title){
		this.options = new ArrayList<String>();
		// Menu title
		this.setTitle(title);
		// user prompt
		this.setUserPrompt("Select your option:");
		// Default error message
		this.setErrMsg("Sorry, input not recognized. Please try again.");
		
		console = new TextDriver();
	}
	
	public Menu(ArrayList<String> options) {
		this.options = options;
		// Menu title
		this.setTitle(title);
		// user prompt
		this.setUserPrompt("Select your option:");
		// Default error message
		this.setErrMsg("Sorry, input not recognized. Please try again.");
		
		console = new TextDriver();
	}

	/**
	 * Add the option to the bottom of options list
	 * @param option
	 */
	public void addOption(String option){
		this.options.add(option);
	}
	
	/**
	 * Adds the option at the index specified. Shifts all options down 
	 * the list if another option was in that position.
	 * @param option
	 * @param index
	 */
	public void addOption(String option, int index){
		this.options.add(index, option);
	}
	
	/**
	 * Remove option at index 
	 * @param index
	 */
	public void removeOption(int index){
		this.options.remove(index);
	}
	
	/**
	 * Prints out the menu
	 */
	public void display(){
		if(options.size() > 0){
			int count = 0;
			console.draw(this.getTitle());
			
			
			for(String option : this.options){
				console.draw(" (" + ++count + ") " + option);
			}
		
		} else {
			console.draw("Menu empty");
		}
	}
	
	public String askUser(String prompt){
		return this.askUser(prompt, null);
	}
	
	public String askUser(String prompt, String notAllowed){
		Creader rd = new Creader();
		Boolean done = false;
		String res = "";
		ArrayList<String> invalids = new ArrayList<String>();
		// Everything is allowed
		if(notAllowed == null || notAllowed.length() == 0){
			done = true;
		} else {
			if(notAllowed.contains(","))
				for(String x : notAllowed.split(","))
					invalids.add(x.trim());
		
			else
				invalids.add(notAllowed.trim());
		}

		do{
			console.draw(prompt + " ");
			res = rd.readLine().trim();
			
			for(String bad : invalids){
				if(res.contains(bad)){
					done = false;
					console.draw("Your response cannot contain " + notAllowed);
				}
				else 
					done = true;
			}
						
		} while(!done);
		return res;
	}
	
	public String askUser(){
		return askUser(this.userPrompt);
	}
	
	public Boolean askYesNo(String prompt){
		Boolean done = false;
		while(!done) {
			String reponse = askUser(prompt);
			if(reponse.toLowerCase().equals("yes") || reponse.toLowerCase().equals("y"))
				return true;
			else if (reponse.toLowerCase().equals("no") || reponse.toLowerCase().equals("n"))
				return false;
			else{
				console.draw(this.getErrMsg());
				
				done = false;
			}
		}
		return null;
	}
	/**
	 * Once options are added this will display the menu
	 * and prompt user for their choice 
	 * @param prompt
	 * @return the choice user entered
	 */
	public int run(){
		
		String response;
		boolean done = false;
		do {
			this.display();
			response = this.askUser();
			
			try{
				console.draw("You selected: " + options.get(Integer.parseInt(response)-1));
				
				done = true;
			} catch (Exception e){
				// got something we can't do anything with. print error msg
				this.printError();
				done = false;
			}

		} while (!done);
		
		return Integer.parseInt(response);
	}
	
	public void printError(){
		console.draw(this.getErrMsg());

	}
	
	public void clear(){
		this.options.clear();
	}
	
	public String getTitle(){
		return this.title;
	}
	
	public void setTitle(String title){
		this.title = title;
	}
	public String getErrMsg(){
		return this.errMsg;
	}
	
	public void setErrMsg(String msg){
		this.errMsg = msg;
	}
	
	public String getUserPrompt(){
		return this.userPrompt;
	}
	
	public void setUserPrompt(String userPrompt){
		this.userPrompt = userPrompt;
	}
}
