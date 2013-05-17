import java.util.*;


public class Menu {
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
			console.draw();
			console.draw(this.getTitle());
			
			console.draw();
			for(String option : this.options){
				console.draw(" (" + ++count + ") ");
				console.draw(option);
				console.draw();
				
			}
			console.draw();
		} else {
			console.draw("Menu empty");
		}
	}
	
	public String askUser(String prompt){
		Creader rd = new Creader();
		
		console.draw(prompt);
		console.draw();
		
		return rd.readLine();
	}
	
	/**
	 * Once options are added this will display the menu
	 * and prompt user for their choice 
	 * @param prompt
	 * @return the choice user entered
	 */
	public int run(String prompt){
		
		String response;
		boolean done = false;
		do {
			this.display();
			response = this.askUser(prompt);
			
			try{
				console.draw("You selected: " + options.get(Integer.parseInt(response)-1));
				console.draw();
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
		console.draw();
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
