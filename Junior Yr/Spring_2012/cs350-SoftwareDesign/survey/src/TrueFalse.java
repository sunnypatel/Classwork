
public class TrueFalse extends MultipleChoice{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8838979852471735389L;
	private String questionType = "True or False";
	
	public TrueFalse(){
		this.addOption("True");
		this.addOption("False");
		this.setQuestionType(questionType);
	}

	public String getQuestionType() {
		return questionType;
	}

}
