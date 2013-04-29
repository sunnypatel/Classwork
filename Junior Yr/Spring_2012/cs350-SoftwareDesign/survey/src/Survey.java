import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Scanner;

import thirdparty.Serializer;


public class Survey {
	private ArrayList<Question> questions;
	public Survey(){
		questions = new ArrayList<Question>();
	}
	
	public void createSurvey(){
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
					this.save();
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
			
			if (!errors){
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
	
	public void save(){
		Serializer serializer = new Serializer();
		byte[] data = Serializer.serialize(this.questions);
	

		File inputFile = new File("test");
		byte[] data = new byte[(int) inputFile.length()];
		FileInputStream fis = new FileInputStream(inputFile);
		fis.read(data, 0, data.length);
		fis.close();
		
		
		
	/*	writer a = new writer();
		a.printvariableToFile("test", this.questions);
		  OutputStream bufferedOutputStream;
		try {
			bufferedOutputStream = new BufferedOutputStream(new FileOutputStream("test"));
			  InputStream inputStream = new ByteArrayInputStream(questions);
			  int token = -1;

			  while((token = inputStream.read()) != -1)
			  {
			    bufferedOutputStream.write(token);
			  }
			  bufferedOutputStream.flush();
			  bufferedOutputStream.close();
			  inputStream.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
*/
	}
}
