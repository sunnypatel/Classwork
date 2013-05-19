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
		
		try {
			this.save();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("Error saving test.");
		}
	}
	public void displayQuestions() {
		int count = 0;
		for (Question q : this.getQuestions()) {
			count++;
			System.out.print("#" + count + " ");
			q.displayQuestion();
			System.out.println("");
			System.out.print("Correct Ans: ");
			System.out.println(this.getAnswerSheet_correct().getAns(count - 1).toString());
		}
	}
	public void recordAnswerSheet(){
		System.out.println("Record new answer sheet");
		
		setAnswerSheet_correct(super.take());
		
		try {
			this.saveCorrectAnswerSheet("answerSheet", this.getAnswerSheet_correct());
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

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
	
	public AnswerSheet take(){
		if(loadAnswerSheet_correct("answerSheet") == null)
			return null;
		return super.take();
	}
	
	public AnswerSheet getAnswerSheet_correct(){
		return this.answerSheet_correct;
	}
	
	public AnswerSheet loadAnswerSheet_correct(String name) {
		try {
			System.out.print("Loading /" + this.getSurveyPath() + "/... ");
			FileInputStream fileIn = new FileInputStream(this.getSurveyPath() + "/" + this.getSurveyName() + "/correctAnswerSheet/" + name);
			ObjectInputStream in = new ObjectInputStream(fileIn);
			// try reading object from file
			try {
				AnswerSheet correctSheet = (AnswerSheet) in.readObject();
				in.close();
				System.out.println("Done");
				return correctSheet;
			} catch (ClassNotFoundException e) {
				// bad input
				//e.printStackTrace();
				in.close();
				System.out.println("Bad input - Answer Sheet ");
				return null;
			}
			
		} catch (IOException e) {
			// I/O error
			// e.printStackTrace();
			// TODO error logging
			System.out.println("I/O error has occurred.");
			return null;
		}
	}

	public void setAnswerSheet_correct(AnswerSheet answerSheet_correct) {
		this.answerSheet_correct = answerSheet_correct;
	}
	
	public void saveCorrectAnswerSheet(String name, AnswerSheet sheet) throws FileNotFoundException {

		try {
			// TODO file name checking and better implementation
			FileOutputStream fileOut = new FileOutputStream(this.getSurveyPath() +"/" + this.getSurveyName() +"/correctAnswerSheet/" + name);
			ObjectOutputStream out = new ObjectOutputStream(fileOut);
			out.writeObject(sheet);
			out.close();
			fileOut.close();

		} catch (IOException e) {
			// I/O error
			e.printStackTrace();
		}
	}
}
