<%@page import="de.oc.print.PrinterUtilities"%>
<%@page import="de.oc.integration.jasper.webapp.AppConfig"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.io.File"
	import="java.io.FilenameFilter" import="java.util.*" import="de.oc.*"
	import="javax.print.PrintService"
	import="javax.print.attribute.Attribute"%>

<%!// variable declaration in the class
	PrinterUtilities printerUtilities = new PrinterUtilities();
	ArrayList<?> printers = printerUtilities.getInstalledPrinters();
	AppConfig appConfig = AppConfig.getInstance();%>

<%
	// script
	// validate configuration, has the config file been changed since last time?
	appConfig.validateConfiguration(application);

	// #684 - Security: disable j2ee info and test page (as a configurable parameter)
	if (!appConfig.infoPageIsEnabled) {
		response.sendError(HttpServletResponse.SC_FORBIDDEN,
				"This page is protected.");
	}
    // #37 Security: Whitelisting of ip addresses to access the /JasperReportsIntegration service
    if (!appConfig.isIpAddressAllowed(request.getRemoteAddr())){
    	response.sendError ( HttpServletResponse.SC_FORBIDDEN, "You are not allowed to access th." );	
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>JasperReportsIntegration - Printer Diagnostics</title>
<link rel=StyleSheet href="JasperReportsIntegration.css" type="text/css">
<body>
	<h1>JasperReportsIntegration - Printer Diagnostics</h1>
	<p>This page lists the available printers on this server as well as
		their properties.</p>

	<!-- ================================================================ -->
	<!-- List the printers -->
	<!-- ================================================================ -->

	<h2>Printer Overview</h2>
	<table border="0" cellpadding="1" cellspacing="1" class="newspaper-b">
		<thead>
			<tr>
				<th>Printer Name</th>
			</tr>
		</thead>
		<%
			for (int i = 0; i < printers.size(); i++) {
				String printerName = ((PrintService) printers.get(i)).getName();
		%>
		<tr>
			<td><a href="#<%=printerName%>"><%=printerName%></a></td>
		</tr>
		<%
			}
		%>
	</table>

	<!-- ================================================================ -->
	<!-- List the printers - DETAILS -->
	<!-- ================================================================ -->

	<h2>Printer Details</h2>
	<%
		for (int i = 0; i < printers.size(); i++) {
			PrintService printService = (PrintService) printers.get(i);
			String printerName = printService.getName();
	%>
	<h3>
		<a name="<%=printerName%>"></a><jsp:expression>printerName</jsp:expression></h3>

	<!-- List the properties -->
	<h3>Properties</h3>
	<table class="newspaper-b">
		<thead>
			<tr>
				<th>Attribute</th>
				<th>Value</th>
			</tr>
		</thead>

		<%
			Attribute[] attributes = printService.getAttributes().toArray();

				// print service attributes
				for (int k = 0; k < attributes.length; k++) {
		%>
		<tr>
			<td><%=attributes[k].getName()%></td>
			<td><jsp:expression>attributes[k]</jsp:expression></td>
		</tr>
		<%
			}
		%>
	</table>

	<!-- List the properties -->
	<h3>Categories</h3>
	<table class="newspaper-b">
		<thead>
			<tr>
				<th>Category</th>
				<th>Default Value</th>
				<th>Supported Values</th>
			</tr>
		</thead>

		<%
				@SuppressWarnings("rawtypes")
				Class[] attributeCategories = printService
						.getSupportedAttributeCategories();

				// attribute categories
				for (int k = 0; k < attributeCategories.length; k++) {
		%>
		<tr>
			<td><%=attributeCategories[k].getName()%></td>
			<td>
				<%
					@SuppressWarnings("unchecked")
							Object attrValue = printService
									.getDefaultAttributeValue(attributeCategories[k]);
							out.println(attrValue);
				%>
			</td>
			<td>
				<%
							
							try {
								@SuppressWarnings("unchecked")
								Object valueObject = printService
										.getSupportedAttributeValues(
												attributeCategories[k], null, null);
								
								if (valueObject != null) {
									if (valueObject.getClass().isArray()) {
										Object[] values = (Object[]) valueObject;
										for (int j = 0; j < values.length; j++) {
											if (values[j] != null) {
												out.println(values[j].toString());
												out.println("<br>");
											}
										}
									} else {
										out.println(valueObject.toString());
										out.println("<br>");
									}

								}
								//throw new RuntimeException();
							} catch (Exception e) {
								out.println("<h3 style=\"color:red;\">Cannot list supported attribute values</h3>");
							}
				%>
			</td>
		</tr>
		<%
			}
		%>
	</table>

	<jsp:scriptlet>}</jsp:scriptlet><br>

	<!--  http://coding.smashingmagazine.com/2008/08/13/top-10-css-table-designs/ -->
	<br>



</body>
</html>
