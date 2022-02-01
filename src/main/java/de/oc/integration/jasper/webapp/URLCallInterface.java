/*
 $Id: URLCallInterface.java 124 2018-09-29 16:16:57Z dietmar.aust $

 Purpose  :  

 $LastChangedDate: 2018-09-29 18:16:57 +0200 (Sat, 29 Sep 2018) $
 $LastChangedBy: dietmar.aust $ 

 Date        Author          Comment
 --------------------------------------------------------------------------------------
 01.08.2012  D. Aust         Initial creation

 */

package de.oc.integration.jasper.webapp;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import de.oc.db.DBUtils;
import de.oc.servlet.ServletUtilities;
import de.oc.utils.Utils;
import net.sf.jasperreports.j2ee.servlets.ImageServlet;

public class URLCallInterface {

	// general settings
	public String repName;
	public String repFormat;
	public String dataSource;
	public String outFilename;
	public String repLocale;
	public String repEncoding;
	public String repTimeZone;
	public String imagesURI;

	// direct printing
	public Boolean printIsEnabled; // send report to printer in this request?
	public String printPrinterName;
	public String printPrinterTray;
	public Integer printCopies;
	public Boolean printDuplex;
	public Boolean printCollate;
	public String printJobName;

	// save file on server
	public Boolean saveIsEnabled;
	public String saveFileName;

	private static final Logger logger = LogManager.getLogger(URLCallInterface.class);

	private Boolean parseBoolean(String requestParameter) {
		Boolean retVal;

		if (requestParameter == null || requestParameter.isEmpty()) {
			retVal = null;
		} else {
			retVal = Boolean.valueOf(requestParameter);
		}

		return retVal;
	}

	private Integer parseInteger(String requestParameter) {
		Integer retVal;

		if (requestParameter == null || requestParameter.isEmpty()) {
			retVal = null;
		} else {
			retVal = Integer.valueOf(requestParameter);
		}

		return retVal;
	}

	/**
	 * Constructor
	 * 
	 * @param request the default request from the servletRequest
	 */
	public URLCallInterface(HttpServletRequest request) {
		logger.traceEntry();

		ServletUtilities.logRequestParameters(request);

		// ----------------------------------------------------
		// get url parameters
		// ----------------------------------------------------
		repName = request.getParameter("_repName");
		repFormat = request.getParameter("_repFormat");
		dataSource = request.getParameter("_dataSource");
		outFilename = request.getParameter("_outFilename");
		repLocale = request.getParameter("_repLocale");
		repEncoding = request.getParameter("_repEncoding");
		repTimeZone = request.getParameter("_repTimeZone");
		imagesURI = request.getParameter("_imagesURI");

		// direct printing
		printIsEnabled = parseBoolean(request.getParameter("_printIsEnabled"));
		printPrinterName = request.getParameter("_printPrinterName");
		printPrinterTray = request.getParameter("_printPrinterTray");

		printCopies = parseInteger(request.getParameter("_printCopies"));
		printDuplex = parseBoolean(request.getParameter("_printDuplex"));
		printCollate = parseBoolean(request.getParameter("_printCollate"));
		printJobName = request.getParameter("_printJobName");

		// save file in filesystem
		saveIsEnabled = parseBoolean(request.getParameter("_saveIsEnabled"));
		saveFileName = request.getParameter("_saveFileName");

		// ----------------------------------------------------
		// set default values
		// ----------------------------------------------------
		repName = DBUtils.nvl(repName, "test");
		repFormat = DBUtils.nvl(repFormat, "pdf");
		dataSource = DBUtils.nvl(dataSource, "default");
		outFilename = DBUtils.nvl(outFilename, null);
		repLocale = DBUtils.nvl(repLocale, "de_DE");
		repEncoding = DBUtils.nvl(repEncoding, "UTF-8");
		// no default for TimeZone ... should be picked up by Java environment
		repTimeZone = DBUtils.nvl(repTimeZone, java.util.TimeZone.getDefault().getID());

		imagesURI = DBUtils.nvl(imagesURI, "report_image?" + ImageServlet.IMAGE_NAME_REQUEST_PARAMETER + "={0}");

		printIsEnabled = DBUtils.nvl(printIsEnabled, Boolean.FALSE);
		printCopies = DBUtils.nvl(printCopies, new Integer(1));
		printDuplex = DBUtils.nvl(printDuplex, Boolean.FALSE);
		printCollate = DBUtils.nvl(printCollate, Boolean.FALSE);

		saveIsEnabled = DBUtils.nvl(saveIsEnabled, Boolean.FALSE);

		// ----------------------------------------------------
		// debug
		// ----------------------------------------------------
		logger.debug("URL parameters including defaults:");
		if (dataSource!=null)
			logger.debug("	dataSource=" + dataSource);
		if (repName!=null)
			logger.debug("	repName=" + repName);
		if (repFormat!=null)
			logger.debug("	repFormat=" + repFormat);
		if (repLocale!=null)
			logger.debug("	repLocale=" + repLocale);
		if (repEncoding!=null)
			logger.debug("	repEncoding=" + repEncoding);
		if (repTimeZone!=null)
			logger.debug("	repTimeZone=" + repTimeZone);
		if (outFilename!=null)
			logger.debug("	outFilename=" + outFilename);
		if (printIsEnabled) {
			logger.debug("	printUsePrinter=" + printIsEnabled);
			if (printPrinterName!=null)
				logger.debug("	printPrinterName=" + printPrinterName);
			if (printPrinterTray!=null)
				logger.debug("	printPrinterTray=" + printPrinterTray);
			if (printCopies!=null)
				logger.debug("	printCopies=" + printCopies);
			if (printDuplex)
				logger.debug("	printDuplex=" + printDuplex);
			if (printCollate)
				logger.debug("	printCollate=" + printCollate);
			if (printJobName!=null)
				logger.debug("	printJobName=" + printJobName);
		}
		if (saveIsEnabled) {
			logger.debug("	saveIsEnabled=" + saveIsEnabled);
			if (saveFileName!=null)
				logger.debug("	saveFileName=" + saveFileName);

		}

		// ----------------------------------------------------
		// Assert input values
		// ----------------------------------------------------
		// valid report format?
		if (!repFormat.equals("pdf") && !repFormat.equals("rtf") && !repFormat.equals("html")
				&& !repFormat.equals("xls") && !repFormat.equals("xlsx") && !repFormat.equals("docx")
				&& !repFormat.equals("html") && !repFormat.equals("pptx") && !repFormat.equals("jxl")
				&& !repFormat.equals("csv") && !repFormat.equals("html2")) {

			Utils.throwRuntimeException("Unknown _repFormat: " + repFormat);
		}
		logger.debug("input values asserted");

		logger.traceExit();
	}
}
