import java.io.*;


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
			
			e.printStackTrace();
		}
		return "";
	}
}
