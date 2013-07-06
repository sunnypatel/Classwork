/*
 * Conversation.java
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

import static javax.xml.bind.annotation.XmlAccessType.FIELD;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "conversation")
@XmlAccessorType(FIELD)
public class Conversation implements Serializable, Iterable<LogEvent>
{
	private static final long serialVersionUID = 10L;

	@XmlAttribute
	private String name;

	@XmlElementWrapper(name = "participants")
	@XmlElement(name = "user")
	protected List<User> participants = new ArrayList<>();

	@XmlElementWrapper(name = "events")
	@XmlElements({ @XmlElement(name = "message", type = MessageLogEvent.class),
			@XmlElement(name = "status", type = StatusChangeLogEvent.class),
			@XmlElement(name = "enter", type = UserEnterLogEvent.class),
			@XmlElement(name = "exit", type = UserExitLogEvent.class) })
	protected List<LogEvent> events = new ArrayList<>();

	public Conversation()
	{
		this("");
	}

	public Conversation(final String name)
	{
		this.name = name;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public List<User> getParticipants()
	{
		return Collections.unmodifiableList(participants);
	}

	public void addParticipant(final String userId)
	{
		// TODO
		throw new UnsupportedOperationException();
	}

	public void removeParticipant(final String userId)
	{
		// TODO
		throw new UnsupportedOperationException();
	}

	public boolean hasParticipant(final String userId)
	{
		// TODO
		throw new UnsupportedOperationException();
	}

	public List<LogEvent> getEvents()
	{
		return Collections.unmodifiableList(events);
	}

	public void addEvent(final LogEvent event)
	{
		// TODO
		throw new UnsupportedOperationException();
	}

	public void removeEvent(int index)
	{
		// TODO
		throw new UnsupportedOperationException();
	}

	@Override
	public Iterator<LogEvent> iterator()
	{
		return getEvents().iterator();
	}
}
