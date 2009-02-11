package com.extensiblejava.hello.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloWorldServlet extends HttpServlet {
	
	private static String source;
	
	public void init() throws ServletException {
 		source = getServletConfig().getInitParameter("source");
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		if ( (source != null) && (source.equals("web")) ){
			resp.getWriter().write("<html><body><p>Hello Web World -- Welcome to the Tomcat WebApp.</p><p>Say <a href=\"./hello.html\"/>hello.</a></p><p>Say <a href=\"./goodbye.html\"/>goodbye.</a></p><p>Serve me <a href=\"./hello.jsp\"/>a JSP please.</a></p></body></html>"); //$NON-NLS-1$
		} else {
			resp.getWriter().write("<html><body><p>Hello OSGI World -- Welcome to Equinox embedded in Tomcat.</p><p>Say <a href=\"./hello.html\"/>hello.</a></p><p>Say <a href=\"./goodbye.html\"/>goodbye.</a></p><p>Serve me <a href=\"./hello.jsp\"/>a JSP please.</a></p></body></html>"); //$NON-NLS-1$
		}
	}
}
