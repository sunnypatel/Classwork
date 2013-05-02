import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;

public class Survey {

	private String surveyName;
	private String surveyPath;
	
	private ArrayList<Question> questions;
	private AnswerSheet answerSheet;
	
	public Survey() {

		questions = new ArrayList<Question>();
		answerSheet = new AnswerSheet();
		surveyName = "";
		surveyPath = "";
	}

	public int getNumberOfQuestions() {
		return questions.size();
	}

	public String getSurveyName() {
		return surveyName;
	}
	
	public void setSurveyName(String name) {
		this.surveyName = name;
	}

	public void setQuestions(ArrayList<Question> questions) {
		this.questions = questions;
	}

	public ArrayList<Question> getQuestions() {
		return this.questions;
	}
	
	public void addQuestion(Question question){
		this.questions.add(question);
	}
	
	public void setSurveyPath(String path){
		this.surveyPath = path;
	}
	
	public String getSurveyPath(){
		return this.surveyPath;
	}
	
	public Question getQuestion_byId(int index){
		if(index < questions.size()){
			return questions.get(index);
		} else {
			return null;
		}
	}
	
	public void take(){
		Creader rd = new Creader();
		System.out.println("Your name:");
		String userName = rd.readLine();
		int count = 0;
		
		for(Question q : this.questions){
			
			count++;
			System.out.print("#" + count + " ");			
			q.displayQuestion();
			
			// ask for answer
			String ans = rd.readLine();
			System.out.println("You entered: " + ans);
			Response r = new Response(ans);
			this.answerSheet.addAns(r);
			
		}
		
		try {
			this.saveAnswerSheet(userName);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void displayQuestions() {
		int count = 0;
		for (Question q : this.questions) {
			count++;
			System.out.print("#" + count + " ");
			q.displayQuestion();
			System.out.println("");
		}
	}

	
	public void saveAnswerSheet(String name) throws FileNotFoundException {

		try {
			// TODO file name checking and better implementation
			FileOutputStream fileOut = new FileOutputStream(this.getSurveyName() + name +"-answerSheet");
			ObjectOutputStream out = new ObjectOutputStream(fileOut);
			out.writeObject(this.answerSheet);
			out.close();
			fileOut.close();

		} catch (IOException e) {
			// I/O error
			e.printStackTrace();
		}
	}
	
	/**
	 * Saves the survey questions in a filenamed [survey_name].q
	 * 
	 * @throws IOException
	 */
	public void save() throws FileNotFoundException {
		String directoryName = this.surveyPath + this.surveyName;
		// try creating the directory for this survey if it doesn't already exist
		File theDir = new File(directoryName);

		  // if the directory does not exist, create it
		  if (!theDir.exists())
		  {
		    System.out.println("creating directory: " + directoryName);
		    boolean result = theDir.mkdir();  
		    if(result){    
		       System.out.println("DIR created");  
		     }

		  }
		
		
		try {
			FileOutputStream fileOut = new FileOutputStream(this.getSurveyPath() + this.getSurveyName());
			ObjectOutputStream out = new ObjectOutputStream(fileOut);
			out.writeObject(this.getQuestions());
			out.close();
			fileOut.close();

		} catch (IOException e) {
			// I/O error
			e.printStackTrace();
		}
	}

	/**
	 * Loads a survey from .q file located in saves/survey/
	 * 
	 * @param filename
	 *            name of survey to load
	 * @throws FileNotFoundException
	 */
	@SuppressWarnings("unchecked")
	public boolean load(String filename) throws FileNotFoundException {
		try {
			FileInputStream fileIn = new FileInputStream(filename);
			ObjectInputStream in = new ObjectInputStream(fileIn);
			// try reading object from file
			try {
				this.setQuestions((ArrayList<Question>) in.readObject());
				this.setSurveyName(filename);
				in.close();
				return true;
			} catch (ClassNotFoundException e) {
				// bad input
				//e.printStackTrace();
				in.close();
				System.out.println("Bad input");
				return false;
			}
			
		} catch (IOException e) {
			// I/O error
			// e.printStackTrace();
			// TODO error logging
			return false;
		}
	
	}

}
