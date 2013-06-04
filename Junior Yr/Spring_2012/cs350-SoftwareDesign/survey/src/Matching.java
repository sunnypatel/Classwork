import java.util.ArrayList;

import thirdparty.RomanConversion;


public class Matching extends Question {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8464030509229435577L;
	private String questionType = "Matching";
	private ArrayList<String> leftSide;
	private ArrayList<String> rightSide;
	
	public Matching(){
		this.leftSide = new ArrayList<String>();
		this.rightSide = new ArrayList<String>();
		this.setQuestionType(questionType);
	}

	public void create(){
		add_leftSide();
		add_rightSide();
		calibrate();
	}
	
	public void add_leftSide(){
		System.out.println("Editing left side item list.");
		boolean addAnother = true;
		
		while(addAnother){
			System.out.println("Enter your item: (type '\\done' when done)");
			String ans = rd.readLine();
			
			// is user finished entering items
			if(ans.equals("\\done")){ // yes
				addAnother = false;
			} else{ // no
				this.addToLeft(ans);
			}
		} // while (addAnother)		
	}
	
	public void add_rightSide(){
		System.out.println("Editing right side item list.");
		boolean addAnother = true;
		
		while(addAnother){
			System.out.println("Enter your item: (type '\\done' when done)");
			String ans = rd.readLine();
			
			// is user finished entering items
			if(ans.equals("\\done")){ // yes
				addAnother = false;
			} else{ // no
				this.addToRight(ans);
			}
		} // while (addAnother)		
	}
	
	public void addToLeft(String item){
		leftSide.add(item);
		
	}
	
	public void addToRight(String item){
		rightSide.add(item);

	}
	
	public ArrayList<String> getLeftSide() {
		return leftSide;
	}

	public void setLeftSide(ArrayList<String> leftSide) {
		this.leftSide = leftSide;
	}

	public ArrayList<String> getRightSide() {
		return rightSide;
	}

	public void setRightSide(ArrayList<String> rightSide) {
		this.rightSide = rightSide;
	}
	
	public boolean validOption(int i, ArrayList<String> side){
		if(side.get(i) != null)
			return true;
		return false;
	}
	
	public void modify(){
		Menu askUser = new Menu();
		while (askUser.askYesNo("Would you like to change choices for left side? (Y/N)")) {
			
			try {
				this.displaySide(this.getLeftSide());
				// ask user which choice they would like to change and parse
				// that choice index to integer
				int selectedOption = Integer.parseInt(askUser.askUser("Which choice would you like to change? (1 - "+ this.getLeftSide().size() + ") : "));
				Boolean done = false;
				// do while done
				if (this.validOption(selectedOption - 1, this.getLeftSide())) {
					this.getLeftSide().remove(selectedOption - 1);
					this.getLeftSide().add(selectedOption-1,askUser.askUser("New choice #" + selectedOption+ ": "));
				
					done = true;
					this.displaySide(this.getLeftSide());
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
		
		while (askUser.askYesNo("Would you like to change choices for right side? (Y/N)")) {
			
			try {
				this.displaySide(this.getRightSide());
				// ask user which choice they would like to change and parse
				// that choice index to integer
				int selectedOption = Integer.parseInt(askUser.askUser("Which choice would you like to change? (1 - "+ this.getRightSide().size() + ") : "));
				Boolean done = false;
				// do while done
				if (this.validOption(selectedOption - 1, this.getRightSide())) {
					this.getRightSide().remove(selectedOption - 1);
					this.getRightSide().add(selectedOption-1,askUser.askUser("New choice #" + selectedOption+ ": "));
				
					done = true;
					this.displaySide(this.getRightSide());
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
		while (askUser.askYesNo("Would you like to add a new choice to left? (Y/N)")) {

			try {
				this.displaySide(this.getLeftSide());
				String newChoice = askUser.askUser("Enter new choice: ");
				this.addToLeft(newChoice);
				
			} catch (Exception e) {
				console.draw("Error adding choice.");
				console.draw();
			}

		}
		
		// If user wants to add a new choice to bottom
		while (askUser.askYesNo("Would you like to add a new choice to right? (Y/N)")) {

			try {
				this.displaySide(this.getRightSide());
				String newChoice = askUser.askUser("Enter new choice: ");
				this.addToRight(newChoice);
				
			} catch (Exception e) {
				console.draw("Error adding choice.");
				console.draw();
			}

		}
	}
	
	public void displaySide(ArrayList<String> side){
		this.displaySide(side, this.console);
	}
	
	public void displaySide(ArrayList<String> side, DisplayDriver console){
		int count = 0;
		for(String choice : side){
			count++;
			console.draw(" ("+count+") "+ choice);
			console.draw();
		}
	}
	public void displayQuestion(){
		this.displayQuestion(this.console);
	}
	public void displayQuestion(DisplayDriver console){
		super.displayQuestion(console);	
		
		// get the string length of the biggest string in leftside items
		// this will be used to format neatly
		int maxSpaces = 0;
		for(int i=0;i<leftSide.size();i++){
			if(leftSide.get(i).length() > maxSpaces)
				maxSpaces = leftSide.get(i).length();
		}
		
		// if spacing is too little add some!
		if (maxSpaces <= 1)
			maxSpaces = 4;
		
		// do actual printing
		int i = 0;
		for(i = 0; i < leftSide.size(); i++){
			String roman = this.convertToRoman((i + 1));
			console.draw("(" + roman + ")");
			
			String lineToPrint = "";
			// Put the appropriate number of spaces to account for roman numeral string length
			// using 5 because max roman numeral allowed is MMMM(4000) of length=4.
			for(int k=0; k<=(4 - roman.length());k++)
				lineToPrint += " ";
			
			lineToPrint += leftSide.get(i);
		
			// Put the appropriate number of spaces to account for left side items string length
			for(int j=0; j<=((maxSpaces+2)-leftSide.get(i).length()); j++)
				lineToPrint += " ";
			
			lineToPrint += "(" + (i + 1) + ") " + this.rightSide.get(i) + "\n";
			
			console.draw(lineToPrint);
		}
	}
	
	/**
	 * Converts the n integer to roman numerals
	 * @param n decimal integer to be converted
	 * @return
	 */
	public String convertToRoman(int n){
		return RomanConversion.binaryToRoman(n);
	}

	public String getQuestionType() {
		return questionType;
	}
	
	/**
	 * In case null values get into ArrayList
	 * compensate for them by adding "".  Hence allows for matching questions 
	 * to have some options not matching anything!
	 */
	public void calibrate(){
		int leftSize = this.leftSide.size();
		int rightSize = this.rightSide.size();

		if(leftSize != rightSize){
			System.out.println("calibrating leftCount=" + leftSize + ", rightCount=" + rightSize);
			if(leftSize > rightSize ){
			
				for(int i=0; i<(leftSize-rightSize);i++)
					this.rightSide.add(" ");
			} else {
			
				for(int i=0; i<(rightSize-leftSize);i++)
					this.leftSide.add(" ");
			}
			//System.out.println(" after calibrating leftCount=" + this.leftSide.size() + ", rightCount=" + this.rightSide.size());
		}
	}

}
