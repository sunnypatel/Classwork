package edu.drexel.cs350;

import java.util.List;

public class Polygon extends Feature {

	List<Point> points;
	
	public Polygon(Renderer renderer, final Point... pts){
		this.renderer = renderer;
		
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
		
	}

	@Override
	public void render() {
		this.renderer.render();
	}
	
}
