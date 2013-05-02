import java.io.Serializable;
import java.util.ArrayList;


public class AnswerSheet implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -925743944459339742L;
	ArrayList<Response> correctAns;
	
	public AnswerSheet(){
		this.correctAns = new ArrayList<Response>();
	}
	
	public AnswerSheet(ArrayList<Response> answers){
		this.setAns(answers);
	}
	
	public AnswerSheet(String ans){
		this.correctAns = new ArrayList<Response>();
		Response r = new Response(ans);
		this.addAns(r);
	}
	
	public AnswerSheet(Response r){
		this.correctAns = new ArrayList<Response>();
		this.addAns(r);
	}
	
	public ArrayList<Response> getCorrectAns(){
		return this.correctAns;
	}
	
	public void setAns(ArrayList<Response> ans){
		this.correctAns = ans;
	}
	
	public void addAns(Response r){
		this.correctAns.add(r);
	}
	
	public void addAns(String ans){
		Response r = new Response();
		r.setResponse(ans);
		
		this.correctAns.add(r);
	}
}
