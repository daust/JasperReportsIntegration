package de.oc.integration.jasper.webapp;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.config.Configurator;

/**
 * Initializes the connection pool at context initialization
 * 
 * @author daust
 *
 */
public class AppServletContextListener implements ServletContextListener {
	ServletContext servletContext;
	private static final Logger logger = LogManager.getLogger(AppServletContextListener.class);

	private static AppConfig appConfig = null;

	/**
	 * 
	 */
	public void contextInitialized(ServletContextEvent contextEvent) {
		// logging full details in this class only, not the rootLogger!
		// proper logging will be set later after reading the config files
		Configurator.setLevel(LogManager.getRootLogger().getName(), Level.INFO);

		// get servletContext, will store configInformation and connection pool details
		// there
		servletContext = contextEvent.getServletContext();

		// Initialize AppConfig, can be reloaded later
		appConfig = AppConfig.getInstance();
		appConfig.initialize(servletContext);

		// set variable to servlet context
		servletContext.setAttribute("appConfig", appConfig);
	}

	/**
	 * Cleanup when application is undeployed or server crashes.
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
