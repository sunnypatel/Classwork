import java.io.*;


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
	
	public void recordAnswerSheet(){
		
		setAnswerSheet_correct(super.take());
		
		try {
			this.saveCorrectAnswerSheet("answerSheet", this.getAnswerSheet_correct());
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public AnswerSheet getAnswerSheet_correct() {
		return answerSheet_correct;
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
