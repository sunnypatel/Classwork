package edu.drexel.cs350;

import java.util.Iterator;
import java.util.List;

public class Geometry {

	private List<Feature> features;
	private int width;
	private int height;
	
	public Geometry(int w, int h){
		
	}

	public List<Feature> getFeatures() {
		return features;
	}

	public void setFeatures(List<Feature> features) {
		this.features = features;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}
	
	public Iterator<Feature> iterator(){
		return this.features.iterator();
	}
	
	public int count(){
		return this.features.size();
	}
	
	public void add(Feature f){
		this.features.add(f);
	}
	
	public void remove(Feature f){
		this.features.remove(f);
	}
	
	public void render(){
		for(Feature f: features){
			f.render();
		}
	}
}
