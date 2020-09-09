/*
 $Id: ServletUtilities.java 88 2017-10-15 21:25:31Z dietmar.aust $

 Purpose  :  

 $LastChangedDate: 2017-10-15 23:25:31 +0200 (So, 15 Okt 2017) $
 $LastChangedBy: dietmar.aust $ 

 Date        Author          Comment
 --------------------------------------------------------------------------------------
 01.08.2012  D. Aust         Initial creation

 */

package de.oc.servlet;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

public class ServletUtilities {

	private static Logger logger = Logger.getLogger(ServletUtilities.class
			.getName());

	/**
	 * log all url parameters
	 * 
	 * @param pRequest the httpServletRequest
	 */
	public static void logRequestParameters(HttpServletRequest pRequest) {

		logger.info("logRequestParameters() - start");

		// Enumerate all system properties
		for (Enumeration<?> e = pRequest.getParameterNames(); e.hasMoreElements();) {
			// Get parameter name
			String paramName = (String) e.nextElement();

			// Get parameter value
			String paramValue = (String) pRequest.getParameter(paramName);

			logger.info(paramName + ": " + paramValue);
		}
		logger.info("logRequestParameters() - end");
	}
}
