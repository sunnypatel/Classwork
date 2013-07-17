/*
 * DateTimeXmlAdapterTest.java
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

import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.junit.Before;
import org.junit.Test;

public class DateTimeXmlAdapterTest
{
	private DateTimeXmlAdapter adapter;

	@Before
	public void initialize()
	{
		adapter = new DateTimeXmlAdapter();
	}

	@Test(expected = NullPointerException.class)
	public void unmarshalNullString() throws Exception
	{
		adapter.unmarshal(null);
	}

	@Test(expected = IllegalArgumentException.class)
	public void unmarshalEmptyString() throws Exception
	{
		adapter.unmarshal("");
	}

	@Test(expected = IllegalArgumentException.class)
	public void unmarshallInvalidFormat() throws Exception
	{
		adapter.unmarshal("20130704 X 3D");
	}

	@Test(expected = IllegalArgumentException.class)
	public void unmarshallInvalidDate() throws Exception
	{
		adapter.unmarshal("20130231T120003-4");
	}

	@Test
	public void unmarshalValidFormat() throws Exception
	{
		final DateTime actual = adapter.unmarshal("20130702T183010.000-0400");
		assertEquals(2013, actual.getYear());
		assertEquals(7, actual.getMonthOfYear());
	}

	@Test
	public void marshal() throws Exception
	{
		final DateTime time = new DateTime(2013, 7, 2, 18, 30, 10, 0,
				DateTimeZone.forOffsetHours(-4));
		assertEquals("20130702T183010.000-0400", adapter.marshal(time));
	}
}
