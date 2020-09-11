package de.oc.integration.jasper.webapp;

/*
 $Id: Test.java 88 2017-10-15 21:25:31Z dietmar.aust $

 Purpose  : Tests for the JasperIntegration to be run on the J2EE container 

 $LastChangedDate: 2017-10-15 23:25:31 +0200 (So, 15 Okt 2017) $
 $LastChangedBy: dietmar.aust $ 

 Date        Version   Author          Comment
 -------------------------------------------------------------------------------------------
 05.08.2008  0.5.0.0   D. Aust         Initial creation
 08.04.2015  2.2.0.0   D. Aust 		   #684 - Security: disable j2ee info and test page (as a configurable parameter)

 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import de.oc.db.DBUtils;
import de.oc.utils.Utils;

public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CONTENT_TYPE = "text/html; charset=windows-1252";
	private static Logger logger = Logger.getLogger(Test.class.getName());

	/**
	 * 
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	/**
	 * 
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		logger.info("doGet() - start");
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		AppConfig appConfig = AppConfig.getInstance();
		// validate configuration, has the config file been changed since last time?
		appConfig.validateConfiguration(getServletContext());
		
	    // #684 - Security: disable j2ee info and test page (as a configurable parameter)
	    if (!appConfig.infoPageIsEnabled){
	    	response.sendError ( HttpServletResponse.SC_FORBIDDEN, "This page is protected." );	
	    }
		
		// extract all relevant url parameters from the url
		URLCallInterface urlCallInterface = new URLCallInterface(request);

		response.setContentType(CONTENT_TYPE);

		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<link rel=StyleSheet href=\"JasperReportsIntegration.css\" type=\"text/css\">");
		out.println("<head><title>test</title></head>");
		out.println("<body>");
		out.println("<h1>Basic connectivity test for dataSource="
				+ urlCallInterface.dataSource + "</h1>");

		try {
			conn = appConfig.getConnection(urlCallInterface.dataSource);
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select sys_context('userenv', 'session_user') session_user, "
					+ "       sys_context('userenv', 'current_user') parsing_user,"
					+ "       sys_context('userenv', 'instance_name') instance_name,"
					+ "       sys_context('userenv', 'db_name') db_name,"
					+ "       sys_context('userenv', 'server_host') server_host,"
					+ "       to_char(sysdate, 'dd.mm.yyyy hh24:mi:ss') curr_time"
					+ "  from dual");

			out.write("<h3>Session Info</h3><BR />");
			out.write("<table class=\"newspaper-b\">");
			out.write("<tr><th>Session User</th>"
					    + "<th>Parsing User</th>"
					    + "<th>Instance Name</th>"
					    + "<th>DB Name</th>"
					    + "<th>Server Host</th>"
					    + "<th>Current Time</th>"
					    + "</tr>");

			while (rs.next()) {

				out.write("<tr>");
				
				out.write("<td>" + rs.getString("SESSION_USER") + "</td>"
						+ "<td>" + rs.getString("PARSING_USER") + "</td>"
						+ "<td>" + rs.getString("INSTANCE_NAME") + "</td>"
						+ "<td>" + rs.getString("DB_NAME") + "</td>"
						+ "<td>" + rs.getString("SERVER_HOST") + "</td>"
						+ "<td>" + rs.getString("CURR_TIME") + "</td>"
						);
				
				out.write("</tr>");

			}
			out.write("</table>");

			// close handles
			stmt.close();
			rs.close();
			conn.close();			
			
		} catch (SQLException e) {
			Utils.throwRuntimeException("Error while selecting user objects: "
					+ e.getMessage());
		} finally {
			DBUtils.closeQuietly(conn, stmt, rs);
		}

		out.println("</body></html>");
		out.close();

		logger.info("doGet() - end");
	}

	/**
	 * @param request default
	 * @param response default 
	 * @throws ServletException default 
	 * @throws IOException default
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
