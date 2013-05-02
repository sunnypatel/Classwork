import java.io.Serializable;


public class Response implements Serializable {
	String response;
	
	public Response(){
		this.response = "";
	}
	public Response(String r){
		this.response = r;
	}
	public String getResponse(){
		return this.response;
	}
	
	public void setResponse(String r){
		this.response = r;
	}
	
	public boolean equals(Response r){
		return (this.getResponse().equals(r.getResponse())) ? true : false;
	}
}
