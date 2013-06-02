package edu.drexel.cs350.xml;

public class Point extends Feature {

	private int x;
	private int y;

	public Point(final Renderer rend, int x, int y) {
	
		this.renderer = rend;
		this.setX(x);
		this.setY(y);
		
	}

	@Override
	public void translate(int dx, int dy) {
		

	}

	@Override
	public void render() {
	
		this.renderer.render();
		
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

}
