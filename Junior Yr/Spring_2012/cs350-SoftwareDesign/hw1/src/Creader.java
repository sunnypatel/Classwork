import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;


public class Creader {
	
	private BufferedReader br;
	/**
	 * @param args
	 */
	public Creader(){
		br = new BufferedReader(new InputStreamReader(System.in));
	}

	public String readLine(){
		try {
			return br.readLine();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
}
