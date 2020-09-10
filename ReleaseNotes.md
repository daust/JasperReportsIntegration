[//]: # (Infos about this file)
[//]: # (Markdown Syntax: https://guides.github.com/features/mastering-markdown/)

# Version 2.6.0

## Release Notes

* New features
  * FEATURE: #? - Updated the standalone application server to jetty-distribution-9.4.31.v20200723
* Bug fixes
  * BUG: #11 - ???
* Changed behaviour
  * 

## Patch files to be installed
...

----------------------------------------------------------------------------------
# Version 2.5.0

## Release Notes
* Moved to Github for Issue Tracking ( https://github.com/daust/JasperReportsIntegration ). Source code and files will be moved later. 
* Further details on the changes can be found here: https://github.com/daust/JasperReportsIntegration/issues
* New features
  * FEATURE: #1 - Upgrade to JasperReports 6.7.0
  * FEATURE: #9 - Ability to set Printjob name (programmatically)
  * FEATURE: #13 - Upgrade to JDBC libraries for Oracle 12 / 18.x
* Bug fixes
  * BUG: #12 - encryptPasswords throws exection
  * BUG: #11 - Issues with Glassfish
* Changed behaviour
  * The minimum requirement is now a Java JRE 8 because JasperReports requires this starting with release 6.6.0 ( https://sourceforge.net/projects/jasperreports/files/jasperreports/JasperReports%206.6.0/ ). See the change log at the bottom. 

You can also download the binaries for this pre-release here: http://www.opal-consulting.de/downloads/free_tools/JasperReportsIntegration/Beta-releases/2.5.0.1/

## Module Version Info:
- apex/f121_JasperReportsIntegration-Test_2.5.0.0  	: 2.5.0.0 => CHANGED
- sql/xlib_http    							        : 2.3.0.0 => not changed
- sql/xlib_jasperreports    					    : 2.5.0.0 => CHANGED
- webapp/JasperReportsIntegration.war			   	: 2.5.0.0 => CHANGED

----------------------------------------------------------------------------------
# Version 2.4.0 - 15.10.2017

## Release Notes

* Bug fixes
    * BUG: #3939 - Built-in report functions not working due to missing library jasperreports-functions-$version.jar
BUG: #3940 - printerDiagnostics abort when supported attribute values cannot be retrieved for category

FEATURE: #3707 - Upgrade to JasperReports 6.4.1
FEATURE: #3941 - Support for timeZones (report parameter REPORT_TIME_ZONE)
FEATURE: #3942 - test.jrxml - list of user objects removed - timeZone displayed

Module Version Info:
----------------------------------------------
- apex/f121_JasperReportsIntegration-Test_2.4.0.0  	: 2.4.0.0 => CHANGED
- sql/xlib_http    							        : 2.3.0.0 => not changed
- sql/xlib_jasperreports    					    : 2.4.0.0 => CHANGED
- webapp/JasperReportsIntegration.war			   	: 2.4.0.0 => CHANGED

Version 2.3.0 - 05.10.2015
====================================================================================
BUG: #294 - Fix chunked encoding problem in xlib_http.get_report

FEATURE: #298 - Java runtime version and JasperReports version now included in J2ee homepage / index.jsp
FEATURE: #299 - Changed implementation for format "html": deprecated JRHtmlExporter replaced with HtmlExporter
FEATURE: #300 - Upgrade from JDK 1.4 to JDK 1.6
FEATURE: #673 - Upgrade to JasperReports version 6.1.1
FEATURE: #674 - Security: Change Test Application - user objects are no longer displayed
FEATURE: #675 - Update API calls (some are deprecated)
FEATURE: #676 - Resolve local files with relative file paths, i.e. images in the same directory as the report itself
FEATURE: #678 - Security: Encrypt password in application.properties file
FEATURE: #680 - Security: Move default folder to WEB-INF
FEATURE: #684 - Security: disable j2ee info and test page (as a configurable parameter)
FEATURE: #689 - Set initial log level to INFO for classes de.oc.* from ALL
FEATURE: #692 - Setup-script to change the setting for the config-directory in the JasperReportsIntegration.war file

Module Version Info:
----------------------------------------------
- apex/f121_JasperReportsIntegration-Test_2.3.0.1  	: 2.3.0.1 => CHANGED
- sql/xlib_http    									: 2.3.0.0 => CHANGED
- sql/xlib_jasperreports    						: 2.3.0.0 => CHANGED
- webapp/JasperReportsIntegration.war				: 2.3.0.1 => CHANGED

Version 2.1.0 - 13.05.2013
==================================================================
*) 2.1.0: REQ-00025 (SYSTEM): Support for JasperReports 5.1.0
*) 2.1.0: REQ-00026 (SYSTEM): Add configuration of web.xml parameter for location of config files
*) 2.1.0: REQ-00028 (SYSTEM): html2 format for using the new HTMLExporter in JasperReports 5.0
*) 2.1.0: REQ-00030 (CHANGE): tunnel images for html reports through the database
