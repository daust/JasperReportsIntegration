/*
 $Id: Apex.java 59 2015-10-04 20:58:19Z dietmar.aust $

 $LastChangedDate: 2015-10-04 22:58:19 +0200 (Sun, 04 Oct 2015) $
 $LastChangedBy: dietmar.aust $ 

 Date        Version   Author          Comment
 -------------------------------------------------------------------------------------------
 10.08.2008  0.5.0.0   D. Aust         Initial creation

 */

package de.oc.integration.jasper.webapp;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import de.oc.utils.Utils;
import net.sf.jasperreports.engine.JRAbstractExporter;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.engine.export.JRExporterContext;
import net.sf.jasperreports.engine.export.JRRtfExporter;
import net.sf.jasperreports.export.ExporterConfiguration;
import net.sf.jasperreports.export.ExporterOutput;
import net.sf.jasperreports.export.ReportExportConfiguration;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleHtmlReportConfiguration;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimpleXlsReportConfiguration;
import net.sf.jasperreports.pdf.JRPdfExporter;
import net.sf.jasperreports.poi.export.JRXlsExporter;

/**
 * Report integration for Oracle APEX, merge a xml feed with a jasper report on
 * the fly. Still experimental!
 * 
 * @author daust
 *
 */
public class Apex extends HttpServlet {
	/**
	 */
	private static final long serialVersionUID = 3232059099842053441L;

	// request, response and out stream
	HttpServletRequest _request = null;
	HttpServletResponse _response = null;
	private OutputStream _out = null;

	// physical directory names
	String _baseDir = null;
	String _reportsDir = null;

	// passed xml stream and template
	String _xml = null;
	String _template = null;

	// report stuff
	String _repName = null;
	String _repJRXMLFileName = null;
	File _repJRXMLFile = null;
	String _repFormat = null;
	String _xmlFileName = null;
	String _repEncoding = "UTF-8";

	/** value parsing. */
	// private static final String VALUE_PARSING = "##.0";

	private static final Logger logger = LogManager.getLogger(Apex.class);

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
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
	// saves a string to a file
	// ----------------------------------------------------
	void saveToFile(String val, String filename) {
		if (val != null && filename != null) {
			try {
				File file = new File(filename);
				FileOutputStream fstream = new FileOutputStream(file);
				fstream.write(val.getBytes("UTF-8"));
				fstream.close();
			} catch (IOException e) {
				e.printStackTrace(new PrintWriter(_out));
			}
		}
	}

	// ----------------------------------------------------
	// parses the url parameters and sets the appropriate
	// default values
	// ----------------------------------------------------
	void getUrlParameters(HttpServletRequest request) {
		_xml = request.getParameter("xml");
		_template = request.getParameter("template");
		_repFormat = nvl(request.getParameter("_xf"), "pdf");

		// switch excel format name, all other format names are
		// supported
		if (_repFormat.equals("Excel"))
			_repFormat = "xls";
	}

	// ----------------------------------------------------
	// output an error string
	// ----------------------------------------------------
	void showError(String msg) throws IOException {
		_out.write("<h3>Error: ".getBytes());
		_out.write(msg.getBytes());
		_out.write("</h3>".getBytes());
	}

	// ----------------------------------------------------
	// generate the report, merge xml stream with
	// ----------------------------------------------------
	@SuppressWarnings({ "rawtypes", "unchecked" })
	void generateReport() throws IOException, ServletException {
		JasperReport jasperReport = null;
		JasperPrint jasperPrint = null;
		JRAbstractExporter<ReportExportConfiguration, ExporterConfiguration, ExporterOutput, JRExporterContext> exporter = null;

		String reportsDir = _repJRXMLFile.getParentFile().getAbsolutePath();

		// ----------------------------------------------------
		// compile report design into .jasper file
		// ----------------------------------------------------
		try {
			jasperReport = JasperCompileManager.compileReport(_repJRXMLFileName);
		} catch (JRException e) {
			e.printStackTrace();
		}

		Map<String, Object> reportParams = new HashMap<String, Object>();
		// add parameters to the reportParameters
		reportParams.put("BaseDir", reportsDir);

		// ----------------------------------------------------
		// set format specific parameters
		// ----------------------------------------------------
		if (_repFormat.equals("pdf")) {
			exporter = (JRAbstractExporter) new JRPdfExporter();
		}
		if (_repFormat.equals("rtf")) {
			exporter = (JRAbstractExporter) new JRRtfExporter();
		}
		if (_repFormat.equals("html")) {
			exporter = (JRAbstractExporter) new HtmlExporter();
			SimpleHtmlReportConfiguration configuration = new SimpleHtmlReportConfiguration();

			// exporter.setConfiguration(HtmlExporter.);
			/*
			 * exporter.setParameter( JRHtmlExporterParameter.IS_OUTPUT_IMAGES_TO_DIR,
			 * Boolean.TRUE); exporter.setParameter(JRHtmlExporterParameter.IMAGES_DIR_NAME,
			 * _baseDir + File.separator + "tmp");
			 * exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI,
			 * "/JasperReportsIntegration/tmp/");
			 * 
			 */

			exporter.setConfiguration(configuration);

			reportParams.put(JRParameter.IS_IGNORE_PAGINATION, Boolean.TRUE);
		}
		if (_repFormat.equals("xls")) {
			exporter = (JRAbstractExporter) new JRXlsExporter();
			SimpleXlsReportConfiguration configuration = new SimpleXlsReportConfiguration();

			configuration.setOnePagePerSheet(Boolean.FALSE);
			configuration.setIgnorePageMargins(Boolean.TRUE);
			configuration.setWhitePageBackground(Boolean.FALSE);
			configuration.setRemoveEmptySpaceBetweenRows(Boolean.TRUE);
			exporter.setConfiguration(configuration);

			reportParams.put(JRParameter.IS_IGNORE_PAGINATION, Boolean.TRUE);

		}

		// ----------------------------------------------------
		// Fill report using the xml datasource
		// ----------------------------------------------------
//		try {
//
//			ByteArrayInputStream str = new ByteArrayInputStream(_xml.getBytes("UTF-8"));
//			Document document = JRXmlUtils.parse(str);
//			reportParams.put(JRXPathQueryExecuterFactory.PARAMETER_XML_DATA_DOCUMENT, document);
//			reportParams.put(JRXPathQueryExecuterFactory.XML_DATE_PATTERN, "yyyy-MM-dd");
//			reportParams.put(JRXPathQueryExecuterFactory.XML_NUMBER_PATTERN, "#,##0.##");
//			reportParams.put(JRXPathQueryExecuterFactory.XML_LOCALE, Locale.ENGLISH);
//			reportParams.put(JRParameter.REPORT_LOCALE, Locale.US);
//
//			jasperPrint = JasperFillManager.fillReport(jasperReport, reportParams);
//
//		} catch (JRException e) {
//			e.printStackTrace(new PrintWriter(_out));
//		}

		// ----------------------------------------------------
		// generate the report
		// ----------------------------------------------------
		logger.info("export report");
		try {
			SimpleOutputStreamExporterOutput exporterOutput = new SimpleOutputStreamExporterOutput(_out);

			exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
			exporter.setExporterOutput(exporterOutput);

			// exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING,
			// urlCallInterface.repEncoding);
			exporter.exportReport();
		} catch (JRException e) {
			Utils.throwRuntimeException(e.getMessage());
		}
		_out.close();

	}

	// ----------------------------------------------------
	// init the servlet, set variables
	// ----------------------------------------------------
	void init(HttpServletRequest request, HttpServletResponse response) throws IOException {
		OutputStream out = response.getOutputStream();

		// set the physical directories
		_baseDir = getServletContext().getRealPath("/");
		_reportsDir = _baseDir + "/reports";

		_request = request;
		_response = response;
		_out = out;

		// get the parameters from the request and store them in
		// local variables
		getUrlParameters(request);

		_repName = "template";

		_xmlFileName = _baseDir + "/reports/" + "xml.dat";
		_repJRXMLFileName = _baseDir + "/reports/tmp/" + _repName + ".jrxml";

		// save xml and template to file
		saveToFile(_xml, _xmlFileName);
		saveToFile(_template, _repJRXMLFileName);

		_repJRXMLFile = new File(_xmlFileName);
	}

	// ----------------------------------------------------
	// asserts the input variables
	// ----------------------------------------------------
	void assertState() throws ServletException {
		// xml stream was given
		if (_xml == null)
			throw new ServletException("xml feed is empty");
		// template stream was given
		if (_template == null)
			throw new ServletException("template feed is empty");

		// must be valid template feed for JasperReports
		if (!_template.contains("<jasperReport"))
			throw new ServletException("template feed is not valid for JasperReports");
	}

	// ----------------------------------------------------
	// MAIN service function
	// ----------------------------------------------------
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// set initial content type if anything goes wrong
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");

		// DynamicJasperReport d=new DynamicJasperReport();
		// d.info();

		// ----------------------------------------------------
		// initialize the local variables
		// ----------------------------------------------------
		init(request, response);

		// ----------------------------------------------------
		// Assert input variables
		// - xml stream
		// - template file
		// ----------------------------------------------------
		assertState();

		// ----------------------------------------------------
		// generate Report
		// ----------------------------------------------------
		generateReport();
	}
}