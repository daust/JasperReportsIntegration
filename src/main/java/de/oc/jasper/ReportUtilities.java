/*
 $Id: ReportUtilities.java 88 2017-10-15 21:25:31Z dietmar.aust $

 Purpose  :  

 $LastChangedDate: 2017-10-15 23:25:31 +0200 (So, 15 Okt 2017) $
 $LastChangedBy: dietmar.aust $ 

 Date        Author          Comment
 --------------------------------------------------------------------------------------
 01.08.2012  D. Aust         Initial creation

 */

package de.oc.jasper;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import de.oc.integration.jasper.webapp.AppConfig;
import de.oc.servlet.ServletUtilities;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;

public class ReportUtilities {

	private static final Logger logger = LogManager.getLogger();

	private static AppConfig _appConfig = AppConfig.getInstance();

	/**
	 * log all url parameters
	 * 
	 * @param pParameters
	 */
	static void logRequestParameters(HttpServletRequest pRequest) {

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

	/**
	 * 
	 * @param pRepName name of the report
	 * 
	 * @return 0: .jasper File() object 1: reportsDirectory 2:
	 * 
	 */
	public static ReportDefinitionFile getReportDefinitionFile(String pRepName) {

		String errMsg = "";
		String[] reportsPath = _appConfig.getReportsPath();
		ReportDefinitionFile reportFile = null;
		File jasperFile = null;
		String reportsDir = null;

		// look for the file in all entries of the reports path
		logger.debug("search for report " + pRepName + " in reportsPath: "
				+ de.oc.utils.StringUtils.convertStringArrayToString(reportsPath, ","));
		for (int i = 0; i < reportsPath.length; i++) {
			reportsDir = reportsPath[i];
			String reportFileNameBase = reportsDir + File.separator + pRepName;

			jasperFile = new File(reportFileNameBase + ".jasper");
			logger.trace("  test for report: " + reportFileNameBase + ".jasper");
			if (jasperFile.exists())
				break;

		}
		// does the report definition file exist?
		if (!jasperFile.exists()) {
			errMsg = "File " + pRepName + ".jasper not found on the report path.";

			throw new RuntimeException(errMsg);
		}

		String reportFileDir = jasperFile.getParentFile().getAbsolutePath();
		reportFile = new ReportDefinitionFile(jasperFile, reportFileDir, reportsDir);

		return reportFile;
	}

	/**
	 * Compiles the pRepName.jrxml file into a pRepName.jasper file if it exists and
	 * the timestamp is newer than the .jasper file
	 * 
	 * @param pRepName name of the report
	 * 
	 */
	public static void compileJRXMLIfNecessary(String pRepName) {

		String errMsg = "";
		String[] reportsPath = _appConfig.getReportsPath();

		// look for the file in all entries of the reports path
		logger.debug("search for report " + pRepName + " in reportsPath: "
				+ de.oc.utils.StringUtils.convertStringArrayToString(reportsPath, ","));
		for (int i = 0; i < reportsPath.length; i++) {
			String reportsDir = reportsPath[i];
			String reportFileNameBase = reportsDir + File.separator + pRepName;

			File jasperFile = new File(reportFileNameBase + ".jasper");
			File jrxmlFile = new File(reportFileNameBase + ".jrxml");

			logger.trace("  test for report: " + reportFileNameBase + ".jrxml" + " => " + jrxmlFile.exists());
			logger.trace("  test for report: " + reportFileNameBase + ".jasper" + " => " + jasperFile.exists());
			
			
			// compilation is only required if jrxml file actually exists
			if (jrxmlFile.exists()) {
				// compile if no .jasper exists or timestamp is older than that of the .jrxml
				// file
				
				if (!jasperFile.exists() || (jasperFile.lastModified() < jrxmlFile.lastModified())) {
					try {
						logger.info("compiling file " + reportFileNameBase + ".jrxml on-the-fly");

						JasperCompileManager.compileReportToFile(reportFileNameBase + ".jrxml",
								reportFileNameBase + ".jasper");
					} catch (JRException e) {
						e.printStackTrace();
						errMsg = "Error compiling " + reportFileNameBase + ".jrxml: " + e.getMessage();

						throw new RuntimeException(errMsg);
					}
				}
			}

			// stop looping through directories once the first file is found
			if (jasperFile.exists() || jrxmlFile.exists())
				break;

		}

	}

}
