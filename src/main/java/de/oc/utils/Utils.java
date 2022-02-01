package de.oc.utils;

import java.util.Enumeration;
import java.util.Properties;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Utils {

	private static final Logger logger = LogManager.getLogger(Utils.class);

	/**
	 * 
	 * @param msg the message to be displayed with the runtimeException
	 */
	public static void throwRuntimeException(String msg) {
		logger.error(msg);
		throw new RuntimeException(msg);
	}

	/**
	 * lists all system properties for debugging purposes
	 */
	public static void logSystemProperties() {
		logger.trace("*** list all system properties");

		// Get all system properties
		Properties props = System.getProperties();
		{
			// Enumerate all system properties
			for (Enumeration<?> e = props.propertyNames(); e.hasMoreElements();) {
				// Get property name
				String propName = (String) e.nextElement();

				// Get property value
				String propValue = (String) props.get(propName);

				logger.trace(propName + ": " + propValue);
			}
		}
	}

}
