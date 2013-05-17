import java.util.*;


public class Menu {
	// how the menu is going to be printed out
	DisplayDriver console;
	// List of options for the user
	ArrayList<String> options;
	// Menu title
	String title;
	// error to display when user types unrecognized input.
	String errMsg;
	
	
	public Menu(){
		this.options = new ArrayList<String>();
		// Menu title
		this.setTitle("");
		// Default error message
		this.setErrMsg("Sorry, input not recognized. Please try again.");
		
		console = new TextDriver();
	}
	public Menu(String title){
		this.options = new ArrayList<String>();
		// Menu title
		this.setTitle(title);
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
	
	public void display(){
		int count = 1;
		
		console.draw();
		for(String option : this.options){
			console.draw(" (" + count + ") ");
			console.draw(option);
			console.draw();
		}
		console.draw();
	}
	
	public String askUser(String prompt){
		Creader rd = new Creader();
		
		console.draw(prompt);
		console.draw();
		
		return rd.readLine();
	}
	
	public int run(String prompt){
		String response;
		boolean done = false;
		do {
			this.display();
			response = this.askUser(prompt);
			
			// ERROR! User entered something wack
			if(response.length() <= 0 && this.options.get(Integer.parseInt(response)) == null){
				console.draw(errMsg);
				console.draw();
			}
		} while (!done);
		
		return Integer.parseInt(response);
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
}
