/*
 * LogManagerTest.java
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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.Test;

import edu.drexel.cs.stalk.StarException;

public class LogManagerTest
{
	private LogManager manager;

	@Test
	public void load() throws URISyntaxException, IOException, StarException
	{
		final Path path = Paths.get(LogManagerTest.class.getResource("loadLogTest.xml").toURI());
		manager = new LogManager(path);

		assertNotNull(manager.getConversation());
		final Conversation actual = manager.getConversation();
		assertEquals("CS 451 - Unit Testing", actual.getName());
		assertUsers(actual.getParticipants(), "swong", "jsalvage");

		final List<LogEvent> events = actual.getEvents();
		assertNotNull(events);
		assertEquals(6, events.size());

		// TODO verify that events are loaded correctly
	}

	private void assertUsers(List<User> actual, String... expected)
	{
		assertEquals(expected.length, actual.size());
		final Set<String> expectedSet = new HashSet<>();
		for (String userId : expected) {
			expectedSet.add(userId);
		}

		final Set<String> actualSet = new HashSet<>();
		for (User user : actual) {
			assertNotNull(user);
			actualSet.add(user.getId());
		}

		assertEquals(expectedSet, actualSet);
	}

	@Test(expected = FileNotFoundException.class)
	public void loadMissingFile()
	{
		// TODO
	}

	@Test(expected = StarException.class)
	public void loadInvalidFile()
	{
		// TODO
	}

	@Test
	public void save()
	{
		// TODO
	}

	@Test(expected = IOException.class)
	public void saveInvalidFile()
	{
		// TODO
	}

	// TODO any additional test(s)
}
