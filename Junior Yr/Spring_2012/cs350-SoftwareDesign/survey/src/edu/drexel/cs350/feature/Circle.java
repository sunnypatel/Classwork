package edu.drexel.cs350.feature;

import edu.drexel.cs350.Feature;
import edu.drexel.cs350.graphics.Renderer;

public class Circle extends Feature {

	private int x;
	private int y;
	private int radius;
	
	public Circle(final Renderer rend, int x, int y, int radius) {
	
		super(rend);
		this.setRadius(radius);
		this.setX(x);
		this.setY(y);
		
	}

	@Override
	public void translate(int dx, int dy) {
		this.x += dx;
		this.y += dy;

	}

	@Override
	public void render() {
	
		drawCircle(x,y, radius);

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
