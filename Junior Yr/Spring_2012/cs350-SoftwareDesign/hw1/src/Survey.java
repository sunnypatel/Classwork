import java.util.ArrayList;
import java.util.Scanner;


public class Survey {
	private ArrayList<Question> questions;
	public Survey(){
		questions = new ArrayList<Question>();
	}
	
	public void createSurvey(){
		boolean addAnother = true;
		int questionCount = 0;
		
		while(addAnother){
			
			// used to get user input
			Scanner scanner = new Scanner (System.in).useDelimiter("\n");
			
			// What type of question are we creating? 
			System.out.println("To add a question, select a type of question ");
			System.out.println("from the following options or select Done when finished.");

			System.out.println(" (1) Multiple Choice");
			System.out.println(" (2) True or False");
			System.out.println(" (3) Matching");
			System.out.println(" (4) Ranking");
			System.out.println(" (5) Essay");
			System.out.println(" (6) Short Answer");
			System.out.println(" --------------------");
			System.out.println(" (7) Done");
			// get user input
			String option = scanner.next();
			System.out.println("You selected option " + option);
			
			switch(Integer.parseInt(option)){
			case 1:
				questions.add(new MultipleChoice(1));
				break;
			case 2:
				questions.add(new TrueFalse());
				break;
			case 3:
				questions.add(new Matching());
				break;
			case 4:
				questions.add(new Ranking());
				break;
			case 5:
				questions.add(new Essay());
				break;
			case 6:
				questions.add(new ShortAns());
				break;
			case 7:
				addAnother = false;
			default:
				System.out.println("Sorry, input not recognized. Please try again.");
				System.out.println("No question added");
			}
			
			questionCount = questionCount + 1;
			System.out.println("Question #" + questionCount + " was created successfully.");	
			
		} // while(addAnother)
	} // createSurvey()
	
	public int getNumberOfQuestions(){
		return questions.size();
	}
}
