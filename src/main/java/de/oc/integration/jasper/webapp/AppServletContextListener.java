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
		//logger.setLevel(Level.ALL);
		logger.debug("contextInitialized() called");
		
		
		// set variable to servlet context
		servletContext.setAttribute("appConfig", appConfig);
		
		/*
		// set context variables
		servletContext.setAttribute(AppConfig.OC_JASPER_WEBAPP_HOME, contextEvent.getServletContext().getRealPath("/"));
		servletContext.setAttribute(AppConfig.OC_JASPER_CONFIG_HOME_INIT, contextEvent.getServletContext().getInitParameter(AppContext.OC_JASPER_CONFIG_HOME_INIT));
		servletContext.setAttribute(AppConfig.OC_JASPER_CONFIG_HOME_ENV, System.getenv(AppContext.OC_JASPER_CONFIG_HOME_ENV));
		
		logger.info(AppConfig.OC_JASPER_WEBAPP_HOME + "=" + servletContext.getAttribute(AppConfig.OC_JASPER_WEBAPP_HOME));
		logger.info(AppConfig.OC_JASPER_CONFIG_HOME_INIT + "=" + servletContext.getAttribute(AppConfig.OC_JASPER_CONFIG_HOME_INIT));
		logger.info(AppConfig.OC_JASPER_CONFIG_HOME_ENV + "=" + servletContext.getAttribute(AppConfig.OC_JASPER_CONFIG_HOME_ENV));
		*/
		
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
