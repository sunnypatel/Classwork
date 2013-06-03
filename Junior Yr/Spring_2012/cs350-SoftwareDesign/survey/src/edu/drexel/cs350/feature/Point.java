package edu.drexel.cs350.feature;

import edu.drexel.cs350.Feature;
import edu.drexel.cs350.graphics.Renderer;

public class Point extends Feature {

	private int x;
	private int y;

	public Point(final Renderer rend, int x, int y) {
	
		super(rend);
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
	
		drawPoint(x, y);
		
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
