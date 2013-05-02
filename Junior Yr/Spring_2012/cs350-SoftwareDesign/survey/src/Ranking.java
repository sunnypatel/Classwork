
public class Ranking extends Matching {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2271897164566862390L;
	private String questionType = "Ranking";

	public Ranking(){
		this.add_leftSide();
		super.calibrate();
		this.setQuestionType(questionType);
	}
	
	public String getQuestionType() {
		return questionType;
	}
}
