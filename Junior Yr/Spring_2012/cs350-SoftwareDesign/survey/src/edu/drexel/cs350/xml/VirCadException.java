/*
 * VirCadException.java
 * May 27, 2007 
 * Copyright (c) 2007 Drexel University. All rights reserved.
 *
 */
package edu.drexel.cs350.xml;

/**
 * Generic exception for virtual CAD system
 *
 * @author Sunny Huynh
 * @version 1.0
 * @since 1.0
 */
public class VirCadException extends Exception
{
	private static final long serialVersionUID = 10L;
	
	public VirCadException()
	{
	}

	public VirCadException(final String message)
	{
		super(message);
	}

	public VirCadException(final Throwable cause)
	{
		super(cause);
	}

	public VirCadException(final String message, final Throwable cause)
	{
		super(message, cause);
	}
}
