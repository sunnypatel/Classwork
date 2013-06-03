/*
 * GeometryFactory.java
 * May 27, 2007 
 * Copyright (c) 2007 Drexel University. All rights reserved.
 *
 */
package edu.drexel.cs350;

/**
 * Utilties for reading and writing of Geometry
 *
 * @author Sunny Huynh
 * @version 1.0
 * @since 1.0
 */
public interface GeometryFactory
{
	final int DEFAULT_WIDTH = 500;
	final int DEFAULT_HEIGHT = 500;
	
	Geometry read() throws VirCadException;
	void write() throws VirCadException;
}
