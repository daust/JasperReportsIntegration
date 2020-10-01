package de.oc.integration.jasper.webapp;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
 
/** Initializes the connection pool at context initialization
 * 
 * @author daust
 *
 */
public class AppServletContextListener implements ServletContextListener{
	ServletContext servletContext;
	private final static Logger logger = Logger.getLogger(AppServletContextListener.class);
	
	private static AppConfig appConfig = null;

	
	/**
	 * 
	 */
	public void contextInitialized(ServletContextEvent contextEvent) {
		// logging full details in this class only, not the rootLogger!
		// proper logging will be set later after reading the config files
		logger.setLevel(Level.ALL);
		logger.debug("contextInitialized() called");
		
		// get servletContext, will store configInformation and connection pool details there
		servletContext = contextEvent.getServletContext();
		
		// Initialize AppConfig, can be reloaded later
		appConfig = AppConfig.getInstance();
		appConfig.initialize(servletContext);

		// logging full details in this class only, not the rootLogger!
		// proper logging will be set later after reading the config files
		logger.debug("contextInitialized() called");
		
		
		// set variable to servlet context
		servletContext.setAttribute("appConfig", appConfig);
		
		
		logger.debug("contextInitialized() finished!");
	}
	
	/** Cleanup when application is undeployed or server crashes.
	 * 
	 */
	public void contextDestroyed(ServletContextEvent contextEvent) {
		logger.debug("contextDestroyed() called");
		servletContext = contextEvent.getServletContext();
		
		appConfig = (AppConfig) servletContext.getAttribute("appConfig");
		
		// clean up the connection pool and other things
		appConfig.close();
		
		logger.debug("contextDestroyed() finished!");
	}
}
