package de.oc.integration.jasper.webapp;

/*
 $Id: ReportWrapper.java 140 2018-09-30 11:13:11Z dietmar.aust $

 Purpose  : Report Wrapper tool for JasperReports to be called via J2EE 

 $LastChangedDate: 2018-09-30 13:13:11 +0200 (So, 30 Sep 2018) $
 $LastChangedBy: dietmar.aust $ 

 Date        Version   Author          Comment
 -------------------------------------------------------------------------------------------
 05.08.2008  0.5.0.0   D. Aust         Initial creation
 25.09.2020  2.6.1     D. Aust         adding log information: jdbc fetch size

 */

/*
 Todo: 

 The first step is to set the JVM property jasper.reports.compile.class.path so that it includes the JasperReports distribution JAR file as well any supporting classes you may have created for the report:
 // Set class path for compiling XML templates
 System.setProperty(
 "jasper.reports.compile.class.path",
 context.getRealPath("/WEB-INF/lib/jasperreports-0.6.1.jar")
 + System.getProperty("path.separator")
 + context.getRealPath("/WEB-INF/classes/"));

 _Events.groovy:

 eventClasspathStart = {
 addResourceBundlesToClasspath()
 }


 private def addResourceBundlesToClasspath(){
 classpathSet = false
 File reportsDir = new File("src/reports")
 reportsDir.eachDirRecurse { File directory ->
 if( directory.name.endsWith("_Bundle") ){
 println "Adding ${directory.getAbsolutePath()} to classpath"
 rootLoader.addURL( directory.toURL() )
 }
 }
 }

 */

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import de.oc.db.DBUtils;
import de.oc.jasper.ReportDefinitionFile;
import de.oc.jasper.ReportUtilities;
import de.oc.print.PrinterUtilities;
import de.oc.utils.Utils;
import net.sf.jasperreports.engine.DefaultJasperReportsContext;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.SimpleJasperReportsContext;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.engine.export.JRCsvExporter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRRtfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;
import net.sf.jasperreports.engine.export.ooxml.JRPptxExporter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.export.Exporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleHtmlExporterOutput;
import net.sf.jasperreports.export.SimpleHtmlReportConfiguration;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimpleWriterExporterOutput;
import net.sf.jasperreports.j2ee.servlets.ImageServlet;
import net.sf.jasperreports.repo.FileRepositoryPersistenceServiceFactory;
import net.sf.jasperreports.repo.FileRepositoryService;
import net.sf.jasperreports.repo.PersistenceServiceFactory;
import net.sf.jasperreports.repo.RepositoryService;
import net.sf.jasperreports.web.util.WebHtmlResourceHandler;

public class ReportWrapper extends HttpServlet {
	/**
	 * _repName : name of the .jasper file, e.g. "test" _repFormat : * pdf, rtf
	 * _dataSource : name of the dataSource, e.g. "test" _outFilename : name of
	 * the output file _repLocale : e.g. de_DE _repEncoding : e.g. UTF-8,
	 * windows-1252, iso-8859-1
	 * 
	 */
	private static final long serialVersionUID = 3232059099842063441L;
	private static Logger logger = Logger.getLogger(ReportWrapper.class
			.getName());

	public void init(ServletConfig config) throws ServletException {
		// The container calls the init() method before the servlet can serve
		// any client request.
		super.init(config);
	}

	@SuppressWarnings("rawtypes")
	Map<String, Object> filterInternalParameters(Map requestParams) {
		Map<String, Object> reportParams = new HashMap<String, Object>();

		Iterator iter = requestParams.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry n = (Map.Entry) iter.next();

			// suppress parameters starting with _ for internal parameters
			// to the servlet itself
			if (!n.getKey().toString().startsWith("_")) {
				String key = n.getKey().toString();
				String values[] = (String[]) n.getValue();
				reportParams.put(key, values[0].toString());
			}
		}
		return reportParams;
	}

	// ----------------------------------------------------
	// gets a value and sets a default value if null => nvl
	// ----------------------------------------------------
	String nvl(String p, String defaultValue) {
		if (p == null)
			return defaultValue;
		if (p.equals(""))
			return defaultValue;

		return p;
	}

	// ----------------------------------------------------
	// MAIN service function
	// ----------------------------------------------------
	@SuppressWarnings("unchecked")
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		logger.info("service() start");

		String contentType = "";

		AppConfig appConfig = AppConfig.getInstance();
		// validate configuration, has the config file been changed since last
		// time?
		appConfig.validateConfiguration(getServletContext());
		
	    // #37 Security: Whitelisting of ip addresses to access the /JasperReportsIntegration service
	    if (!appConfig.isIpAddressAllowed(request.getRemoteAddr())){
	    	response.sendError ( HttpServletResponse.SC_FORBIDDEN, "You are not allowed to access the application." );	
	    }

		JasperPrint jasperPrint = null;
		OutputStream out = response.getOutputStream();
		Connection conn = null;
		@SuppressWarnings("rawtypes")
		Exporter exporter = null;

		// extract all relevant url parameters from the url
		URLCallInterface urlCallInterface = new URLCallInterface(request);
		
		// ----------------------------------------------------
		// compile .jrxml file into .jasper on the fly
		// ----------------------------------------------------
		ReportUtilities.compileJRXMLIfNecessary(urlCallInterface.repName);
		
		// ----------------------------------------------------
		// get the jasper file from the report search path
		// look it up in order of the preferences of the search path
		// ----------------------------------------------------
		ReportDefinitionFile reportFile = ReportUtilities
				.getReportDefinitionFile(urlCallInterface.repName);
		logger.info("report definition file found for report:"
				+ urlCallInterface.repName);
		logger.debug("reportFileDir: " + reportFile.reportFileDir);

		// ----------------------------------------------------
		// All parameters are passed to the report,
		// excluding the _* parameters
		// ----------------------------------------------------
		// the parameters are passed down to the report
		Map<String, Object> reportParams = new HashMap<String, Object>();
		reportParams = filterInternalParameters(request.getParameterMap());

		// add parameters to the reportParameters
		reportParams.put("BaseDir", reportFile.reportFileDir);
		logger.debug("set parameter baseDir:" + reportFile.reportFileDir);
		reportParams.put("SUBREPORT_DIR", reportFile.reportFileDir
				+ File.separator);
		logger.debug("set parameter SUBREPORT_DIR:" + reportFile.reportFileDir
				+ File.separator);
		try {
			reportParams.put("REPORT_LOCALE", new Locale(
					urlCallInterface.repLocale.substring(0, 2),
					urlCallInterface.repLocale.substring(3, 5)));
			logger.debug("set parameter REPORT_LOCALE:"
					+ new Locale(urlCallInterface.repLocale.substring(0, 2),
							urlCallInterface.repLocale.substring(3, 5)));
		} catch (Exception e) {
			Utils.throwRuntimeException("Report locale invalid: "
					+ urlCallInterface.repLocale);
		}

		// set report timezone
		logger.debug("set report timezone:" + urlCallInterface.repTimeZone);
		reportParams.put("REPORT_TIME_ZONE",
				java.util.TimeZone.getTimeZone(urlCallInterface.repTimeZone));

		// set file resolver
		// #676 - Resolve local files with relative file paths, i.e. images in
		// the same directory as the report itself
		
/*		
 * 		LocalJasperReportsContext ctx = new LocalJasperReportsContext(
				DefaultJasperReportsContext.getInstance());
		ctx.setClassLoader(getClass().getClassLoader());
		ctx.setFileResolver(new SimpleFileResolver(new File(
				reportFile.reportFileDir)));
*/		
		// upgraded deprecated API functions
		SimpleJasperReportsContext ctx = new SimpleJasperReportsContext();
		FileRepositoryService fileRepository = new FileRepositoryService(ctx, reportFile.reportFileDir, false);
		
		ctx.setExtensions(RepositoryService.class, Collections.singletonList(fileRepository));
		ctx.setExtensions(PersistenceServiceFactory.class, Collections.singletonList(FileRepositoryPersistenceServiceFactory.getInstance()));
		
		// ----------------------------------------------------
		// Fill report using the datasource
		// ----------------------------------------------------
		try {
			conn = appConfig.getConnection(urlCallInterface.dataSource);

			logger.info("fill report");

			JasperFillManager fillmanager = JasperFillManager.getInstance(ctx);

			jasperPrint = fillmanager.fill(reportFile.reportFile.getPath(),
					reportParams, conn);
			logger.info("net.sf.jasperreports.jdbc.fetch.size="+ctx.getProperty("net.sf.jasperreports.jdbc.fetch.size"));
			//logger.info("net.sf.jasperreports.jdbc.concurrency="+ctx.getProperty("net.sf.jasperreports.jdbc.concurrency"));
			//logger.info("net.sf.jasperreports.jdbc.holdability="+ctx.getProperty("net.sf.jasperreports.jdbc.holdability"));
			//logger.info("net.sf.jasperreports.jdbc.result.set.type="+ctx.getProperty("net.sf.jasperreports.jdbc.result.set.type"));
			
			conn.close();
		} catch (SQLException e) {
			Utils.throwRuntimeException(e.getMessage());
		} catch (JRException e) {
			Utils.throwRuntimeException(e.getMessage());
		} finally {
			DBUtils.closeQuietly(conn);
		}

		// ----------------------------------------------------------------------
		// set format specific parameters
		// http://jasperforge.org/uploads/publish/jasperreportswebsite/trunk/config.reference.html
		// Mime-Types:
		// http://technet.microsoft.com/en-us/library/ee309278%28office.12%29.aspx
		// ----------------------------------------------------------------------
		if (urlCallInterface.repFormat.equals("pdf")) {
			contentType = "application/pdf";
			exporter = new JRPdfExporter();
			exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
		}
		if (urlCallInterface.repFormat.equals("docx")) {
			contentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
			exporter = new JRDocxExporter();
			exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
		}
		if (urlCallInterface.repFormat.equals("pptx")) {
			contentType = "application/vnd.openxmlformats-officedocument.presentationml.presentation";
			exporter = new JRPptxExporter();
			exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
		}
		if (urlCallInterface.repFormat.equals("xlsx")) {
			contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
			exporter = new JRXlsxExporter();
			exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
		}
		if (urlCallInterface.repFormat.equals("rtf")) {
			contentType = "application/rtf";
			exporter = new JRRtfExporter();
			exporter.setExporterOutput(new SimpleWriterExporterOutput(out));
		}
		if (urlCallInterface.repFormat.equals("html")
				|| urlCallInterface.repFormat.equals("html2")) {
			// use the new HTMLExporter
			contentType = "text/html";
			exporter = new HtmlExporter();
			SimpleHtmlExporterOutput exporterOutput = new SimpleHtmlExporterOutput(
					out);
			exporter.setExporterOutput(exporterOutput);
			SimpleHtmlReportConfiguration configuration = new SimpleHtmlReportConfiguration();

			// exporterOutput.setImageHandler(new
			// WebHtmlResourceHandler("report_image?image={0}"));
			// exporterOutput.setImageHandler(new WebHtmlResourceHandler(
			// "report_image?" + ImageServlet.IMAGE_NAME_REQUEST_PARAMETER +
			// "={0}" + "&uuid=" + UUID.randomUUID().toString()));
			String uri = urlCallInterface.imagesURI.replace("#IMAGE_NAME#",
					"{0}") + "&uuid=" + UUID.randomUUID().toString();
			uri = uri.replace("#J2EE_CONTEXT_PATH#", request.getContextPath());
			exporterOutput.setImageHandler(new WebHtmlResourceHandler(uri));
			logger.debug(" IMAGES_URI=" + uri);

			exporter.setConfiguration(configuration);

			request.getSession().setAttribute(
					ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE,
					jasperPrint);
		}
		if (urlCallInterface.repFormat.equals("xls")) {
			contentType = "application/vnd.ms-excel";
			exporter = new JRXlsExporter();
			exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
		}
		if (urlCallInterface.repFormat.equals("csv")) {
			contentType = "application/vnd.ms-excel";
			exporter = new JRCsvExporter();
			exporter.setExporterOutput(new SimpleWriterExporterOutput(out));
		}

		logger.debug("set contentType=" + contentType);

		// set content type
		response.setContentType(contentType + "; charset="
				+ urlCallInterface.repEncoding);
		response.setLocale(new Locale(urlCallInterface.repLocale));

		// found this to be mandatory with IE 6.0
		response.setHeader("content-type", contentType + "; charset="
				+ urlCallInterface.repEncoding);

		// set a specific filename for download, if given
		if (urlCallInterface.outFilename != null
				&& !"".equals(urlCallInterface.outFilename)) {
			response.setHeader("Content-Disposition", "attachment; filename="
					+ urlCallInterface.outFilename);
		}

		// ----------------------------------------------------
		// generate the report and return file to the client browser
		// ----------------------------------------------------
		logger.info("export report");
		try {
			exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
			exporter.exportReport();
		} catch (JRException e) {
			Utils.throwRuntimeException(e.getMessage());
		}

		// ----------------------------------------------------
		// save the report in the filesystem
		// ----------------------------------------------------
		if (urlCallInterface.saveIsEnabled.booleanValue()) {
			logger.info("user wants to save file to "
					+ urlCallInterface.saveFileName);

			if (appConfig.saveFileIsEnabled) {
				logger.trace("saveFile is enabled in the configuration file");

				File file = new File(urlCallInterface.saveFileName);
				String filename = file.getName();
				String dirName = file.getParent();

				logger.trace("dirName: " + dirName);
				logger.trace("filename: " + filename);

				// is this a whitelist directory?
				if (!appConfig.isWhitelistDirectory(dirName)) {
					Utils.throwRuntimeException("Directory "
							+ dirName
							+ " is not specified as a whitelist target directory in application.properties.");
				}

				if (!file.getParentFile().exists()) {
					Utils.throwRuntimeException("Directory " + dirName
							+ " does not exist.");
				}

				// export report to file
				logger.info("export report to file: "
						+ urlCallInterface.saveFileName);
				logger.info("repFormat: "+ urlCallInterface.repFormat);
				try {

					// special handling for html exports
					// 30.09.2018 D. Aust
					// conversion exception
					if (urlCallInterface.repFormat.equals("html")
							|| urlCallInterface.repFormat.equals("html2")) {
						logger.info("export HTML to file: "
								+ urlCallInterface.saveFileName);
						JasperExportManager.exportReportToHtmlFile(jasperPrint, urlCallInterface.saveFileName);
					}else{
						SimpleOutputStreamExporterOutput exporterOutput = new SimpleOutputStreamExporterOutput(
								file);
						exporter.setExporterInput(new SimpleExporterInput(
								jasperPrint));
						exporter.setExporterOutput(exporterOutput);
						exporter.exportReport();
					}
				} catch (JRException e) {
					Utils.throwRuntimeException(e.getMessage());
				}
			} else {
				Utils.throwRuntimeException("saveFile is not enabled in application.properties.");
			}
		}

		// ----------------------------------------------------
		// send the report to the printer
		// ----------------------------------------------------
		if (urlCallInterface.printIsEnabled.booleanValue()) {
			logger.debug("user wants to use printer directly ...  ");

			if (appConfig.printIsEnabled) {
				logger.trace("printing is enabled in the configuration file");

				PrinterUtilities printerUtilities = new PrinterUtilities();

				printerUtilities.print(jasperPrint,
						urlCallInterface.printPrinterName,
						urlCallInterface.printPrinterTray,
						urlCallInterface.printCopies.intValue(),
						urlCallInterface.printDuplex.booleanValue(),
						urlCallInterface.printCollate.booleanValue(),
						urlCallInterface.printJobName, new Locale(
								urlCallInterface.repLocale));
			} else {
				Utils.throwRuntimeException("direct printing is not enabled in application.properties.");
			}
		}
		
		out.close();

		logger.info("service() end");
	}
}
