import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.lang.Math;


public class Main_back {

	private String survey_location = "saves/survey";
	private String test_location = "saves/test";
	
	private Menu mainMenu;
	private Menu newSurveyMenu;

	
	public void createMainMenu(){
		if(this.mainMenu == null){
			this.mainMenu = new Menu("Main Menu");
			mainMenu.addOption("Create a new Survey");
			mainMenu.addOption("Create a new Test");
			mainMenu.addOption("Display Survey");
			mainMenu.addOption("Display a Test");
			mainMenu.addOption("Load a Survey");
			mainMenu.addOption("Load a Test");
			mainMenu.addOption("Save a Survey");
			mainMenu.addOption("Save a Test");
			mainMenu.addOption("Exit");
		}
	}
	public void createNewSurveyMenu(){
		if(this.newSurveyMenu == null){
			this.newSurveyMenu = new Menu("Create new survey");
			newSurveyMenu.addOption("Add a new T/F question");
		}
	}
	public void mainMenu(){

		this.createMainMenu();
		
		int opt = mainMenu.run ();
		
		switch (opt) {
		case 1: // load survey menu
			newSurveyMenu();
			break;
		case 2: // load test menu
			testMainMenu();
			break;
		case 3: // Exit
			break;
		default:
			System.out.println("Something terrble happened.");
		}
	}
	
	public void newSurveyMenu(){
		
	}	
	public void testMainMenu(){
		Creader rd = new Creader();
		boolean done = false;
		
		System.out.println("");
		System.out.println("-- Main Menu: Test --");
		do {
			System.out.println("");
			System.out.println(" (1) Create new test");
			System.out.println(" (2) Load test");
			System.out.println(" ---------------------");
			System.out.println(" (3) Back");
			// get user input
			String option = rd.readLine();
			// make sure user has inputed something
			if (option.length() > 0) {

				System.out.println("You selected option " + option);

				switch (Integer.parseInt(option)) {
				case 1: // Create new survey
					createTest();
					break;
				case 2: // load survey
					loadTest();
					break;
				case 3: // Go back
					mainMenu();
					break;
				default:
					System.out.println("Sorry, input not recognized. Please try again.");
					done = false;
				}
			} else {
				done = false;
				System.out.println("Sorry, input not recognized. Please try again.");
			}
		} while (!done);		
	}
	
	public void createTest() {
		Creader rd = new Creader();
		
		System.out.println("");
		System.out.println("-- Menu: Create new test --");
		System.out.print("Test name: ");
		Test test = new Test(rd.readLine(), this.test_location);
		
		editTestMenu(test);
	}
	
	public void loadTest(){
		Creader rd = new Creader();
		boolean done = false;
		System.out.println("");
		System.out.println("-- Menu: Load test --");
		listTests();

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
					// user wants all the tests listed
					listSurveys();
				} else if(option.equals("\\back")){
					// user wants to go back to test main menu
					testMainMenu();
				}
				else{ // load survey
					Test test = new Test();
					// option is the survey name
					try {
						if(test.load(test_location + "/" + option))
							editTestMenu(test);
						
					} catch (FileNotFoundException e) {
						System.out.println("File not found. Please try again.");
						//loadSurvey_byIndex(Integer.parseInt(option));
					}
				}
			} else {
				done = false;
				System.out.println("Sorry, input not recognized. Please try again.");
			}
		} while (!done);
	}
	
	public void editTestMenu(Test test) {
		Creader rd = new Creader();
		boolean done = false;
		boolean errors = false;
		boolean print = true;
		int opt = -1;
		int questionCount = 0;

		do {
			print = true;
			errors = false;
			
			// What type of question are we creating?
			System.out.println("");
			System.out.println("-- Test: " + test.getSurveyName() + " --");
			System.out.println("To add a question, select a type of question ");
			System.out.println("from the following options or select 'Save & Close' when finished.");

			System.out.println(" (1) Multiple Choice");
			System.out.println(" (2) True or False");
			System.out.println(" (3) Matching");
			System.out.println(" (4) Ranking");
			System.out.println(" (5) Essay");
			System.out.println(" (6) Short Answer");
			System.out.println(" --------------------");
			System.out.println(" (7) List all questions");
			System.out.println(" (8) Take this test");
			System.out.println(" (9) Record new answer sheet");
			System.out.println(" (10) Save & Close");
			
			System.out.println("");
			System.out.print("Select: ");
			// get user input
			String option = rd.readLine();
			
			try {
				opt = Integer.parseInt(option);
			} catch (NumberFormatException e){
				errors = true;
			}
			// make sure user has inputed something
			if ((option.length() > 0) && errors == false) {

				System.out.println("You selected option " + option);
				System.out.println("");
				
				switch (opt) {
				case 1: // Multiple Choice
					test.addQuestion(new MultipleChoice(1));
					break;
				case 2: // True / False
					test.addQuestion(new TrueFalse());
					break;
				case 3: // Matching
					Matching matching = new Matching();
					matching.create(); // <----- TODO DONT LIKE THIS CHANGE IF TIME
					test.addQuestion(matching);
					break;
				case 4: // Ranking
					Ranking ranking = new Ranking();
					test.addQuestion(ranking);
					break;
				case 5: // Essay
					test.addQuestion(new Essay());
					break;
				case 6: // Short Answer
					test.addQuestion(new ShortAns());
					break;
				case 7: // List all questions
					test.displayQuestions();
					print = false;
					done = false;
					break;
				case 8:	// Take this survey
					AnswerSheet sheet = test.take();
					if(sheet != null){
					int wrongAnswers = test.grade(sheet);
					int numberOfQuestions = test.getQuestions().size();
					
					System.out.println("Final score: " + (numberOfQuestions - wrongAnswers) + "/" + numberOfQuestions);
					} else {
						System.out.println("Could not find answer sheet to grade.");
					}
					print = false;
					done = false;
					break;
				case 9:
					test.recordAnswerSheet();
					print = false;
					done = false;
					break;
					
				case 10:
					done = true;
					print = false;
					System.out.print("Saving...");

					try {
						test.save();
						System.out.println("Done.");
					} catch (IOException e) {
						System.out.println("Error.");
						//e.printStackTrace();
						errors = true;
					}

					break;
										
				default:
					System.out.println("Sorry, input not recognized. Please try again.");
					System.out.println("No question added");
					System.out.println("");
					errors = true;
				}
			} else {
				errors = true;
				System.out
						.println("Sorry, input not recognized. Please try again.");
				System.out.println("No question added");
				System.out.println("");
			}

			if (!errors && print) {
				questionCount = test.getNumberOfQuestions();
				System.out.println("Question #" + questionCount
						+ " was created successfully.");

				System.out.println("Question as reader would see it: ");
				System.out.println("");
				// ****(MULTI-THREADING WARNING) LINE WILL NOT BE CORRECT IN
				// CASE OF A RACE CONDITION****
				test.getQuestions().get(test.getQuestions().size() - 1).displayQuestion();

			}

		} while(errors || (done == false));
		testMainMenu();
	} // createSurvey()
	
	public void listTests(){
		ArrayList<String> tests = getDirs(test_location);
		
		printList(tests, "Id #","Tests");
	}
	
	public void surveyMainMenu() {
		Creader rd = new Creader();
		boolean done = false;
		
		System.out.println("");
		System.out.println("-- Main Menu: Survey --");
		do {
			System.out.println("");
			System.out.println(" (1) Create new survey");
			System.out.println(" (2) Load survey");
			System.out.println(" ---------------------");
			System.out.println(" (3) Back");
			// get user input
			String option = rd.readLine();
			// make sure user has inputed something
			if (option.length() > 0) {

				System.out.println("You selected option " + option);

				switch (Integer.parseInt(option)) {
				case 1: // Create new survey
					createSurvey();
					break;
				case 2: // load survey
					loadSurvey();
					break;
				case 3: // Go back
					mainMenu();
					break;
				default:
					System.out.println("Sorry, input not recognized. Please try again.");
					done = false;
				}
			} else {
				done = false;
				System.out.println("Sorry, input not recognized. Please try again.");
			}
		} while (!done);
	}
	
	public void editSurveyMenu(Survey survey) {
		Creader rd = new Creader();
		boolean done = false;
		boolean errors = false;
		boolean print = true;
		int opt = 0;
		
		int questionCount = 0;

		do {
			print = true;
			errors = false;
			
			// What type of question are we creating?
			System.out.println("");
			System.out.println("-- Survey: " + survey.getSurveyName() + " --");
			System.out.println("To add a question, select a type of question ");
			System.out.println("from the following options or select 'Save & Close' when finished.");

			System.out.println(" (1) Multiple Choice");
			System.out.println(" (2) True or False");
			System.out.println(" (3) Matching");
			System.out.println(" (4) Ranking");
			System.out.println(" (5) Essay");
			System.out.println(" (6) Short Answer");
			System.out.println(" --------------------");
			System.out.println(" (7) List all questions");
			System.out.println(" (8) Take this survey");
			System.out.println(" (9) Save & Close");
			
			System.out.println("");
			System.out.print("Select: ");
			// get user input
			String option = rd.readLine();
			try {
				opt = Integer.parseInt(option);
			} catch (NumberFormatException e){
				errors = true;
			}
			// make sure user has inputed something
			if ((option.length() > 0) && errors == false) {

				System.out.println("You selected option " + option);
				System.out.println("");
				
				switch (Integer.parseInt(option)) {
				case 1: // Multiple Choice
					survey.addQuestion(new MultipleChoice(1));
					break;
				case 2: // True / False
					survey.addQuestion(new TrueFalse());
					break;
				case 3: // Matching
					Matching matching = new Matching();
					matching.create(); // <----- TODO DONT LIKE THIS CHANGE IF TIME
					survey.addQuestion(matching);
					break;
				case 4: // Ranking
					Ranking ranking = new Ranking();
					survey.addQuestion(ranking);
					break;
				case 5: // Essay
					survey.addQuestion(new Essay());
					break;
				case 6: // Short Answer
					survey.addQuestion(new ShortAns());
					break;
				case 7: // List all questions
					survey.displayQuestions();
					print = false;
					done = false;
					break;
				case 8:	// Take this survey
					survey.take();
					print = false;
					done = false;
					break;
				case 9:
					done = true;
					print = false;
					System.out.print("Saving...");

					try {
						survey.save();
						System.out.println("Done.");
					} catch (IOException e) {
						System.out.println("Error.");
						//e.printStackTrace();
						errors = true;
					}

					break;
				default:
					System.out.println("Sorry, input not recognized. Please try again.");
					System.out.println("No question added");
					System.out.println("");
					errors = true;
				}
			} else {
				errors = true;
				System.out
						.println("Sorry, input not recognized. Please try again.");
				System.out.println("No question added");
				System.out.println("");
			}

			if (!errors && print) {
				questionCount = survey.getNumberOfQuestions();
				System.out.println("Question #" + questionCount
						+ " was created successfully.");

				System.out.println("Question as reader would see it: ");
				System.out.println("");
				// ****(MULTI-THREADING WARNING) LINE WILL NOT BE CORRECT IN
				// CASE OF A RACE CONDITION****
				survey.getQuestions().get(survey.getQuestions().size() - 1).displayQuestion();

			}

		} while(errors || (done == false));
		surveyMainMenu();
	} // createSurvey()
	
	public void createSurvey() {
		Creader rd = new Creader();
		
		System.out.println("");
		System.out.println("-- Menu: Create new survey --");
		System.out.print("Survey name: ");
		Survey survey = new Survey(rd.readLine(), this.survey_location);
		
		editSurveyMenu(survey);
	}
	
	public void loadSurvey(){
		Creader rd = new Creader();
		boolean done = false;
		System.out.println("");
		System.out.println("-- Menu: Load survey --");
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
					surveyMainMenu();
				}
				else{ // load survey
					Survey survey = new Survey();
					// option is the survey name
					try {
						if(survey.load(survey_location + "/" + option))
							editSurveyMenu(survey);
						
					} catch (FileNotFoundException e) {
						System.out.println("File not found. Please try again.");
						//loadSurvey_byIndex(Integer.parseInt(option));
					}
				}
			} else {
				done = false;
				System.out.println("Sorry, input not recognized. Please try again.");
			}
		} while (!done);
	}
	
	public void loadSurvey_byIndex(int index){
		// File name was not found try to use index number to look up filename
		// convert user input to integer index
		Survey survey = new Survey();
		ArrayList<String> surveys = getFiles(survey_location);
		
		if(index <= surveys.size()){
			// index found
			try {
				System.out.println("Searching at index:" + index);
				String filename = surveys.get(index);
				if(survey.load(survey_location + filename))
					editSurveyMenu(survey);
			} catch (FileNotFoundException e){
				// ok i've tried the file really isnt found.
				
				System.out.println("File not found. Please try again.");
				//e1.printStackTrace();								
			}
		}

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
