
public class TrueFalse extends MultipleChoice{
	
	private String questionType = "True or False";
	
	public TrueFalse(){
		this.addOption("True");
		this.addOption("False");
		
	}

	public String getQuestionType() {
		return questionType;
	}

}
