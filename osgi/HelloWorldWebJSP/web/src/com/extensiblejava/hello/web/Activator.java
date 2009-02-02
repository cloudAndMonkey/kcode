package com.extensiblejava.hello.web;

import java.util.Dictionary;
import java.util.Hashtable;
import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceReference;
import org.osgi.service.http.HttpContext;
import org.osgi.service.http.HttpService;
import org.ops4j.pax.web.service.WebContainer;

public final class Activator implements BundleActivator {

    private ServiceReference m_httpServiceRef;

    public void start( BundleContext bc ) throws Exception {
       
		m_httpServiceRef = bc.getServiceReference( WebContainer.class.getName() );
        if( m_httpServiceRef != null ) {
			final WebContainer webContainer = (WebContainer) bc.getService( m_httpServiceRef );
            if( webContainer != null ) {
                // create a default context to share between registrations
                final HttpContext httpContext = webContainer.createDefaultHttpContext();
                // register the hello world servlet
                final Dictionary initParams = new Hashtable();
                initParams.put( "from", "HttpService" );
                webContainer.registerServlet("/", new HelloWorldServlet(), initParams, httpContext);
				//register JSP
				webContainer.registerJsps(new String[]{ "/jsp/*" }, httpContext);	
                // register html pages as resources
                webContainer.registerResources("/html", "/", httpContext);
            }
        }
    }

    public void stop( BundleContext bc ) throws Exception {
        if( m_httpServiceRef != null ) {
            bc.ungetService( m_httpServiceRef );
            m_httpServiceRef = null;
        }
    }
}

