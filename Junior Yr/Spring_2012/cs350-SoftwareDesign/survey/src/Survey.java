import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;

public class Survey {

	private String name;
	private ArrayList<Question> questions;
	private ArrayList<Response> responses;
	
	public Survey() {

		questions = new ArrayList<Question>();
	}

	public int getNumberOfQuestions() {
		return questions.size();
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
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
		
		for(Question q : this.questions){
			q.displayQuestion();
			
			// ask for answer
			String ans = rd.readLine();
			responses.add(new Response(ans));
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

	/**
	 * Saves the survey questions in a filenamed [survey_name].q
	 * 
	 * @throws IOException
	 */
	public void save() throws FileNotFoundException {

		try {
			FileOutputStream fileOut = new FileOutputStream("saves/survey/"+ this.getName());
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
				this.setName(filename);
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
