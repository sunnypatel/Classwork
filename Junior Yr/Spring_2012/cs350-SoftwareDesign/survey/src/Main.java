import java.io.*;
import java.util.ArrayList;
import java.lang.Math;


public class Main {

	private String survey_location = "saves/survey/";
	private String test_location = "saves/test/";
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Main main = new Main();
		main.mainMenu();
		
	}
	
	public void mainMenu(){
		surveyMainMenu();
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
		
		int questionCount = 0;

		do {
			print = true;

			// What type of question are we creating?
			System.out.println("");
			System.out.println("-- Survey: " + survey.getName() + " --");
			System.out.println("To add a question, select a type of question ");
			System.out.println("from the following options or select Done when finished.");

			System.out.println(" (1) Multiple Choice");
			System.out.println(" (2) True or False");
			System.out.println(" (3) Matching");
			System.out.println(" (4) Ranking");
			System.out.println(" (5) Essay");
			System.out.println(" (6) Short Answer");
			System.out.println(" --------------------");
			System.out.println(" (7) List all questions");
			System.out.println(" (8) Save & Close");

			// get user input
			String option = rd.readLine();

			// make sure user has inputed something
			if (option.length() > 0) {

				System.out.println("You selected option " + option);

				switch (Integer.parseInt(option)) {
				case 1: // Multiple Choice
					survey.addQuestion(new MultipleChoice(1));
					break;
				case 2: // True / False
					survey.addQuestion(new TrueFalse());
					break;
				case 3: // Matching
					Matching matching = new Matching();
					matching.create(); // <----- DONT LIKE THIS CHANGE IF TIME
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
				case 8:
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
				questionCount = questionCount + 1;
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
		Survey survey = new Survey();
		
		System.out.println("");
		System.out.println("-- Menu: Create new survey --");
		System.out.print("Survey name:");
		survey.setName(rd.readLine());
		
		editSurveyMenu(survey);
	}
	
	public void loadSurvey(){
		Creader rd = new Creader();
		boolean done = false;
		System.out.println("");
		System.out.println("-- Menu: Load survey --");
		System.out.println("Options:");
		System.out.println("type \\list    to view all available surveys)");
		System.out.println("type \\back    to return to previous menu)");
		do {
			System.out.println("");
			System.out.println("Enter survey name or ID# to load:");

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
						if(survey.load(survey_location + option))
							editSurveyMenu(survey);
						
					} catch (FileNotFoundException e) {
						
						// File name was not found try to use index number to look up filename
						// convert user input to integer index
						int index = Integer.parseInt(option);
						ArrayList<String> surveys = getFiles(survey_location);
						
						if(index <= surveys.size()){
							// index found
							try {
								System.out.println("Searching at index:" + index);
								String filename = surveys.get(index);
								if(survey.load("saves/survey/" + filename))
									editSurveyMenu(survey);
							} catch (FileNotFoundException e1){
								// ok i've tried the file really isnt found.
								done = false;
								System.out.println("File not found. Please try again.");
								//e1.printStackTrace();								
							}
						}
					}
				}
			} else {
				done = false;
				System.out.println("Sorry, input not recognized. Please try again.");
			}
		} while (!done);
	}
	
	
	public void listSurveys(){
		ArrayList<String> surveys = getFiles(survey_location);
		printList(surveys, "ID","FILENAME");
	}
	
	/**
	 * Neatly prints a formated list with index numbers
	 * TODO clean up if you have time
	 * @param list ArrayList<String> to be printed out
	 */
	public void printList(ArrayList<String> list, String title, String title2){
		
		int count =0;
		// maxSpaces for id shouldn't be less than 2 because "id".length = 2
		int maxSpaces_id =  ((int) Math.log10(list.size()) > 2) ? (int) Math.log10(list.size()) : 2;	// should give the max number of digits for index# of last file
		// set 8 because the title 'filename' has 8 characters 
		int maxSpaces_name = 8;
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
		       if (files.endsWith(".q") || files.endsWith(".a"))
		       {
		          fileList.add(files);
		        }
		     }
		  }
		  return fileList;
	}
}
