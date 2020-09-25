<%@page import="de.oc.integration.jasper.webapp.AppConfig"%>
<%@page import="de.oc.db.DataSourceDefinition"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="net.sf.jasperreports.engine.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="de.oc.*"%>

<%!// variable declaration in the class
	AppConfig appConfig = AppConfig.getInstance();%>
<%
	// script
	// validate configuration, has the config file been changed since last time?
	appConfig.validateConfiguration(application);

    // #684 - Security: disable j2ee info and test page (as a configurable parameter)
    if (!appConfig.infoPageIsEnabled){
    	response.sendError ( HttpServletResponse.SC_FORBIDDEN, "JasperReportsIntegration: This page is protected. The info page has been disabled in the application.properties file. " );	
    }
    // #37 Security: Whitelisting of ip addresses to access the /JasperReportsIntegration service
    if (!appConfig.isIpAddressAllowed(request.getRemoteAddr())){
    	response.sendError ( HttpServletResponse.SC_FORBIDDEN, "You are not allowed to access th." );	
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JasperReportsIntegration - Index</title>

<link rel=StyleSheet href="JasperReportsIntegration.css" type="text/css">

</head>
<body>
	<h1>JasperReportsIntegration-@project.version@-@jasperreports.version@</h1>
	<h2>Configuration Info</h2>
	<ul>
		<li>The current configuration is loaded from: <span
			style="font-family: Consolas, Arial; font-weight: bold;"><%= appConfig.getConfigHomeDir() %></span></li>
		<li>Config-Directory: <span
			style="font-family: Consolas, Arial; font-weight: bold;"><%= appConfig.getConfigDir() %></span></li>
		<li>Config-File: <span
			style="font-family: Consolas, Arial; font-weight: bold;"><%= appConfig.getApplicationPropertiesFileName() %></span></li>
		<li>Reports-Directory: <span
			style="font-family: Consolas, Arial; font-weight: bold;"><%= appConfig.getReportsDir() %></span></li>
		<li>Temp-Directory: <span
			style="font-family: Consolas, Arial; font-weight: bold;"><%= appConfig.getTmpDir() %></span></li>
		<li>Logs-Directory: <span
			style="font-family: Consolas, Arial; font-weight: bold;"><%= appConfig.getLogsDir() %></span></li>
		<li>Java-Runtime-Version: <span
			style="font-family: Consolas, Arial; font-weight: bold;"><%=  System.getProperty("java.version") %></span></li>
		<li>JasperReports-Version: <span
			style="font-family: Consolas, Arial; font-weight: bold;"><%=  JasperCompileManager.class.getPackage().getImplementationVersion() %></span></li>
		<li>Your ip address: <span
			style="font-family: Consolas, Arial; font-weight: bold;"><%=  request.getRemoteAddr() %></span></li>
	</ul>
	
	<h2>Documentation</h2>
	
	<p>The online documentation can be accessed <a href="https://github.com/daust/JasperReportsIntegration/blob/v@project.version@/README.md" target="_new">on GitHub</a>.  </p>

	<p>The included (LEGACY) documentation can be accessed <a href="doc/Index-Local.html" target="_new">here</a>.  </p>

	<h2>Basic connectivity tests</h2>
	
	<p>The following data sources have been detected: </p>
		<table border="0" class="newspaper-b">
		<thead>
			<tr>
				<th class="center">Data Source</th>
				<th class="center">Type</th>
				<th class="center">Basic Connectivity Test</th>
			</tr>
		</thead>
		<%
		 	Iterator<Map.Entry<String,DataSourceDefinition>> it = appConfig.getDataSources().entrySet().iterator();

			while (it.hasNext()) {

				Map.Entry<String,DataSourceDefinition> entry = (Map.Entry<String,DataSourceDefinition>) it.next();
				String dsName = (String) entry.getKey();
				DataSourceDefinition ds = (DataSourceDefinition) entry.getValue();
				out.write("<tr><td>"+ ds.name +"</td>");
				out.write("<td>"+ ds.type +"</td>");
				out.write("<td><a target=\"_new\" href=\"test?_dataSource="+ ds.name + "\">Test</a></td></tr>");
				
				
				//System.out.println("key,val: " + key + "," + val);
			}
		%>
		<tr>
			<td></td><td></td><td></td>
		</tr>		
	</table> 
	
	<h2>Basic report tests</h2>

	<form name="frmMain" method="get" action="report" target="_blank">

		<!-- ================================================================ -->
		<!-- Report Tester -->
		<!-- ================================================================ -->

		<table border="0" class="newspaper-b">
			<thead>
				<tr>
					<th>Parameter</th>
					<th>Value</th>
					<th>Description</th>
					<th class="center" nowrap>Default Value</th>
					<th class="center">Required?</th>
				</tr>
			</thead>
			<tr>
				<td colspan="5" class="heading"><input type="submit"
					value="Test Report"></td>
			</tr>

			<tr>
				<td colspan="5" class="heading">Basic Settings</td>
			</tr>


			<tr>
				<td>_repName</td>
				<td><input name="_repName" type="text" id="_repName"
					value="test"></td>
				<td>specifies the report name, e.g. &quot;test&quot; or
					&quot;demo/test2&quot; (use &quot;/&quot; for specifying a
					subdirectory&quot;)</td>
				<td class="center">test</td>
				<td class="center">X</td>
			</tr>
			<tr>
				<td>_repFormat</td>
				<td><select name="_repFormat" id="_repFormat">
						<option value="pdf" selected>pdf</option>
						<option value="rtf">rtf</option>
						<option value="docx">docx</option>
						<option value="xls">xls</option>
						<option value="xlsx">xlsx</option>
						<option value="csv">csv</option>
						<option value="pptx">pptx</option>
						<option value="html">html (JRHtmlExporter)</option>
						<option value="html2">html2 (new HTMLExporter 5.0)</option>
				</select></td>
				<td>the report format, e.g. pdf, html, html2, rtf, xls, jxl,
					csv</td>
				<td class="center">pdf</td>
				<td class="center">X</td>
			</tr>
			<tr>
				<td>_dataSource</td>
				<td><input name="_dataSource" type="text" id="_dataSource"
					value="default"></td>
				<td>entry from the context.xml file, e.g. test, default, test2</td>
				<td class="center">default</td>
				<td class="center">X</td>
			</tr>
			<tr>
				<td>_outFilename</td>
				<td><input name="_outFilename" type="text" id="_outFilename">
				</td>
				<td>a filename can be specified for the download for the "save
					as" dialog</td>
				<td class="center"></td>
				<td class="center"></td>
			</tr>
			<tr>
				<td>_repLocale</td>
				<td><select name="_repLocale" id="_repLocale">
						<option value="" selected="selected"></option>
						<option value="de_DE">de_DE</option>
						<option value="en_US">en_US</option>
				</select></td>
				<td><p>
						Locale string, composed of the <br /> <a
							href="http://www.ics.uci.edu/pub/ietf/http/related/iso639.txt"
							target="_blank">ISO language code</a> and <br /> <a
							href="http://www.chemie.fu-berlin.de/diverse/doc/ISO_3166.html"
							target="_blank">ISO country code</a>
					</p></td>
				<td class="center">de_DE</td>
				<td class="center"></td>
			</tr>
			<tr>
				<td>_repEncoding</td>
				<td><select name="_repEncoding" id="_repEncoding">
						<option value="" selected="selected"></option>
						<option value="ISO-8859-1">ISO-8859-1</option>
						<option value="ISO-8859-15">ISO-8859-15</option>
						<option value="UTF-8">UTF-8</option>
						<option value="Windows-1252">Windows-1252</option>
				</select></td>
				<td><p>
						the &quot;charset&quot; parameter for the content_type, a list of
						valid entries can be found <a
							href="http://www.iana.org/assignments/character-sets"
							target="_blank">here</a>. <br /> E.g.: ISO-8859-15, UTF-8,
						Windows-1252
					</p></td>
				<td class="center">UTF-8</td>
				<td class="center">X</td>
			</tr>
			<tr>
				<td>_repTimeZone</td>
				<td><select name="_repTimeZone" id="_repTimeZone">
						<option value="" selected="selected"></option>
						<option value="Europe/Berlin">Europe/Berlin</option>
						<option value="Europe/London">Europe/London</option>
						<option value="US/Central">US/Central</option>
						<option value="Etc/Universal">Etc/Universal</option>
				</select></td>
				<td><p>
						the &quot;time zone&quot; parameter for the execution of the
						report, a list of valid entries can be found <a
							href="https://en.wikipedia.org/wiki/List_of_tz_database_time_zones"
							target="_blank">here</a>. <br /> E.g.: Europe/Berlin, UCT,
						US/Central, US/Pacific, Etc/Greenwich, Europe/London
					</p></td>
				<td class="center">default provided by Java runtime environment
					on server</td>
				<td class="center"></td>
			</tr>

			<!-- ================================================================ -->
			<!-- Direct Printing -->
			<!-- ================================================================ -->

			<tr>
				<td colspan="5" class="heading">Direct Printing</td>
			</tr>
			<tr>
				<td>_printIsEnabled</td>
				<td><select name="_printIsEnabled" id="_printIsEnabled">
						<option value="" selected="selected"></option>
						<option value="false">false</option>
						<option value="true">true</option>
				</select></td>
				<td>Report shall be sent directly to a printer?</td>
				<td class="center">false</td>
				<td class="center"></td>
			</tr>

			<tr>
				<td>_printPrinterName</td>
				<td><input name="_printPrinterName" type="text"
					id="_printPrinterName"></td>
				<td>name of the locally installed printer on the J2EE server.
					You can get a list of installed printers here: <a
					href="printerDiagnostics.jsp" target="_new">PrinterDiagnostics</a>
				</td>
				<td class="center"></td>
				<td class="center">X</td>
			</tr>

			<tr>
				<td>_printJobName</td>
				<td><input name="_printJobName" type="text"
					id="_printJobName"></td>
				<td>name of the print job as displayed in the printer queue</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>_printPrinterTray</td>
				<td><input name="_printPrinterTray" type="text"
					id="_printPrinterTray"></td>
				<td>name of the locally installed printer on the J2EE server.
					You can get a list of installed printers and trays here: <a
					href="printerDiagnostics.jsp" target="_new">PrinterDiagnostics</a>
				</td>
				<td class="center"></td>
				<td class="center">X</td>
			</tr>

			<tr>
				<td>_printCopies</td>
				<td><input name="_printCopies" type="text" id="_printCopies"></td>
				<td>Number of copies</td>
				<td class="center">1</td>
				<td class="center"></td>
			</tr>

			<tr>
				<td>_printDuplex</td>
				<td><select name="_printDuplex" id="_printDuplex">
						<option value="" selected="selected"></option>
						<option value="false">false</option>
						<option value="true">true</option>
				</select></td>
				<td>Use printer in duplex mode?</td>
				<td class="center">false</td>
				<td class="center"></td>
			</tr>

			<tr>
				<td>_printCollate</td>
				<td><select name="_printCollate" id="_printCollate">
						<option value="" selected="selected"></option>
						<option value="false">false</option>
						<option value="true">true</option>
				</select></td>
				<td>Sort output when printing multiple copies?</td>
				<td class="center">false</td>
				<td class="center"></td>
			</tr>

			<!-- ================================================================ -->
			<!-- Save File on Server -->
			<!-- ================================================================ -->
			<tr>
				<td colspan="5" class="heading">Save File on Server</td>
			</tr>
			<tr>
				<td>_saveIsEnabled</td>
				<td><select name="_saveIsEnabled" id="_saveIsEnabled">
						<option value="" selected="selected"></option>
						<option value="false">false</option>
						<option value="true">true</option>
				</select></td>
				<td>Save the generated file on the server as well?</td>
				<td class="center">false</td>
				<td class="center"></td>
			</tr>

			<tr>
				<td>_saveFileName</td>
				<td><input name="_saveFileName" type="text" id="_saveFileName"></td>
				<td>Name of the file on the server</td>
				<td class="center"></td>
				<td class="center">X</td>
			</tr>

			<!-- ================================================================ -->
			<!-- Report Parameters -->
			<!-- ================================================================ -->
			<tr>
				<td colspan="3" class="heading">Report Parameters</td>
				<td class="center"></td>
				<td class="center"></td>
			</tr>
			<tr>
				<td>additional parameters</td>
				<td></td>
				<td>all parameters are passed directly to the report (excluding
					the the internal ones (prefixed with &quot;_&quot;). <b>Report
						parameters have to be specified as String in the JasperReports,
						all other data types are not supported.</b>
				</td>
				<td class="center"></td>
				<td class="center"></td>
			</tr>

			<tr>
				<td colspan="5" class="heading">Test Report</td>
			</tr>

			<tr>
				<td colspan="5" class="heading"><input type="submit"
					value="Test Report"></td>
			</tr>

		</table>

	</form>
	<p>
</body>
</html>
