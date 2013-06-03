/*
 * XmlGeometryFactory.java
 * May 27, 2007 
 * Copyright (c) 2007 Drexel University. All rights reserved.
 *
 */
package edu.drexel.cs350.xml;

import java.io.File;
import java.io.IOException;

import javax.xml.xpath.XPathException;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import edu.drexel.cs350.Feature;
import edu.drexel.cs350.FeatureFactory;
import edu.drexel.cs350.Geometry;
import edu.drexel.cs350.GeometryFactory;
import edu.drexel.cs350.VirCadException;
import edu.drexel.cs350.feature.Circle;
import edu.drexel.cs350.feature.Point;
import edu.drexel.cs350.feature.Polygon;
import edu.drexel.cs350.feature.Rectangle;
import edu.drexel.cs350.feature.Text;
import edu.drexel.cs350.graphics.Renderer;

/**
 * Reads and writes Geometry from and to XML files
 *
 * @author Sunny Huynh
 * @version 1.0
 * @since 1.0
 */
public class XmlGeometryFactory implements GeometryFactory
{
	private final XmlDataSource data;
	private final FeatureFactory factory;
	
	public XmlGeometryFactory(final String path, final Renderer rend)
			throws VirCadException
	{	
		this(new File(path), rend);
	}
	
	public XmlGeometryFactory(final File file, final Renderer rend)
			throws VirCadException
	{
		data = new XmlDataSource(file);
		factory = new FeatureFactory(rend);
	}
	
	public Geometry read() throws VirCadException
	{
		Geometry geom = null;
		try {
			int width = DEFAULT_WIDTH;
			int height = DEFAULT_HEIGHT;
			Node attr = data.getNode("/geometry/@width");
			if (attr != null)
				width = Integer.parseInt(attr.getNodeValue());
			attr = data.getNode("/geometry/@height");
			if (attr != null)
				height = Integer.parseInt(attr.getNodeValue());
			
			geom = new Geometry(width, height);

			final NodeList features = data.getNodeList("/geometry/*");
			for (int i = 0; i < features.getLength(); ++i)
				geom.add(parse((Element)features.item(i)));
		}
		catch (XPathException ex) {
			throw new VirCadException("Unable to read Geometry data", ex);
		}

		return geom;
	}

	protected Feature parse(final Element elem)
			throws VirCadException, XPathException
	{
		final String type = elem.getNodeName();
		if (type.equals("point"))
			return parsePoint(elem);
		else if (type.equals("circle"))
			return parseCircle(elem);
		else if (type.equals("rectangle"))
			return parseRectangle(elem);
		else if (type.equals("polygon"))
			return parsePolygon(elem);
		else if (type.equals("text"))
			return parseText(elem);
		else
			throw new VirCadException("Unknown feature type: " + type);
	}
	
	protected Point parsePoint(final Element elem) throws XPathException
	{
		final int x = Integer.parseInt(elem.getAttribute("x"));
		final int y = Integer.parseInt(elem.getAttribute("y"));
		return factory.createPoint(x, y);
	}

	protected Rectangle parseRectangle(final Element elem) throws XPathException
	{
		final int x1 = Integer.parseInt(data.getNode("point[1]/@x",
				elem).getNodeValue());
		final int y1 = Integer.parseInt(data.getNode("point[1]/@y",
				elem).getNodeValue());
		final int x2 = Integer.parseInt(data.getNode("point[2]/@x",
				elem).getNodeValue());
		final int y2 = Integer.parseInt(data.getNode("point[2]/@y",
				elem).getNodeValue());
		return factory.createRectangle(x1, y1, x2, y2);
	}
	
	protected Circle parseCircle(final Element elem) throws XPathException
	{
		final int x = Integer.parseInt(elem.getAttribute("x"));
		final int y = Integer.parseInt(elem.getAttribute("y"));
		final int radius = Integer.parseInt(elem.getAttribute("radius"));
		return factory.createCircle(x, y, radius);
	}
	
	protected Polygon parsePolygon(final Element elem) throws XPathException
	{
		final Polygon poly = factory.createPolygon();
		final NodeList points = data.getNodeList("point", elem);
		for (int i = 0; i < points.getLength(); ++i) {
			final Element pt = (Element)points.item(i);
			final int x = Integer.parseInt(pt.getAttribute("x"));
			final int y = Integer.parseInt(pt.getAttribute("y"));
			
			poly.add(x, y);
		}
		return poly;
	}

	protected Text parseText(final Element elem) throws XPathException
	{
		final int x = Integer.parseInt(elem.getAttribute("x"));
		final int y = Integer.parseInt(elem.getAttribute("y"));
		final String value = elem.getTextContent();
		if (elem.getAttribute("size").length() == 0)
			return factory.createText(x, y, value);
		else
			return factory.createText(x, y, value,
					Integer.parseInt(elem.getAttribute("size")));
	}

	public void write() throws VirCadException
	{
		try {
			data.save();
		}
		catch (IOException ex) {
			throw new VirCadException("Unable to write Geometry data", ex);
		}
	}
}
