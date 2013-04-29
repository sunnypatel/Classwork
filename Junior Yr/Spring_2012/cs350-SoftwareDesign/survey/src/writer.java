import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.ArrayList;


/**
 * 
 * @author Bill
 */
public class writer {
	public void printvariableToFile(String fileName, ArrayList<Question> questions) {
		File myFile;
		myFile = new File(fileName);
		if (!myFile.exists()) {
			try {
				myFile.createNewFile();
				FileWriter fw = new FileWriter(fileName);
				PrintWriter pw = new PrintWriter(fw);
				// Write variable to file
				pw.print("Writing variable to file");
				pw.println("The varible is below: ");
				pw.println(questions);
				// Close
				pw.close();
			} catch (Exception ex) {
				
			}
		}
	}
}