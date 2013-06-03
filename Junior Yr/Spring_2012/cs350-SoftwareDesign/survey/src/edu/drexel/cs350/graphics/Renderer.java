/*
 * Renderer.java
 * May 26, 2007 
 * Copyright (c) 2007 Drexel University. All rights reserved.
 *
 */
package edu.drexel.cs350.graphics;

/**
 * Abstract interface to render features
 * 
 * @author Sunny Huynh
 * @version 1.0
 * @since 1.0
 */
public interface Renderer
{
	/**
	 * Initializes the renderer to render to the specified width and height.
	 * This method needs to be called before any drawing or rendering is
	 * performed and should only be called once.
	 * 
	 * @param width of geometry
	 * @param height of geometry
	 */
	void initialize(int width, int height);
	
	/**
	 * Draws a point at the specified location
	 * 
	 * @param x coordinate of point
	 * @param y coordinate of point
	 */
	void drawPoint(int x, int y);
	
	/**
	 * Draws a line segment between the specified points
	 * 
	 * @param x1 first point x-coordinate
	 * @param y1 first point y-coordinate
	 * @param x2 other point x-coordinate
	 * @param y2 other point y-coordinate
	 */
	void drawLine(int x1, int y1, int x2, int y2);
	
	/**
	 * Draws a circle with the specified center and radius
	 * 
	 * @param x coordinate of center
	 * @param y coordinate of center
	 * @param radius of circle
	 */
	void drawCircle(int x, int y, int radius);
	
	/**
	 * Draws a text string with the specified coordinate
	 * for the leftmost character
	 * 
	 * @param x coordinate of starting point
	 * @param y coordinate of starting point
	 * @param text to draw
	 * @param size of font in points
	 */
	void drawText(int x, int y, String text, int size);

	/**
	 * Signifies that drawing is completed and the features should be rendered.
	 * This method is essential for rendering implementations that use double
	 * buffering or file buffering.
	 */
	void render();
}
