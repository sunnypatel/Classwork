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
	
	public void displayQuestions() {
		for (Question q : this.questions) {
			q.displayQuestion();
		}
	}

	/**
	 * Saves the survey questions in a filenamed [survey_name].q
	 * 
	 * @throws IOException
	 */
	public void save() throws FileNotFoundException {

		try {
			FileOutputStream fileOut = new FileOutputStream("saves/survey/"
					+ this.getName() + ".q");
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
	public void load(String filename) throws FileNotFoundException {
		try {
			FileInputStream fileIn = new FileInputStream("saves/survey/"+ filename);
			ObjectInputStream in = new ObjectInputStream(fileIn);
			// try reading object from file
			try {
				this.setQuestions((ArrayList<Question>) in.readObject());
				this.setName(filename);
			} catch (ClassNotFoundException e) {
				// bad input
				//e.printStackTrace();
				System.out.println("Bad input");
			}
			in.close();
		} catch (IOException e) {
			// I/O error
			// e.printStackTrace();
			System.out.println("Couldn't find the survey your looking for. Try \\list");
		}
	}

}
