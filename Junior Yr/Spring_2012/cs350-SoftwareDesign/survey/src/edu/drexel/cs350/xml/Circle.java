package edu.drexel.cs350.xml;

public class Circle extends Feature {

	private int x;
	private int y;
	private int radius;
	
	public Circle(final Renderer rend, int x, int y, int radius) {
	
		this.renderer = rend;
		this.setRadius(radius);
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

	public int getRadius() {
		return radius;
	}

	public void setRadius(int radius) {
		this.radius = radius;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

}
