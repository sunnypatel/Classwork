import java.io.*;
import java.util.ArrayList;



public class Main {

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
		boolean addAnother = true;
		int questionCount = 0;

		while (addAnother) {
			boolean errors = false;

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
					break;
				case 8:
					addAnother = false;
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

			if (!errors && (addAnother != false)) {
				questionCount = questionCount + 1;
				System.out.println("Question #" + questionCount
						+ " was created successfully.");

				System.out.println("Question as reader would see it: ");
				System.out.println("");
				System.out.println("-- "
						+ survey.getQuestions().get(survey.getQuestions().size() - 1).getQuestionType()
						+ " --");
				System.out.println("");
				// ****(MULTI-THREADING WARNING) LINE WILL NOT BE CORRECT IN
				// CASE OF A RACE CONDITION****
				survey.getQuestions().get(survey.getQuestions().size() - 1).displayQuestion();

			}

		} // while(addAnother)
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
			System.out.println("Enter survey name to load:");

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
						survey.load(option);
					} catch (FileNotFoundException e) {
						done = false;
						System.out.println("File not found. Please try again.");
						//e.printStackTrace();
					}
				}
			} else {
				done = false;
				System.out.println("Sorry, input not recognized. Please try again.");
			}
		} while (!done);
	}
	
	public void listSurveys(){
		ArrayList<String> surveys = listFiles("saves/survey/");
		int count =0;
		for (String filename : surveys){
			count++;
			System.out.println(" "+count+". "+ filename );
		}
	}
	
	public ArrayList<String> listFiles(String path){
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
