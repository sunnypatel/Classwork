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
		create_leftSide();
		create_rightSide();
	}
	
	public void create_leftSide(){
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
	
	public void create_rightSide(){
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
		calibrate();
	}
	
	public void addToRight(String item){
		rightSide.add(item);
		calibrate();
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
	
	public void displayQuestion(){
		super.displayQuestion();	
		
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
			System.out.print("(" + roman + ")");
			
			// Put the appropriate number of spaces to account for roman numeral string length
			// using 5 because max roman numeral allowed is MMMM(4000) of length=4.
			for(int k=0; k<=(4 - roman.length());k++)
				System.out.print(" ");
			
			System.out.print( leftSide.get(i) );
		
			// Put the appropriate number of spaces to account for left side items string length
			for(int j=0; j<=((maxSpaces+2)-leftSide.get(i).length()); j++)
				System.out.print(" ");
			
			System.out.print("(" + (i + 1) + ") " + this.rightSide.get(i) + "\n");
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
	private void calibrate(){
		int leftSize = this.leftSide.size();
		int rightSize = this.rightSide.size();

		if(leftSize != rightSize){
			if(leftSize > rightSize ){
			
				for(int i=0; i<=(leftSize-rightSize);i++)
					this.rightSide.add(" ");
			} else {
			;
				for(int i=0; i<=(rightSize-leftSize);i++)
					this.leftSide.add(" ");
			}
		}
	}

}
