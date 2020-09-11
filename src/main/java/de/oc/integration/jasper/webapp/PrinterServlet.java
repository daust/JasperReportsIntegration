package de.oc.integration.jasper.webapp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.print.DocFlavor;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.attribute.Attribute;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import de.oc.utils.Utils;

/**
 * Servlet implementation class PrinterServlet
 */
public class PrinterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(PrinterServlet.class
			.getName());
	private static final String CONTENT_TYPE = "text/html; charset=windows-1252";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PrinterServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		logger.info("doGet() - start");

		response.setContentType(CONTENT_TYPE);

		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>Printer diagnostics</title></head>");
		out.println("<body>");
		out.println("<h3>Printer Diagnostics</h3>");

		PrintRequestAttributeSet pras = new HashPrintRequestAttributeSet();
		// choose tray
		// pras.add((Attribute) MediaTray.MAIN);
		// set number of copies
		// pras.add(new Copies(1));

		PrintService pss[] = PrintServiceLookup.lookupPrintServices(
				DocFlavor.INPUT_STREAM.AUTOSENSE, pras);

		if (pss.length == 0) {
			Utils.throwRuntimeException("No printer service available");

		}

		// int selectedService = 0;
		logger.info("Available printer:");
		for (int i = 0; i < pss.length; i++) {

			out.println("available printers: " + pss[i] + " / " + pss[i].getName());
			out.println("<br>ID: " + i);
			
			logger.info(" - " + pss[i].getName());
			printPrintServiceAttributesAndDocFlavors(pss[i]);

			// if(pss[i].getName().equals("HP LaserJet 5")){ // choose
			// Druckers 'HP LaserJet'
			// selectedService = i;
			// }
		}

		out.println("</body></html>");
		out.close();

		logger.info("doGet() - end");
	}

	/**
	 * 
	 * @param request the request 
	 * @param response the response
	 * 
	 * @throws ServletException default
	 * @throws IOException default
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	@SuppressWarnings("unchecked")
	private void printPrintServiceAttributesAndDocFlavors(PrintService prserv) {
		String s1 = null, s2;
		String msg;
		Attribute[] prattr = prserv.getAttributes().toArray();
		DocFlavor[] prdfl = prserv.getSupportedDocFlavors();
		@SuppressWarnings("rawtypes")
		Class[] attributeCategories = prserv.getSupportedAttributeCategories();

		// print service attributes
		if (null != prattr && 0 < prattr.length)
			for (int i = 0; i < prattr.length; i++) {
				msg = "      PrintService-Attribute[" + i + "]: "
						+ prattr[i].getName() + " = " + prattr[i];
				logger.info("   - " + msg);
			}

		// supported document flavors
		if (null != prattr && 0 < prattr.length)
			for (int i = 0; i < prattr.length; i++) {
				msg = "      PrintService-Attribute[" + i + "]: "
						+ prattr[i].getName() + " = " + prattr[i];
				logger.info("   - " + msg);
			}

		// print service doc-flavor-mime-types
		if (null != prdfl && 0 < prdfl.length)
			for (int i = 0; i < prdfl.length; i++) {
				s2 = prdfl[i].getMimeType();
				if (null != s2 && !s2.equals(s1)) {
					msg = "      PrintService-DocFlavor-Mime[" + i + "]: " + s2;
					logger.info("   - " + msg);

				}
				s1 = s2;
			}

		// attribute categories
		for (int i = 0; i < attributeCategories.length; i++) {
			msg = "      Category[" + i + "]: "
					+ attributeCategories[i].getName() + " = "
					+ attributeCategories[i]
					+ "; DEFAULT: " + prserv.getDefaultAttributeValue(attributeCategories[i]);
			logger.info("   - " + msg);
			
			Object valueObject = prserv.getSupportedAttributeValues(attributeCategories[i], null, null);
			if(valueObject.getClass().isArray()) {
				Object[] values = (Object[]) valueObject;
				for (int j=0; j<values.length; j++){
					logger.info("     supported value(s): " + values[j].toString());
				}
			} else {
				logger.info("     supported values: " + valueObject.toString());
			}
		}

	}
	
	
}
