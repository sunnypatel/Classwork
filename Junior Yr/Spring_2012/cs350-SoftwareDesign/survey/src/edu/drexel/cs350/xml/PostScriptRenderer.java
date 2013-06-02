/*
 * PostScriptRenderer.java
 * May 26, 2007 
 * Copyright (c) 2007 Drexel University. All rights reserved.
 *
 */
package edu.drexel.cs350.xml;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;


/**
 * Render to a PostScript file
 * 
 * @author Sunny Huynh
 * @version 1.0
 * @since 1.0
 */
public class PostScriptRenderer implements Renderer
{
	private final PrintStream output;
	protected int width;
	protected int height;
	
	public PostScriptRenderer(final String path) throws IOException
	{
		this(new File(path));
	}
	
	public PostScriptRenderer(final File file) throws IOException
	{
		output = new PrintStream(file);
		printHeader();
	}
	
	public void initialize(int w, int h)
	{
		width = w;
		height = h;
	}
	
	protected void printHeader()
	{
		output.println("%%%BEGIN");
		output.println("/mainfont");
		output.println("/Times-Roman findfont");
		output.println("1 setlinewidth");
		output.println("setfont");
	}
	
	protected void printFooter()
	{
		output.println("%%%END");
	}
	
	public void drawCircle(int x, int y, int radius)
	{
		output.printf("%d %d %d 0 360 arc", transformX(x), transformY(y),
				radius);
		output.println();
		output.println("closepath");
		output.println("stroke");
	}
	
	public void drawLine(int x1, int y1, int x2, int y2)
	{
		output.printf("%d %d moveto", transformX(x1), transformY(y1));
		output.println();
		output.printf("%d %d lineto", transformX(x2), transformY(y2));
		output.println();
		output.println("stroke");
	}

	public void drawPoint(int x, int y)
	{
		output.printf("%d %d %f 0 360 arc", transformX(x), transformY(y), .75f);
		output.println();
		output.println("0 setgray fill");
	}

	public void drawText(int x, int y, final String text, int size)
	{
		output.println("/Times-Roman findfont");
		output.printf("%d scalefont", size);
		output.println();
		output.println("setfont");
		output.printf("%d %d moveto", transformX(x), transformY(y));
		output.println();
		
		output.printf("(%s) show",
				text.replaceAll("\\(", "\\(").replaceAll("\\)", "\\)"));
		output.println();
	}
	
	protected int transformX(int x)
	{
		// compensate for difference in coordinate system of PS from screen
		return x;
	}
	
	protected int transformY(int y)
	{
		// compensate for difference in coordinate system of PS from screen
		return height - y;
	}
	
	public void render()
	{
		printFooter();
		output.close();
	}
}
