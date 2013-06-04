import java.io.IOException;
import java.util.ArrayList;

import edu.drexel.cs350.graphics.ImageFileRenderer;


public class ImageRendDriver_adapter extends DisplayDriver {

	private ArrayList<String> printList;
	private ImageFileRenderer rend;
	private int fontSize;
	private int x_margin;
	private int y_margin;
	private int x_pos;
	private int y_pos;
	
	
	public ImageRendDriver_adapter(){
		// Use default font size = 14
		this(14);
	}
	
	public ImageRendDriver_adapter(int fontSize){
		this.printList = new ArrayList<String>();
		
		this.setFontSize(fontSize);
		this.setX_margin(50);
		this.setY_margin(50);
		
		try {
			this.setRend(new ImageFileRenderer("png", "C:/Users/u0170616/Documents/GitHub/Classwork/Junior Yr/Spring_2012/cs350-SoftwareDesign/survey/Prints/Survey_output.png"));
			//this.getRend().initialize(this.getWidth(), this.getHeight());
			
		} catch (Exception e) {
			//System.out.println("Bad input. Try again. I'm not gonna crash!");
			e.printStackTrace();
		}
	}
	
	@Override
	public void draw() {
		this.printList.add(" ");
		
	}

	@Override
	public void draw(Object x) {
		/*
		String last = null;
		if(this.printList.size() > 0 && this.printList.get(this.printList.size()-1) != " "){
			last = this.printList.get(this.printList.size()-1);
			this.printList.set(this.printList.size()-1, last + x.toString());
		} else {
			this.printList.add(x.toString());
		}
		*/
		this.printList.add(x.toString());
	}
	@Override
	public void render(){
		int width = calcWidth();
		int height = calcHeight();
		// make image size;
		//this.getRend().initialize(width, height);
		this.getRend().initialize(1000, 1000);
		for(String line : printList){
			this.rend.drawText(this.getX_margin(), this.nextLine(), line, getFontSize());
		}
		
		this.rend.render();
	}
	
	public int calcHeight(){
		int h = (this.getY_margin() * 2) + (this.printList.size() * this.fontSize);
		
		return (h > 0) ? h : 50;
	}
	
	public int calcWidth(){
		int maxWidth_ofText = 0;
		for(String line : printList){
			if(line.length() > maxWidth_ofText)
				maxWidth_ofText = line.length();
		}
		// formula for estimating width
		return (int)(maxWidth_ofText + (.6 * this.getFontSize())) + (this.getX_margin() * 2) + 200;
	}
	
	public ImageFileRenderer getRend() {
		return rend;
	}

	public void setRend(ImageFileRenderer rend) {
		this.rend = rend;
	}

	public int nextLine(){
		this.setY_pos(this.getY_pos() + this.getFontSize());
		return this.getY_pos();
	}
	
	/**
	 * @return the x_pos
	 */
	public int getX_pos() {
		return x_pos;
	}

	/**
	 * @param x_pos the x_pos to set
	 */
	public void setX_pos(int x_pos) {
		this.x_pos = x_pos;
	}

	/**
	 * @return the y_pos
	 */
	public int getY_pos() {
		return y_pos;
	}

	/**
	 * @param y_pos the y_pos to set
	 */
	public void setY_pos(int y_pos) {
		this.y_pos = y_pos;
	}

	/**
	 * @return the fontSize
	 */
	public int getFontSize() {
		return fontSize;
	}

	/**
	 * @param fontSize the fontSize to set
	 */
	public void setFontSize(int fontSize) {
		this.fontSize = fontSize;
	}

	/**
	 * @return the width
	 */
	public int getWidth() {
		return this.calcWidth();
	}

	/**
	 * @return the height
	 */
	public int getHeight() {
		return this.calcHeight();
	}


	/**
	 * @return the y_margin
	 */
	public int getY_margin() {
		return y_margin;
	}

	/**
	 * @param y_margin the y_margin to set
	 */
	public void setY_margin(int y_margin) {
		this.y_margin = y_margin;
	}
	/**
	 * @return the x_margin
	 */
	public int getX_margin() {
		return x_margin;
	}

	/**
	 * @param x_margin the x_margin to set
	 */
	public void setX_margin(int x_margin) {
		this.x_margin = x_margin;
	}
}
