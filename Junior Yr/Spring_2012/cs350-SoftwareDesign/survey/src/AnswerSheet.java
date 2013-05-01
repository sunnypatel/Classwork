import java.util.ArrayList;


public class AnswerSheet {
	
	ArrayList<Response> correctAns;
	
	public AnswerSheet(){
		this.correctAns = new ArrayList<Response>();
	}
	
	public AnswerSheet(ArrayList<Response> answers){
		this.setCorrectAns(answers);
	}
	
	public AnswerSheet(String ans){
		this.correctAns = new ArrayList<Response>();
		this.addCorrectAns(ans);
	}
	
	public AnswerSheet(Response r){
		this.correctAns = new ArrayList<Response>();
		this.addCorrectAns(r);
	}
	
	public ArrayList<Response> getCorrectAns(){
		return this.correctAns;
	}
	
	public void setCorrectAns(ArrayList<Response> ans){
		this.correctAns = ans;
	}
	
	public void addCorrectAns(Response r){
		this.correctAns.add(r);
	}
	
	public void addCorrectAns(String ans){
		Response r = new Response();
		r.setResponse(ans);
		
		this.correctAns.add(r);
	}
}
