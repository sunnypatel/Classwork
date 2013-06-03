package edu.drexel.cs350.feature;


import java.util.List;

import edu.drexel.cs350.Feature;
import edu.drexel.cs350.graphics.Renderer;

public class Polygon extends Feature {

	List<Point> points;
	
	public Polygon(Renderer rend, final Point... pts){
		super(rend);
		
		for(Point p : pts){
			this.points.add(p);
		}
	}
	public int size(){
		return this.points.size();
	}
	
	public Point get(int i){
		return this.points.get(i);
	}
	
	public void set(int i, Point p){
		this.points.set(i, p);
	}
	
	public void add(int x, int y){
		Point p = new Point(renderer, x,y);
		this.points.add(p);
	}
	
	public void add(Point p){
		this.points.add(p);
	}
	
	public void add(int i, int x, int y){
		Point p = new Point(renderer, x ,y );
		this.points.add(i, p);
	}
	
	public void add(int i, Point p){
		this.points.add(i, p);
	}
	
	public void remove(int i){
		this.points.remove(i);
	}
	
	public void remove(Point p){
		this.points.remove(p);
	}

	@Override
	public void translate(int dx, int dy) {
		for (int i = 0; i < points.size(); i++) {
			points.get(i).setX(points.get(i).getX() + dx);
			points.get(i).setY(points.get(i).getY() + dy);
		}
	}
	
	// Iterate through points list, draw a line from each point to the next
	public void render() {
		for (int i = 0; i < points.size(); i++) {
			points.get(i).render();
			// Go to the next point
			if (i != (points.size() - 1))
				drawLine(points.get(i).getX(), points.get(i).getY(), points.get(i+1).getX(), points.get(i+1).getY());
			// Last point -> first point
			else
				drawLine(points.get(i).getX(), points.get(i).getY(), points.get(0).getX(), points.get(0).getY());
		}
	}
}
