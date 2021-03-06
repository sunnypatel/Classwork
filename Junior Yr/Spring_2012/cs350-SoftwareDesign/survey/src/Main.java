import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.lang.Math;


public class Main {

	private String survey_location = "saves/survey";
	private String test_location = "saves/test";
	private DisplayDriver console = new TextDriver();
	private Survey survey;
	private Test test;
	
	private Menu mainMenu;
	private Menu newSurveyMenu;
	private Menu newTestMenu;
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Main main = new Main();
		main.mainMenu();
	}
	
	/****************************************************/
	/*                 MAIN MENU                        */
	/****************************************************/
	public void createMainMenu(){
		if(this.mainMenu == null){
			this.mainMenu = new Menu("Main Menu");
			mainMenu.addOption("Create a new Survey");
			mainMenu.addOption("Create a new Test");
			mainMenu.addOption("Display Survey");
			mainMenu.addOption("Display Test");
			mainMenu.addOption("Load a Survey");
			mainMenu.addOption("Load a Test");
			mainMenu.addOption("Save Survey");
			mainMenu.addOption("Save Test");
			mainMenu.addOption("Exit");
		}
	}

	public void mainMenu(){

		this.createMainMenu();
		
		int opt = mainMenu.run();
		
		switch (opt) {
		case 1: // load survey menu
			createSurvey();
			break;
		case 2: // load test menu
			this.createTest();
			break;
		case 3: // Display a survey
			this.displaySurvey();
			break;
		case 4:
			this.displayTest();
			break;
		case 5:
			this.loadSurvey();
			break;
		case 6:
			this.loadTest();
			break;
		case 7:
			this.saveSurvey();
			break;
		case 8:
			this.saveTest();
			break;
		case 9:
			console.draw("Exiting...");
			console.draw();
			break;
		default:
			System.out.println("I don't know what to do");
		}
	}
	
	/****************************************************/
	/*            CREATE A SURVEY                       */
	/****************************************************/
	public void createSurvey() {
		Creader rd = new Creader();
		
		System.out.println("");
		System.out.println("");
		System.out.print("Survey name: ");
		Survey survey = new Survey(rd.readLine(), this.survey_location);
		
		editSurveyMenu(survey);
	}

	public void createNewSurveyMenu(String surveyName){
		if(this.newSurveyMenu == null){
			this.newSurveyMenu = new Menu("Creating new survey: " + surveyName);
			newSurveyMenu.addOption("Add a new T/F question");
			newSurveyMenu.addOption("Add a new multiple choice question");
			newSurveyMenu.addOption("Add a new short answer question");
			newSurveyMenu.addOption("Add a new essay question");
			newSurveyMenu.addOption("Add a new ranking question");
			newSurveyMenu.addOption("Add a new matching question");
			newSurveyMenu.addOption("Close");
		}
	}
	public void editSurveyMenu(Survey survey){
		this.createNewSurveyMenu(survey.getSurveyName());
		int opt = 0;
		Boolean done = false;
		
		while(!done){
			opt = newSurveyMenu.run();
			switch(opt){
			case 1: // True / False
				survey.addQuestion(new TrueFalse());
				break; 
			case 2:
				// Multiple Choice
				survey.addQuestion(new MultipleChoice(1));
				break;			
			case 3:// Short Answer
				survey.addQuestion(new ShortAns());
				break; 
			case 4: // Essay
				survey.addQuestion(new Essay());
				break;
			case 5: // Ranking
				Ranking ranking = new Ranking();
				survey.addQuestion(ranking);
				break;
			case 6: // Matching
				Matching matching = new Matching();
				matching.create(); // <----- TODO DONT LIKE THIS CHANGE IF TIME
				survey.addQuestion(matching);
				break;
			case 7: // Done
				done = true;
				break;
			default:
				System.out.println("Something terrible happened! :(");
			
			}
		}
		try {
			survey.save();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			console.draw("Unable to save.");
		}
		//importSurvey(survey);
		// go back to main menu when done here
		mainMenu();
	}	
	public void importSurvey(Survey survey){
		this.survey = survey;
	}
	/****************************************************/
	/*              CREATE A TEST                       */
	/****************************************************/
	public void createTest() {
		Creader rd = new Creader();
		
		System.out.println("");
		System.out.print("Test name: ");
		Test test = new Test(rd.readLine(), this.test_location);
		
		editTestMenu(test);
	}
	public void createNewTestMenu(String testName){
		if(this.newTestMenu == null){
			this.newTestMenu = new Menu("Creating new test: " + testName);
			newTestMenu.addOption("Add a new T/F question");
			newTestMenu.addOption("Add a new multiple choice question");
			newTestMenu.addOption("Add a new short answer question");
			newTestMenu.addOption("Add a new essay question");
			newTestMenu.addOption("Add a new ranking question");
			newTestMenu.addOption("Add a new matching question");
			newTestMenu.addOption("Close");
		}
	}
	public void editTestMenu(Test test) {
		this.createNewTestMenu(test.getSurveyName());
		int opt = 0;
		Boolean done = false;
		
		while(!done){
			opt = newTestMenu.run();
			switch(opt){
			case 1: // True / False
				test.addQuestion(new TrueFalse());
				break; 
			case 2:
				// Multiple Choice
				test.addQuestion(new MultipleChoice(1));
				break;			
			case 3:// Short Answer
				test.addQuestion(new ShortAns());
				break; 
			case 4: // Essay
				test.addQuestion(new Essay());
				break;
			case 5: // Ranking
				Ranking ranking = new Ranking();
				test.addQuestion(ranking);
				break;
			case 6: // Matching
				Matching matching = new Matching();
				matching.create(); // <----- TODO DONT LIKE THIS CHANGE IF TIME
				test.addQuestion(matching);
				break;
			case 7: // Done
				done = true;
				break;
			default:
				System.out.println("Something terrible happened! :(");
			
			}
		}
		test.recordAnswerSheet();
		try {
			test.save();
		} catch (FileNotFoundException e) {
			console.draw("Unable to save.");
		}
		mainMenu();
	}
	public void importTest(Test importTest){
		this.test = importTest;
	}
	/****************************************************/
	/*              DISPLAY A TEST                      */
	/****************************************************/
	public void displayTest(){
		if(test == null){
			console.draw("No test loaded.  You need to load a test or create a new test.");
		} else {
			test.displayQuestions();
		}
		mainMenu();
	}
	public void saveTest(){
		if(test == null){
			console.draw("No test loaded.  You need to load a test or create a new test.");
		} else {
			try {
				test.save();
			} catch (FileNotFoundException e) {
				console.draw("Unable to save.");
				console.draw();
			}
		}
		mainMenu();
	}	
	public void saveSurvey(){
		if(test == null){
			console.draw("No survey loaded.  You need to load a survey or create a new test.");
		} else {
			try {
				survey.save();
			} catch (FileNotFoundException e) {
				console.draw("Unable to save.");
				console.draw();
			}
		}
		mainMenu();		
	}
	public void loadTest(){
		Creader rd = new Creader();
		boolean done = false;
		System.out.println("");
		System.out.println("Load Test");
		listTests();
		//System.out.println("Options:");
		//System.out.println("type \\list    to view all available surveys)");
		System.out.println("type \\back    to return to previous menu)");
		do {
			System.out.println("");
			// TODO add the abiltity to load using ID# 
			System.out.print("Enter test name to load: ");

			// get user input
			String option = rd.readLine();
			// make sure user has inputed something
			if (option.length() > 0) {
				if(option.equals("\\list")){
					// user wants all the surveys listed
					listSurveys();
				} else if(option.equals("\\back")){
					// user wants to go back to survey main menu
					mainMenu();
				}
				else{ // load test
					Test loadingTest = new Test();
					// option is the survey name
					try {
						if(loadingTest.load(this.test_location + "/" + option)){
							importTest(loadingTest);
							done = true;
						}
					} catch (FileNotFoundException e) {
						System.out.println("File not found. Please try again.");
						//loadSurvey_byIndex(Integer.parseInt(option));
					} catch (Exception e){
						console.draw("An unknown error has occured please try again.");
					}
				}
			} else {
				done = false;
				System.out.println("Sorry, input not recognized. Please try again.");
			}
		} while (!done);
		
		mainMenu();
	}
	/****************************************************/
	/*              DISPLAY A SURVEY                    */
	/****************************************************/
	public void displaySurvey(){
		if(survey == null){
			console.draw("No survey loaded. You need to load a survey or create a new survey");
		} else {
			survey.displayQuestions();
		}
		mainMenu();
	}
	/****************************************************/
	/*                LOAD A SURVEY                     */
	/****************************************************/
	public void loadSurvey(){
		Creader rd = new Creader();
		boolean done = false;
		System.out.println("");
		System.out.println("Load survey");
		listSurveys();
		//System.out.println("Options:");
		//System.out.println("type \\list    to view all available surveys)");
		System.out.println("type \\back    to return to previous menu)");
		do {
			System.out.println("");
			// TODO add the abiltity to load using ID# 
			System.out.print("Enter survey name to load: ");

			// get user input
			String option = rd.readLine();
			// make sure user has inputed something
			if (option.length() > 0) {
				if(option.equals("\\list")){
					// user wants all the surveys listed
					listSurveys();
				} else if(option.equals("\\back")){
					// user wants to go back to survey main menu
					mainMenu();
				}
				else{ // load survey
					Survey loadingSurvey = new Survey();
					// option is the survey name
					try {
						if(loadingSurvey.load(this.survey_location + "/" + option)){
							importSurvey(loadingSurvey);
							done = true;
						}
					} catch (FileNotFoundException e) {
						System.out.println("File not found. Please try again.");
						//loadSurvey_byIndex(Integer.parseInt(option));
					} catch (Exception e){
						console.draw("An unknown error has occured please try again.");
					}
				}
			} else {
				done = false;
				System.out.println("Sorry, input not recognized. Please try again.");
			}
		} while (!done);
		
		mainMenu();
	}
	public void listTests(){
		ArrayList<String> tests = getDirs(test_location);
		
		printList(tests, "Id #","Tests");
	}
	public void listSurveys(){
		ArrayList<String> surveys = getDirs(survey_location);
		
		printList(surveys, "Id #","Surveys");
	}
	/**
	 * Neatly prints a formated list with index numbers
	 * TODO clean up if you have time
	 * @param list ArrayList<String> to be printed out
	 */
	public void printList(ArrayList<String> list, String title, String title2){
		
		int count =0;
		// maxSpaces for id shouldn't be less than 2 because "id".length = 2
		int maxSpaces_id =  ((int) Math.log10(list.size()) > title.length()) ? (int) Math.log10(list.size()) : title.length();	// should give the max number of digits for index# of last file
		// set 8 because the title 'filename' has 8 characters 
		int maxSpaces_name = title2.length();
		int total_spaces = 0;
		
		for (String filename : list){
			if(filename.length() > maxSpaces_name)
				maxSpaces_name = filename.length() + 1;
		}
		// plus to account for space added in front of titles and other things
		total_spaces = maxSpaces_id + maxSpaces_name + 5;
		
		// print top border
		System.out.print("+");
		for(int i=0;i<=total_spaces;i++)
			System.out.print("-");
		System.out.println("+");
		
		// print title
		System.out.print("|");
		System.out.print(" "+title);
		// put appropriate number of spaces for id column
		for(int i=0;i<=maxSpaces_id-(title.length());i++)
			System.out.print(" ");
		System.out.print(" |");
				
		// start printing name column
		System.out.print(" "+title2);
		// put appropriate number of spaces for name column
		for(int i=0; i <= (maxSpaces_name - title2.length()); i++)
			System.out.print(" ");
					
		System.out.println("|");

		

		// print border
		System.out.print("+");
		for(int i=0;i<=total_spaces;i++)
			System.out.print("-");
		System.out.println("+");		
		
		if(list.size() > 0){
			// start printing filenames
			for (String filename : list){
				System.out.print("|");
				count++;
				// start printing id column
				int idStr_length = (int) Math.log10(count);
				System.out.print(" "+ count);
				// put appropriate number of spaces for id column
				for(int i=0;i<=maxSpaces_id-(idStr_length);i++)
					System.out.print(" ");
				System.out.print("|");
				
				// start printing name column
				System.out.print(" "+ filename);
				// put appropriate number of spaces for name column
				for(int i=0; i<=maxSpaces_name - (filename.length()); i++)
					System.out.print(" ");
				
				System.out.println("|");
			}
		} else {
			System.out.println("    None    ");
		}
		// ending bottom border
		System.out.print("+");
		for(int i=0;i<=total_spaces;i++)
			System.out.print("-");
		System.out.println("+");		
	}
	
	public ArrayList<String> getFiles(String path){
		ArrayList<String> fileList = new ArrayList<String>();
		  String files;
		  File folder = new File(path);
		  File[] listOfFiles = folder.listFiles(); 
		 
		  for (int i = 0; i < listOfFiles.length; i++) 
		  {
		 
		   if (listOfFiles[i].isFile()) 
		   {
		   files = listOfFiles[i].getName();
		   fileList.add(files);
		     }
		  }
		  return fileList;
	}
	
	public ArrayList<String> getDirs(String path){
		File file = new File(path);
		String[] directories = file.list(new FilenameFilter() {
		  @Override
		  public boolean accept(File dir, String name) {
		    return new File(dir, name).isDirectory();
		  }
		});
		
		// convert string array to ArrayList
		ArrayList<String> dirs = new ArrayList<String>();
		dirs.addAll(Arrays.asList(directories));
		
		return dirs;
	}
}
