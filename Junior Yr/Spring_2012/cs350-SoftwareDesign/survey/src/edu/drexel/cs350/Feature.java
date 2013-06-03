package edu.drexel.cs350;

public abstract class Feature {
	
	public Renderer renderer;
	
	public Feature(){
		
	}
	
	public Feature(Renderer renderer){
		this.renderer = renderer;
	}
	
	public void drawLine(int x1, int y1, int x2, int y2){
		this.renderer.drawLine(x1, y1, x2, y2);
	}
	
	public void drawPoint(int x, int y){
		this.renderer.drawPoint(x, y);
	}
	
	public void drawCircle(int x, int y, int radius){
		this.renderer.drawCircle(x, y, radius);
	}
	
	public void drawText(int x, int y, String text, int size){
		this.renderer.drawText(x, y, text, size);
	}
	public void setRender(Renderer renderer){
		this.renderer = renderer;
	}
	public Renderer getRender(){
		return this.renderer;
	}
	public abstract void translate(int dx, int dy);
	
	public abstract void render();
}
