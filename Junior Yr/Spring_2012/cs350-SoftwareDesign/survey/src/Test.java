import java.util.ArrayList;

public class Test extends Survey{

	private ArrayList<Question> questions;
	private AnswerSheet answerSheet_correct;
	
	public Test(){
		questions = new ArrayList<Question>();
		setAnswerSheet_correct(new AnswerSheet());
	}

	public ArrayList<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(ArrayList<Question> questions) {
		this.questions = questions;
	}
	
	public void recordCorrectSheet(){
		
	}

	public AnswerSheet getAnswerSheet_correct() {
		return answerSheet_correct;
	}

	public void setAnswerSheet_correct(AnswerSheet answerSheet_correct) {
		this.answerSheet_correct = answerSheet_correct;
	}
}
