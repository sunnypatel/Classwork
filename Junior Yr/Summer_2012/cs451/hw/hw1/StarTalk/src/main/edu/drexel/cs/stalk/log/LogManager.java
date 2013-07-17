/*
 * LogManager.java
 * Copyright (c) 2013, Drexel University.
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the Drexel University nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY DREXEL UNIVERSITY ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL DREXEL UNIVERSITY BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
package edu.drexel.cs.stalk.log;

import static java.nio.file.Files.newBufferedReader;
import static java.nio.file.Files.newBufferedWriter;
import static java.nio.file.StandardOpenOption.CREATE;
import static java.nio.file.StandardOpenOption.WRITE;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;
import java.nio.file.Path;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

import org.joda.time.DateTime;

import edu.drexel.cs.stalk.StarException;

public class LogManager
{
	public static final Charset DefaultCharset = Charset.forName("utf-8");

	public static enum SortOrder
	{
		ASCENDING, DESCENDING
	}

	private Conversation conversation;

	public LogManager(final String name)
	{
		conversation = new Conversation(name);
	}

	public LogManager(final Path path) throws IOException, StarException
	{
		this.conversation = load(path);
	}

	private Conversation load(final Path path) throws IOException, StarException
	{
		try (final BufferedReader reader = newBufferedReader(path, DefaultCharset)) {
			return unmarshal(reader);
		}
		catch (final JAXBException ex) {
			throw new StarException("Unable to load conversation from file.", ex);
		}
	}

	public Conversation getConversation()
	{
		return conversation;
	}

	/**
	 * Creates a new log manager that merges the participants and events of the input conversations.
	 * Participants that occur in both input conversations only appear once in the output. Events
	 * from both input conversations are includes and are sorted in ascending order.
	 */
	public static LogManager combine(final LogManager a, final LogManager b)
	{
		// TODO
		throw new UnsupportedOperationException();
	}

	public void save(final Path path) throws IOException, StarException
	{
		try (final BufferedWriter writer = newBufferedWriter(path, DefaultCharset, CREATE, WRITE)) {
			final Marshaller converter = createJAXBContext().createMarshaller();
			converter.marshal(conversation, writer);
		}
		catch (final JAXBException ex) {
			throw new StarException("Unable to save conversation to file.", ex);
		}
	}

	public void logUserEntry(final String userId)
	{
		// TODO
		throw new UnsupportedOperationException();
	}

	public void logUserExit(final String userId)
	{
		// TODO
		throw new UnsupportedOperationException();
	}

	public void logUserMessage(final String userId, final String message)
	{
		// TODO
		throw new UnsupportedOperationException();
	}

	public void sortEvents(final SortOrder order)
	{
		// TODO
		throw new UnsupportedOperationException();
	}

	/**
	 * Removes all events before the specified time
	 */
	public void removeEventsBefore(final DateTime timeStamp)
	{
		// TODO
		throw new UnsupportedOperationException();
	}

	/**
	 * Gets an unmodifiable list of events with the specified user ID
	 */
	public List<LogEvent> getEventsFor(final String userId)
	{
		// TODO
		throw new UnsupportedOperationException();
	}

	/**
	 * Gets an unmodifiable list of the events that occur at or after the start time, and before the
	 * stop time (i.e., including the start time but not including the stop time)
	 */
	public List<LogEvent> getEventsDuring(final DateTime start, final DateTime stop)
	{
		// TODO
		throw new UnsupportedOperationException();
	}

	private static Conversation unmarshal(final Reader input) throws IOException, JAXBException
	{
		final Unmarshaller extractor = createJAXBContext().createUnmarshaller();
		return (Conversation) extractor.unmarshal(input);
	}

	private static JAXBContext createJAXBContext() throws JAXBException
	{
		return JAXBContext.newInstance(Conversation.class);
	}
}
