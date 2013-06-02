package edu.drexel.cs350.xml;

public class Text extends Feature {

	private int x;
	private int y;
	private int size;
	private String text;
	private static final int DEFAULT_SIZE = 12;
	
	
	public Text(final Renderer rend, int x, int y, String text){
		this.setRender(rend);
		this.setX(x);
		this.setY(y);
		this.setText(text);
		this.setSize(Text.getDefaultSize());
	}
	
	public Text(final Renderer rend, int x, int y, String text, int size){
		this.setRender(rend);
		this.setX(x);
		this.setY(y);
		this.setText(text);
		this.setSize(size);		
	}
	
	@Override
	public void translate(int dx, int dy) {
		// TODO Auto-generated method stub

	}

	@Override
	public void render() {
		// TODO Auto-generated method stub

	}

	/**
	 * @return the defaultSize
	 */
	public static int getDefaultSize() {
		return DEFAULT_SIZE;
	}

	/**
	 * @return the text
	 */
	public String getText() {
		return text;
	}

	/**
	 * @param text the text to set
	 */
	public void setText(String text) {
		this.text = text;
	}

	/**
	 * @return the size
	 */
	public int getSize() {
		return size;
	}

	/**
	 * @param size the size to set
	 */
	public void setSize(int size) {
		this.size = size;
	}

	/**
	 * @return the y
	 */
	public int getY() {
		return y;
	}

	/**
	 * @param y the y to set
	 */
	public void setY(int y) {
		this.y = y;
	}

	/**
	 * @return the x
	 */
	public int getX() {
		return x;
	}

	/**
	 * @param x the x to set
	 */
	public void setX(int x) {
		this.x = x;
	}

}
