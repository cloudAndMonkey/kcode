package com.extensiblejava.hello.web;

import org.osgi.framework.*;
import org.mortbay.jetty.Server;
import org.mortbay.jetty.handler.ResourceHandler;
import org.mortbay.jetty.handler.ContextHandler;
import org.mortbay.jetty.servlet.Context;
import org.mortbay.jetty.servlet.DefaultServlet;
import org.mortbay.jetty.servlet.ServletHolder;


import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.osgi.framework.Bundle;
import org.osgi.framework.ServiceReference;
import org.osgi.util.tracker.ServiceTracker;

public class Activator implements BundleActivator {
	private Server server;
	//private ServiceTracker httpServiceTracker;

	public void start(BundleContext context) throws Exception {
		server = new Server(8380);
		Context root = new Context(server, "/", Context.SESSIONS);
		root.addServlet(new ServletHolder(new HelloWorldServlet()), "/*");
		//root.addServlet(new ServletHolder(new ResourceServlet(context.getBundle(), "a", "", "hello.html")), "/a");
		root.addServlet(new ServletHolder(new ResourceServlet(context.getBundle(), "a", "", "")), "/a/*");
		server.start();
	}

	public void stop(BundleContext context) throws Exception {
		server.stop();
	}

	/*private class HttpServiceTracker extends ServiceTracker {

		public HttpServiceTracker(BundleContext context) {
			super(context, HttpService.class.getName(), null);
		}

		public Object addingService(ServiceReference reference) {
			HttpService httpService = (HttpService) context.getService(reference);
			try {
				//httpService.registerResources("/hello.html", "/hello.html", null); //$NON-NLS-1$ //$NON-NLS-2$
				//httpService.registerResources("/hello.jsp", "/hello.jsp", null); //$NON-NLS-1$ //$NON-NLS-2$
				httpService.registerServlet("/helloworld", new HelloWorldServlet(), null, null); //$NON-NLS-1$
			} catch (Exception e) {
				e.printStackTrace();
			}
			return httpService;
		}

		public void removedService(ServiceReference reference, Object service) {
			//HttpService httpService = (HttpService) service;
			//httpService.unregister("/hello.html"); //$NON-NLS-1$
			//httpService.unregister("/hello.jsp"); //$NON-NLS-1$
			httpService.unregister("/helloworld"); //$NON-NLS-1$
			super.removedService(reference, service);
		}*/
}

/*private ServiceTracker httpServiceTracker;

	public void start(BundleContext context) throws Exception {
		httpServiceTracker = new HttpServiceTracker(context);
		httpServiceTracker.open();
	}

	public void stop(BundleContext context) throws Exception {
		httpServiceTracker.close();
		httpServiceTracker = null;
	}

	private class HttpServiceTracker extends ServiceTracker {

		public HttpServiceTracker(BundleContext context) {
			super(context, HttpService.class.getName(), null);
		}

		public Object addingService(ServiceReference reference) {
			HttpService httpService = (HttpService) context.getService(reference);
			try {
				httpService.registerResources("/hello.html", "/hello.html", null); //$NON-NLS-1$ //$NON-NLS-2$
				httpService.registerResources("/hello.jsp", "/hello.jsp", null); //$NON-NLS-1$ //$NON-NLS-2$
				httpService.registerServlet("/helloworld", new HelloWorldServlet(), null, null); //$NON-NLS-1$
			} catch (Exception e) {
				e.printStackTrace();
			}
			return httpService;
		}

		public void removedService(ServiceReference reference, Object service) {
			HttpService httpService = (HttpService) service;
			httpService.unregister("/hello.html"); //$NON-NLS-1$
			httpService.unregister("/hello.jsp"); //$NON-NLS-1$
			httpService.unregister("/helloworld"); //$NON-NLS-1$
			super.removedService(reference, service);
		}
	}*/
