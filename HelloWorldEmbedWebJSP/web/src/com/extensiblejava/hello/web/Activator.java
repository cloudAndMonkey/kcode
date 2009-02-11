package com.extensiblejava.hello.web;

import java.util.Dictionary;
import java.util.Hashtable;
import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceReference;
import org.osgi.service.http.HttpContext;
import org.osgi.service.http.HttpService;
import org.eclipse.equinox.jsp.jasper.JspServlet;
import javax.servlet.Servlet;

public final class Activator implements BundleActivator {

    private ServiceReference httpServiceRef;

    public void start( BundleContext bc ) throws Exception {
       
		httpServiceRef = bc.getServiceReference( HttpService.class.getName() );
        if( httpServiceRef != null ) {
			final HttpService httpService = (HttpService) bc.getService( httpServiceRef );
            if( httpService != null ) {
				httpService.registerResources("/hello.html","/hello.html",null);
				httpService.registerResources("/goodbye.html","/goodbye.html",null);
				httpService.registerServlet("/hi", new HelloWorldServlet(), null, null);
				Servlet adaptedJspServlet = new JspServlet(bc.getBundle(), "/");
				httpService.registerServlet("/*.jsp", adaptedJspServlet, null, null);
            }
        }
    }

    public void stop( BundleContext bc ) throws Exception {
        if( httpServiceRef != null ) {
            bc.ungetService( httpServiceRef );
            httpServiceRef = null;
        }
    }
}

