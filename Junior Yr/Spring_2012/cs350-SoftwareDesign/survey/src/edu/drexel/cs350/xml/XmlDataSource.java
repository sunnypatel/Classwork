/*
 * XmlDataSource.java
 * Copyright (c) 2007 Drexel University. All rights reserved.
 * 
 */
package edu.drexel.cs350.xml;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathException;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import edu.drexel.cs350.xml.VirCadException;

/**
 * Fascade to XML data file
 *
 * @author Sunny Huynh
 * @version 1.0
 * @since 1.0
 */
public class XmlDataSource
{
	protected final Logger logger;
	protected final File file;
	protected final Document data;
	protected final XPath xpath;
	
	public XmlDataSource(final String path) throws VirCadException
	{
		this(new File(path));
	}
	
	public XmlDataSource(final File path) throws VirCadException
	{
		try {
			logger = Logger.getLogger(getClass().getName());
			file = path;
			
			final DocumentBuilder builder = DocumentBuilderFactory.newInstance()
					.newDocumentBuilder();
			if (file.exists() && file.canRead())
				data = builder.parse(file);
			else
				data = createDocument(builder);
			
			xpath = XPathFactory.newInstance().newXPath();
		}
		catch (Exception ex) {
			throw new VirCadException("Unable to initialize XML", ex);
		}
	}
	
	private Document createDocument(final DocumentBuilder builder)
			throws SAXException, IOException
	{
		final String xml = "<geometry width=\"500\" height=\"500\" />";
		return builder.parse(new InputSource(new StringReader(xml)));
	}
	
	public Document getDocument()
	{
		return data;
	}
	
	public Element createNode(final String name)
	{
		return data.createElement(name);
	}
	
	public Element createNode(final String name, final String value)
	{
		final Element node = data.createElement(name);
		node.setTextContent(value);
		return node;
	}
	
	public Node getNode(final String path) throws XPathException
	{
		return getNode(path, data);
	}
	
	public Node getNode(final String path, final Node root)
			throws XPathException
	{
		final XPathExpression expr = xpath.compile(path);
		return (Node)expr.evaluate(root, XPathConstants.NODE);
	}
	
	public NodeList getNodeList(final String path) throws XPathException
	{
		return getNodeList(path, data);
	}

	public NodeList getNodeList(final String path, final Node root)
			throws XPathException
	{
		final XPathExpression expr = xpath.compile(path);
		return (NodeList)expr.evaluate(root, XPathConstants.NODESET);
	}
	
	public static String escapeXml(final String xml)
	{
		return xml.replaceAll("&", "&amp;").replaceAll("\"", "&quot;")
				.replaceAll("<", "&lt;").replaceAll(">", "&gt;")
				.replaceAll("\'", "&apos;");
	}
	
	public void save() throws IOException
	{
		try {
			final Transformer transform = TransformerFactory.newInstance()
					.newTransformer();
			transform.transform(new DOMSource(data), new StreamResult(file));
		}
		catch (Exception ex) {
			logger.log(Level.SEVERE, "Unable to save data", ex);
			throw new IOException("Unable to save data");
		}
	}
}
