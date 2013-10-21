/*
 * RoomTest.java
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
package edu.drexel.cs.stalk;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import edu.drexel.cs.stalk.log.LogManager;

public class RoomTest
{
	@Mock
	private LogManager logger;

	private Room room;

	@Before
	public void initialize()
	{
		MockitoAnnotations.initMocks(this);
		room = new Room(logger);
		assertSame(logger, room.logger);
	}

	@Test
	public void namedLogger()
	{
		room = new Room("room name");
		assertNotNull(room.logger);
		assertNotNull(room.logger.getConversation());
		assertEquals("room name", room.logger.getConversation().getName());
	}

	@Test(expected = NullPointerException.class)
	public void addUserNullUser()
	{
		room.addUser(null);
	}

	@Test
	public void addUser()
	{
		// Arrange
		Client client = mock(Client.class);
		when(client.getId()).thenReturn("jsalvage");

		// Act
		room.addUser(client);

		// Assert
		assertEquals(1, room.getUsers().size());
		assertSame(client, room.getUsers().get(0));

		verify(client).addListener(room);
		verify(logger).logUserEntry("jsalvage");
	}

	// TODO any additional test(s)
}