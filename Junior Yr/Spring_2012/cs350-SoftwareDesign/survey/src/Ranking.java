
public class Ranking extends Matching {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2271897164566862390L;
	private String questionType = "Ranking";

	public Ranking(){
		this.add_leftSide();
		super.calibrate();
		this.setQuestionType(questionType);
	}
	
	public String getQuestionType() {
		return questionType;
	}
	
	public void modify(){
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
	}
}
