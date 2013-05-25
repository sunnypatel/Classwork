import java.util.ArrayList;
import java.util.Iterator;


public class MultipleChoice extends Question{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4290684159989804503L;
	private String questionType = "Multiple Choice";
	private ArrayList<String> options;
	
	public MultipleChoice(){
		options = new ArrayList<String>();
		this.setQuestionType(questionType);
	}
	
	public MultipleChoice(int numOfOptions){
		options = new ArrayList<String>();
		this.setQuestionType(questionType);
		
		if(numOfOptions > 0){
			createOptions();
		}
	}
	
	/**
	 * Wrapper create method
	 */
	public void create(){
		createOptions();
	}
	
	/**
	 * Creates options for this multiple choice question.
	 * Adds options to the 'options' ArrayList
	 */
	public void createOptions(){
		boolean addAnother = true;
		
		while(addAnother){
			System.out.println("Enter choice text: (type '\\done' when done)");
			String ans = rd.readLine();
			
			// is user finished entering choices
			if(ans.equals("\\done")){ // yes
				addAnother = false;
			} else{ // no
				this.addOption(ans);
			}
		} // while (addAnother)
	} // createOptions
	
	/**
	 * Add a string option text to the ArrayList 'options'
	 * @param optionStr string of the option value
	 */
	public void addOption(String optionStr){
		options.add(optionStr);
	}
	
	public ArrayList<String> getOptions(){
		return this.options;
	}
	
	public String getOption(int opt){
		return this.getOptions().get(opt);
	}
	
	/**
	 * Get the number of options available for this multiple choice
	 * question
	 * @return number of options
	 */
	public int getNumberOfOptions(){
		return options.size();
	}
	
	/**
	 * Neatly display the question along
	 * with the multiple choices
	 */
	public void displayQuestion(){
		super.displayQuestion();
		displayOptions();
	}
	
	/**
	 * Neatly displays all the options
	 * in a numbered list type order.
	 */
	public void displayOptions(){
		int optionNum = 1;
		
		Iterator<String> it = options.iterator();
		while(it.hasNext()){
			System.out.println(" ("+ optionNum + ") " + it.next());
			optionNum = optionNum + 1;
		}
	}
	
	public String getQuestionType() {
		return questionType;
	}
	
	/**
	 * Check passed option number if it could be mapped to an actual option value
	 * @param opt
	 * @return boolean
	 */
	public boolean validOption(int opt){
		if(this.getOption(opt) != null)
			return true;
		return false;
	}
	
	/**
	 * Check passed option number if it could be mapped to an actual option value
	 * @param opt
	 * @return boolean
	 */	
	public boolean validOption(String opt){
		return validOption(Integer.parseInt(opt));
	}
	
	public void modify() {
		this.changePrompt();

		while (askUser.askYesNo("Would you like to change choices? (Y/N)")) {

			try {
				this.displayOptions();
				// ask user which choice they would like to change and parse
				// that choice index to integer
				int selectedOption = Integer.parseInt(askUser.askUser("Which choice would you like to change? (1 - "+ this.getNumberOfOptions() + ") : "));
				Boolean done = false;
				// do while done
				if (this.validOption(selectedOption - 1)) {
					this.options.remove(selectedOption - 1);
					this.options.add(selectedOption-1,askUser.askUser("New choice #" + selectedOption+ ": "));
				
					done = true;
					this.displayOptions();
				} else {
					console.draw("Please select a valid choice.");
					console.draw();
					done = false;
				}

			} catch (Exception e) {
				console.draw("Please select a valid choice.");
				console.draw();
			}

		}

		// If user wants to add a new choice to bottom
		while (askUser.askYesNo("Would you like to add a new choice? (Y/N)")) {

			try {
				this.displayOptions();
				String newChoice = askUser.askUser("Enter new choice: ");
				this.addOption(newChoice);
				
			} catch (Exception e) {
				console.draw("Error adding choice.");
				console.draw();
			}

		}
		
	}
}
