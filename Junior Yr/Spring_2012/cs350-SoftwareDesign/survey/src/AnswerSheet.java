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
	public void displayAnswerSheet(){
		for(Response r : correctAns){
			System.out.println(r.toString());
		}
	}
	public void setAns(ArrayList<Response> ans){
		this.correctAns = ans;
	}
	public Response getAns(int i){
		return this.correctAns.get(i);
	}
	
	public void setAns(Response res){
		this.correctAns.add(res);
	}

	public void setAns(int i, Response res){
		this.correctAns.add(i, res);
	}
	
	public void setAns(int i, String input){
		Response res = new Response();
		res.setResponse(input);
		this.setAns(i, res);
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
