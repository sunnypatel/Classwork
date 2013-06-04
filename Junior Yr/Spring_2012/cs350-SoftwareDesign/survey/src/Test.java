import java.io.*;
import java.util.ArrayList;


public class Test extends Survey{


	private AnswerSheet answerSheet_correct;
	
	public Test(){

		setAnswerSheet_correct(new AnswerSheet());
	}

	public Test(String name, String path){

		setAnswerSheet_correct(new AnswerSheet());
		
		this.setSurveyName(name);
		this.setSurveyPath(path);
		
		this.createSurveyDirs();
		
		this.save();
	}
	
	
	public void displayQuestions() {
		int count = 0;
		for (Question q : this.getQuestions()) {
			count++;
			console.draw("#" + count + " ");
			q.displayQuestion(this.console);
			console.draw();
			console.draw("Correct Ans: " + this.getAnswerSheet_correct().getAns(count - 1).getResponse().toString());
			console.draw();
		}
	}
	
	public void recordAnswer(int questionIndex){
		Creader rd = new Creader();
		this.getQuestion_byId(questionIndex).displayQuestion();
		console.draw("Enter correct answer: ");
		String res = rd.readLine();
		
		this.getAnswerSheet_correct().setAns(questionIndex, res);
	}
	
	public void recordAnswerSheet(){
		console.draw("Record new answer sheet");
		
		setAnswerSheet_correct(super.take());
		
		try {
			this.saveCorrectAnswerSheet("answerSheet", this.getAnswerSheet_correct());
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			console.draw("err in test:recordAnswerSheet() ");
		}
	}

	/**
	 * Returns the number of wrong answers
	 * @param sheet
	 * @return number of incorrect answers
	 */
	public int grade(AnswerSheet sheet){
		AnswerSheet correctSheet = loadAnswerSheet_correct("answerSheet");
		
		if (correctSheet == null)
			return -1;
		
		int wrongAnswers = 0;
		
		for( Response correctR : correctSheet.getCorrectAns() ){
			for (Response r : sheet.getCorrectAns() ){
				if(!r.equals(correctR)){
					wrongAnswers++;
				}
			}
		}
		
		return wrongAnswers;
	}
	
	public boolean load(String pathToTest){
		boolean success = false;
		try {
			super.load(pathToTest);
			this.loadAnswerSheet_correct("answerSheet");
			success = true;
		} catch (FileNotFoundException e) {
			// TODO: add stuff here
		}
		return success;
	}
	
	public AnswerSheet take(){
		if(loadAnswerSheet_correct("answerSheet") == null)
			return null;
		return super.take();
	}
	
	public AnswerSheet getAnswerSheet_correct(){
		return this.answerSheet_correct;
	}

	/**
	 * Should be used to load in correct answer sheet for test.
	 * Sets the correct answer after loading is complete.
	 * @param name
	 * @return currect answer sheet
	 */
	public AnswerSheet loadAnswerSheet_correct(String name) {
		try {
			String ansSheetPath = this.getSurveyPath() + "/" + this.getName() + "/correctAnswerSheet/" + name;
			//console.draw("Loading answer sheet: " + ansSheetPath);
			FileInputStream fileIn = new FileInputStream(ansSheetPath);
			ObjectInputStream in = new ObjectInputStream(fileIn);
			// try reading object from file
			try {
				AnswerSheet correctSheet = (AnswerSheet) in.readObject();
				// actually set the answer sheet
				this.setAnswerSheet_correct(correctSheet);
				in.close();
				//console.draw("Done");
				return correctSheet;
			} catch (ClassNotFoundException e) {
				// bad input
				//e.printStackTrace();
				in.close();
				console.draw("Bad input - Answer Sheet ");
				return null;
			}
			
		} catch (IOException e) {
			// I/O error
			// e.printStackTrace();
			// TODO error logging
			console.draw("I/O error has occurred.");
			return null;
		}
	
	}

	public void setAnswerSheet_correct(AnswerSheet answerSheet_correct) {
		this.answerSheet_correct = answerSheet_correct;
	}
	
	public void saveCorrectAnswerSheet(String name, AnswerSheet sheet) throws FileNotFoundException {

		try {
			// TODO file name checking and better implementation
			FileOutputStream fileOut = new FileOutputStream(this.getSurveyPath() +"/" + this.getName() +"/correctAnswerSheet/" + name);
			ObjectOutputStream out = new ObjectOutputStream(fileOut);
			out.writeObject(sheet);
			out.close();
			fileOut.close();

		} catch (IOException e) {
			// I/O error
			e.printStackTrace();
		}
	}
	
	public void save(){
		try {
			super.save();
			this.saveCorrectAnswerSheet("answerSheet", this.getAnswerSheet_correct());
		} catch (FileNotFoundException e) {
			console.draw("Error saving test.");
		}
		
	}
}
