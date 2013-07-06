/*
 * Room.java
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

import java.io.IOException;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import edu.drexel.cs.stalk.log.LogManager;

public class Room implements ClientListener
{
	protected LogManager logger;

	private List<Client> users = new ArrayList<>();

	public Room(final String name)
	{
		logger = new LogManager(name);
	}

	public Room(final LogManager logger)
	{
		this.logger = logger;
	}

	public List<Client> getUsers()
	{
		return Collections.unmodifiableList(users);
	}

	public void addUser(final Client client)
	{
		if (client == null)
			throw new NullPointerException();

		users.add(client);
		client.addListener(this);
		logger.logUserEntry(client.getId());
	}

	public void removeUser(final Client client)
	{
		// TODO
		throw new UnsupportedOperationException();
	}

	@Override
	public void messageSent(final ClientEvent event)
	{
		// TODO
		throw new UnsupportedOperationException();
	}

	@Override
	public void statusChanged(final StatusChangeEvent event)
	{
		// TODO
		throw new UnsupportedOperationException();
	}

	public void saveLog(final Path path) throws IOException
	{
		// TODO
		throw new UnsupportedOperationException();
	}
}
