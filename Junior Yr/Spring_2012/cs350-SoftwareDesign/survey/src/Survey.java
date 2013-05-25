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
	private DisplayDriver console;
	private ArrayList<Question> questions;
	
	public Survey() {

		questions = new ArrayList<Question>();
		this.console = new TextDriver();
		this.surveyName = "";
		this.surveyPath = "";
	}
	
	public Survey(String surveyName, String surveyPath){
		questions = new ArrayList<Question>();
	
		this.surveyName = surveyName;
		this.surveyPath = surveyPath;
		this.console = new TextDriver();
		createSurveyDirs();
		
		try {
			this.save();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("Error saving survey.");
		}
	}

	public int getNumberOfQuestions() {
		return questions.size();
	}

	public String getName() {
		return surveyName;
	}
	
	public void setSurveyName(String name) {
		
		// name passed in includes the full path and surveyQuestions, setup path and name properly
		if( name.lastIndexOf("/surveyQuestions") != -1) {

			this.setSurveyName(name.substring(0,name.lastIndexOf("/surveyQuestions")));

		} else if(name.lastIndexOf("/") != -1){
			// passed in the full path to survey, parse what we need to

			// set dir
			this.surveyPath = name.substring(0,name.lastIndexOf("/"));
	
			//nset name of survey
			this.surveyName = name.substring(this.surveyPath.length()+1);
		
		}
		else {
			// normal name
			this.surveyName = name;
		}
	}

	public void setQuestions(ArrayList<Question> questions) {
		this.questions = questions;
	}

	public ArrayList<Question> getQuestions() {
		return this.questions;
	}
	
	public void addQuestion(Question question){
		this.questions.add(question);
		System.out.println("Question #" + this.getQuestions().size() + " added.");
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
	
	@SuppressWarnings("finally")
	public AnswerSheet take(){
		Creader rd = new Creader();
		System.out.print("Your name: ");
		AnswerSheet sheet = new AnswerSheet();
		String userName = rd.readLine();
		int count = 0;
		
		for(Question q : this.questions){
			
			count++;
			System.out.print("#" + count + " ");			
			q.displayQuestion();
			
			// ask for answer
			String ans = rd.readLine();
			
			System.out.println("You entered: " + ans);
			if(q.getQuestionType() != "Essay"){
			Response r = new Response(ans);
			sheet.addAns(r);
			}
		}
		System.out.println("Finished!");
		
		try {
			this.saveAnswerSheet(userName, sheet);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			return sheet;
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

	public String getType(){
		return "survey";
	}
	
	public void saveAnswerSheet(String name, AnswerSheet sheet) throws FileNotFoundException {

		try {
			// TODO file name checking and better implementation
			FileOutputStream fileOut = new FileOutputStream(this.surveyPath +"/" + this.surveyName +"/responses/" + name);
			ObjectOutputStream out = new ObjectOutputStream(fileOut);
			out.writeObject(sheet);
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

		try {
			FileOutputStream fileOut = new FileOutputStream(this.getSurveyPath() + "/" + this.getName() + "/surveyQuestions");
			ObjectOutputStream out = new ObjectOutputStream(fileOut);
			out.writeObject(this.getQuestions());
			out.close();
			fileOut.close();

		} catch (IOException e) {
			// I/O error
			e.printStackTrace();
		}
	}

	public void test(){
		console.draw("in survey");
		
	}
	
	// TODO: change this setup
	public void recordAnswer(int i){};
	
	public boolean modify(){
		boolean success = false;
		
		this.displayQuestions();
		boolean done = false;
		Creader rd = new Creader();
		while(!done){
			int res = 0;
			console.draw("Select question you would like to modify (type '\\done' when finished): ");
			try{
				String input = rd.readLine();
				
				if(input.equals("\\done")){
					done = true;
				} else {
					
    				res = Integer.parseInt(input);
    				if(res <= this.getNumberOfQuestions() && res > 0){
    					this.getQuestion_byId(res-1).modify();
    					this.recordAnswer(res-1);
    					
    					console.draw("Modifying '" + this.getName() + "' done.  Attempting to save...");
    					// done modifying survey
    					// save the modified survey back
    					try {
    						save();
    						console.draw("Done.");
    						console.draw();
    						success = true;
    					} catch (FileNotFoundException e) {
    						console.draw("Failed."); 
    						console.draw();
    						success = false;
    					}
    					this.test();
    				} else {
    					console.draw("Please select valid question to modify");
    					done = false;
    				}
				}
			} catch(Exception e){
				console.draw("Please select valid option.");
				console.draw();
				done = false;
			}

		}
		return success;
	}
	
	
	/**
	 * Loads a survey from .q file located in saves/survey/
	 * 
	 * @param filename
	 *            name of survey to load
	 * @throws FileNotFoundException
	 */
	@SuppressWarnings("unchecked")
	public boolean load(String pathToSurvey) throws FileNotFoundException {
		try {
			System.out.print("Loading \"" + pathToSurvey + "\"... ");
			FileInputStream fileIn = new FileInputStream(pathToSurvey + "/surveyQuestions");
			ObjectInputStream in = new ObjectInputStream(fileIn);
			// try reading object from file
			try {
				this.setQuestions((ArrayList<Question>) in.readObject());
				this.setSurveyName(pathToSurvey);
				in.close();
				System.out.println("Done");
				return true;
			} catch (ClassNotFoundException e) {
				// bad input
				//e.printStackTrace();
				in.close();
				System.out.println("Bad input");
				return false;
			}
			
		} catch (Exception e) {
			// I/O error
			// e.printStackTrace();
			// TODO error logging
			System.out.println("Unable to locate file.  Please be sure to have typed the filename correctly.");
			return false;
		}
	
	}
	
	public void createSurveyDirs(){
		this.createSurveyDirs("");
	}
	
	public void createSurveyDirs(String path){
		String surveyPath = (path.length() > 0) ? path : this.surveyPath;
		
		String directoryName = surveyPath + "/" + this.surveyName;
		// try creating the directory for this survey if it doesn't already exist
		File theDir = new File(directoryName);

		  // if the directory does not exist, create it
		  if (!theDir.exists())
		  {
		   //System.out.println("creating directory: " + directoryName);
		    boolean result = theDir.mkdirs();  
		    if(result){    
		      // System.out.println("DIR created");  
		     }
		    
		   // System.out.println("creating directory: " + directoryName + "/responses");
		    File responsesDir = new File(directoryName + "/responses");
		    boolean result2 = responsesDir.mkdirs();
		    if(result2){
		    	//System.out.println("Responses dir created");
		    }
		    
		   // System.out.println("creating directory: " + directoryName + "/answersheet");
		    File answerSheetDir = new File(directoryName + "/correctAnswerSheet");
		    boolean result3 = answerSheetDir.mkdirs();
		    if(result3){
		    	//System.out.println("Answer Sheet dir created");
		    }
		   
		    
		  }
	}

}
