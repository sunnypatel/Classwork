/*
 * Export.java
 * May 31, 2007 
 * Copyright (c) 2007 Drexel University. All rights reserved.
 *
 */
package edu.drexel.cs350;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;

import edu.drexel.cs350.graphics.ImageFileRenderer;
import edu.drexel.cs350.graphics.PostScriptRenderer;
import edu.drexel.cs350.graphics.Renderer;
import edu.drexel.cs350.xml.XmlGeometryFactory;

/**
 *
 * @author Sunny Huynh
 * @version 1.0
 * @since 1.0
 */
public class Export
{
	private static final int OUTPUT_UNKNOWN = 0;
	private static final int OUTPUT_PNG = 1;
	private static final String OPT_PNG = "-png";
	private static final String FORMAT_PNG = "png";
	private static final int OUTPUT_JPG = 2;
	private static final String OPT_JPG = "-jpg";
	private static final String FORMAT_JPG = "jpg";
	private static final int OUTPUT_PS = 3;
	private static final String OPT_PS = "-ps";
	private static final String OPT_HELP = "-h";
	
	private final Renderer graphics;
	private final Geometry geometry;

	public Export(final Renderer gfx, final String path) throws VirCadException
	{
		this(gfx, new File(path));
	}
	
	public Export(final Renderer gfx, final File file)
			throws VirCadException
	{
		graphics = gfx;
		final GeometryFactory factory = new XmlGeometryFactory(file, graphics);
		geometry = factory.read();
		graphics.initialize(geometry.getWidth(), geometry.getHeight());
	}
	
	public void run()
	{
		geometry.render();
		graphics.render();
	}
	
	public static void main(final String[] args)
	{
		Export export = null;
		try {
			export = initialize(args);
		}
		catch (Exception ex) {
			System.out.print("Invalid arguments: ");
			System.out.println(ex.getMessage());
		}
		
		if (export == null) {
			printUsage(System.out);
			return;
		}

		export.run();
	}
	
	private static Export initialize(final String[] args)
			throws VirCadException, IOException
	{
		int i = 0;
		int format = OUTPUT_UNKNOWN;
		String input = null;
		String output = null;
		
		while (i < args.length) {
			if (args[i].equals(OPT_HELP))
				return null;
			if (args[i].equals(OPT_PNG)) {
				assertDuplicateFormat(format);
				format = OUTPUT_PNG;
			}
			else if (args[i].equals(OPT_JPG)) {
				assertDuplicateFormat(format);
				format = OUTPUT_JPG;
			}
			else if (args[i].equals(OPT_PS)) {
				assertDuplicateFormat(format);
				format = OUTPUT_PS;
			}
			else if (input == null)
				input = args[i];
			else if (output == null)
				output = args[i];
			else
				throw new IllegalArgumentException(args[i]);
			
			++i;
		}

		if (input == null || output == null)
			throw new IllegalArgumentException(
					"Both input and output files must be specified");
		
		Renderer render = createRenderer(format, output);
		return new Export(render, input);
	}
	
	private static void assertDuplicateFormat(int format)
	{
		if (format != OUTPUT_UNKNOWN)
			throw new IllegalArgumentException("Duplicate format specified");
	}
	
	private static Renderer createRenderer(int format, final String output)
			throws IOException
	{
		Renderer render = null;
		switch (format) {
		case OUTPUT_PNG:
			render = new ImageFileRenderer(FORMAT_PNG, output);
			break;
		case OUTPUT_JPG:
			render = new ImageFileRenderer(FORMAT_JPG, output);
			break;
		case OUTPUT_PS:
			render = new PostScriptRenderer(output);
			break;
		default:
			final String ext = getFileExtension(output);
			if (ext.equals("png"))
				return createRenderer(OUTPUT_PNG, output);
			else if (ext.equals("jpg") || ext.equals("jpeg"))
				return createRenderer(OUTPUT_JPG, output);
			else if (ext.equals("ps") || ext.equals("eps"))
				return createRenderer(OUTPUT_PS, output);
			else
				throw new IllegalArgumentException("Unknown output format");
		}
		return render;
	}
	
	private static String getFileExtension(final String path)
	{
		final int dot = path.lastIndexOf('.');
		if (dot < 0)
			return "";
		else
			return path.substring(dot + 1);
	}

	private static void printUsage(final PrintStream out)
	{
		out.printf("Usage: java %s [-options] input output", Export.class.getName());
		out.println();
		out.println();
		out.println("where options include:");
		out.printf("    %-4s        to output to a PNG file", OPT_PNG);
		out.println();
		out.printf("    %-4s        to output to a JPEG file", OPT_JPG);
		out.println();
		out.printf("    %-4s        to output to a PostScript file", OPT_PS);
		out.println();
		out.printf("    %-4s        print this help message", OPT_HELP);
		out.println();
	}
}
