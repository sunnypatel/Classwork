import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.lang.Math;


public class Main {

	private String survey_location = "saves/survey";
	private String test_location = "saves/test";
	
	private Menu mainMenu;
	private Menu newSurveyMenu;
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
			mainMenu.addOption("Display a Test");
			mainMenu.addOption("Load a Survey");
			mainMenu.addOption("Load a Test");
			mainMenu.addOption("Save a Survey");
			mainMenu.addOption("Save a Test");
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
			//testMainMenu();
			break;
		case 3: // Exit
			break;
		default:
			System.out.println("Something terrble happened.");
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
		// go back to main menu when done here
		mainMenu();
	}	
}