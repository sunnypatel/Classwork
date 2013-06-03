/*
 * ImageFileRenderer.java
 * May 27, 2007 
 * Copyright (c) 2007 Drexel University. All rights reserved.
 *
 */
package edu.drexel.cs350;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.imageio.ImageIO;


/**
 *
 * @author Sunny Huynh
 * @version 1.0
 * @since 1.0
 */
public class ImageFileRenderer implements Renderer
{
	private final File file;
	private final String format;
	private RenderedImage image;
	private Graphics2D gfx;
	
	public ImageFileRenderer(final String frmt, final String path)
			throws IOException
	{
		this(frmt, new File(path));
	}
	
	public ImageFileRenderer(final String frmt, final File path)
			throws IOException
	{
		format = frmt;
		file = path;
		if (file.exists() && !file.canWrite())
			throw new IOException("Cannot output to file specified");
	}
	
	public void initialize(int width, int height)
	{
		final BufferedImage img = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		gfx = img.createGraphics();
		image = img;
		
		gfx.setBackground(Color.WHITE);
		gfx.setColor(Color.BLACK);
		gfx.clearRect(0, 0, image.getWidth(), image.getHeight());
	}
	
	public void drawCircle(int x, int y, int radius)
	{
		final int xp = x - radius;
		final int yp = y - radius;
		final int diameter = radius + radius;
		gfx.drawArc(xp, yp, diameter, diameter, 0, 360);
	}

	public void drawLine(int x1, int y1, int x2, int y2)
	{
		gfx.drawLine(x1, y1, x2, y2);
	}

	public void drawPoint(int x, int y)
	{
		drawLine(x, y, x, y);
	}
	
	public void drawText(int x, int y, final String text, int size)
	{
		final Font curr = gfx.getFont();
		gfx.setFont(curr.deriveFont((float)size));
		gfx.drawString(text, x, y);
		gfx.setFont(curr);
	}

	public void render()
	{
		try {
			gfx.dispose();
			ImageIO.write(image, format, file);
		}
		catch (IOException ex) {
			Logger.getLogger(getClass().getName()).log(Level.SEVERE,
					"Unable to output to image file: " + file.getAbsolutePath(),
					ex); 
		}
	}
}
