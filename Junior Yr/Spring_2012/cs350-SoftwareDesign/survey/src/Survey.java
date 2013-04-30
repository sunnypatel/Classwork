import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;


public class Survey implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1516345659842813782L;
	private String name;
	private ArrayList<Question> questions;
	
	
	public Survey(){
		
		questions = new ArrayList<Question>();
	}
	
	
	public void createSurvey(){
		Creader rd = new Creader();
		
		System.out.println("-- Create new survey --");
		System.out.print("Survey name:");
		this.setName(rd.readLine());
	}
	
	
	public void addQuestion(){
		Creader rd = new Creader();
		boolean addAnother = true;
		int questionCount = 0;
		
		while(addAnother){
			boolean errors = false;
			
			// What type of question are we creating? 
			System.out.println("");
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
			String option = rd.readLine();	
			
			// make sure user has inputed something
			if(option.length() > 0){
			
			
			System.out.println("You selected option " + option);
			

				switch(Integer.parseInt(option)){
				case 1:									// Multiple Choice
					questions.add(new MultipleChoice(1));
					break;
				case 2:									// True / False
					questions.add(new TrueFalse());
					break;
				case 3:									// Matching
					Matching matching = new Matching();
					matching.create();				//    <----- DONT LIKE THIS CHANGE IF TIME
					questions.add(matching);
					break;
				case 4:									// Ranking
					Ranking ranking = new Ranking();
					questions.add(ranking);
					break;
				case 5:									// Essay
					questions.add(new Essay());
					break;
				case 6:									// Short Answer
					questions.add(new ShortAns());
					break;
				case 7:
					addAnother = false;
					System.out.print("Saving...");
					
					try {
						this.save();
						System.out.println("Done.");
					} catch (IOException e) {
						System.out.println("Error.");
						e.printStackTrace();
					}
					
					break;
				default:
					System.out.println("Sorry, input not recognized. Please try again.");
					System.out.println("No question added");
					System.out.println("");
					errors = true;
				}
			}
			else {
				errors = true;
				System.out.println("Sorry, input not recognized. Please try again.");
				System.out.println("No question added");
				System.out.println("");
			}
			
			if (!errors && (addAnother != false)){
				questionCount = questionCount + 1;
				System.out.println("Question #" + questionCount + " was created successfully.");
				
				System.out.println("Question as reader would see it: ");
				System.out.println("");
				System.out.println("-- " + questions.get(questions.size()-1).getQuestionType() + " --");
				System.out.println("");
				// ****(MULTI-THREADING WARNING) LINE WILL NOT BE CORRECT IN CASE OF A RACE CONDITION****
				questions.get(questions.size()-1).displayQuestion();
				
			}
			
		} // while(addAnother)
	} // createSurvey()
	
	public int getNumberOfQuestions(){
		return questions.size();
	}
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * Saves the survey questions in a filenamed [survey_name].q
	 * @throws IOException
	 */
	public void save() throws IOException{
	
		try {
			FileOutputStream fileOut = new FileOutputStream("saves/survey/" + this.getName() + ".q");
			ObjectOutputStream out = new ObjectOutputStream(fileOut);
			out.writeObject(this.questions);
			out.close();
			fileOut.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

	}

}
