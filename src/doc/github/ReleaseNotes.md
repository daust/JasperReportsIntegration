[//]: # (Infos about this file)
[//]: # (Markdown Syntax: https://guides.github.com/features/mastering-markdown/)

# Version 2.9.0 (release: 05.06.2022)

You can see the full list of issues with details in the [milestones page](https://github.com/daust/JasperReportsIntegration/milestone/9?closed=1). 
 
## New features
  * #101 PDF encryption (with password), see [the section on integration and usage](https://github.com/daust/JasperReportsIntegration/blob/main/src/doc/github/integration-usage.md) for details.
  * #109 ``ipAddressesAllowed`` is now available for each data source, not only globally.
  * #94 Suppressing debug information on the webpage. By default, the application is more secure. All error messages will be suppressed on the webpage. You can still see them in the server logs. And you can activate it in the ``application.properties`` file. The setting is ``printDebugToScreen`` in the section ``[application]``. 
  * #102 Upgrade to jasperreports-libraries 6.19.1

## Bug fixes
  * #111 Unable to generate .csv file. PDF and xlsx work fine bug. Saving (csv and rtf) files on the server did not work.
  * #108 Error deploying on Wildfly application server
  * #107 Java 11 compatibility => Error de.oc.jasper.ReportUtilities.(ReportUtilities.java:32). The application has been tested with Java 11. 

## Changed behaviour
  * By default, all error messages will be suppressed. You can activate the setting for development environments through the ``application.properties`` file. The setting is ``printDebugToScreen`` in the section ``[application]``. 

## Deprecated features (still available but will go away eventually)
  * *none*

## Obsoleted features (no longer available)
  * *none*

## Known issues
  * Please check the current list of open issues: https://github.com/daust/JasperReportsIntegration/issues. 
  * For running the application on Tomcat10, you have to use ``jri-2.9.0-jasper-6.19.1-tomcat10.war`` instead of ``jri.war``.

# Version 2.8.1 (release: 10.02.2022)

You can see the full list of issues with details in the [milestones page](https://github.com/daust/JasperReportsIntegration/milestone/10?closed=1). 
 
## New features
  * *none*

## Bug fixes
  * #98 reportsPath: default value and relative paths (../reports or ..\\reports) don't work

## Changed behaviour
  * *none*

## Deprecated features (still available but will go away eventually)
  * *none*

## Obsoleted features (no longer available)
  * *none*

## Known issues
  * Please check the current list of open issues: https://github.com/daust/JasperReportsIntegration/issues. 
  * For running the application on Tomcat10, you have to use ``jri-2.8.1-jasper-6.18.1-tomcat10.war`` instead of ``jri.war``.

# Version 2.8.0 (release: 09.02.2022)

You can see the full list of issues with details in the [milestones page](https://github.com/daust/JasperReportsIntegration/milestone/8?closed=1). 
 
## New features
  * #93 Upgrading log4j 1.x to log4j 2.x (2.17.1)
  * #84 Variable for report path
    - You can now specify a list of report locations like a search path
  * #79 ``XLIB_HTTP.http_version_1_0`` was outdated and is upgraded to 1.1 and implemented as an optional parameter. You can downgrade to 1.0 if this is needed. 
  * #82 Unable to start JRI with tomcat 10. Tomcat changed in release 10 some of the library packages: https://tomcat.apache.org/migration-10.html#Specification_APIs. I will continue to develop using the old packages and create a modified ``jri.war`` file just for Tomcat10, e.g. ``jri-2.8.0-jasper-6.18.1-tomcat10.war``. 
  * #70 Upgrade Oracle JDBC libraries to 21.4.0.0.1
  * #90 Upgrade spring boot libraries. For security reasons, we include a higher version of the spring boot libraries. 
  * #80 Upgrade to JasperReportsLibraries 6.18.1

## Bug fixes
  * #96 Connection pool error when session is killed on server, now reconnects gracefully
  * #77 Documentation fix
  * #76 Adding XLIB_JASPERREPORTS_IMG to the _remove_user.sql. Fixed the deinstall script.
  * #69 Timeout issue when connecting to cloud database. Oracle notification services ons.jar are now removed from the build. 


## Changed behaviour
  * #79 By default, all http requests are now done using ``XLIB_HTTP.http_version_1_1``. If this causes issues in your application, you can downgrade to 1.0. It is a new optional parameter in ``xlib_jasperreports.show_report`` and ``xlib_jasperreports.get_report``

## Deprecated features (still available but will go away eventually)
  * *none*

## Obsoleted features (no longer available)
  * *none*

## Known issues
  * Please check the current list of open issues: https://github.com/daust/JasperReportsIntegration/issues. 
  * For running the application on Tomcat10, you have to use ``jri-2.8.0-jasper-6.18.1-tomcat10.war`` instead of ``jri.war``.

# Version 2.7.1 (release: 14.12.2021)

You can see the full list of issues with details in the [milestones page](https://github.com/daust/JasperReportsIntegration/milestone/7?closed=1). 
 
## New features
  * *none*

## Bug fixes / Security fixes
  * #87 - (CVE-2021-44228) Security warning: New zero-day in the Log4j Java library

## Changed behaviour
  * *none*

## Deprecated features (still available but will go away eventually)
  * *none*

## Obsoleted features (no longer available)
  * *none*

## Known issues
  * Please check the current list of open issues: https://github.com/daust/JasperReportsIntegration/issues. 


# Version 2.7.0 (release: 18.11.2020)

You can see the full list of issues with details in the [milestones page](https://github.com/daust/JasperReportsIntegration/milestone/5?closed=1). 

## New features
  * #66 - Uptake JasperReports Library 6.16.0
  * #26 - Connecting to ATP Database
  * #63 - Optimization for developers - adding your own .jar files

## Bug fixes
  * *none*

## Changed behaviour
  * *none*

## Deprecated features (still available but will go away eventually)
  * *none*

## Obsoleted features (no longer available)
  * *none*

## Known issues
  * Please check the current list of open issues: https://github.com/daust/JasperReportsIntegration/issues. 

# Version 2.6.2 (release: 14.10.2020)

This release contains a number of fixes that came up after the release 2.6.1. 

You can see the full list of issues with details in the [milestones page](https://github.com/daust/JasperReportsIntegration/milestone/6?closed=1). 

## New features
  * #52 - Uptake JasperReports Library 6.15.0

## Bug fixes
  * #57 - Invalid character found in the request target. The valid characters are defined in RFC 7230 and RFC 3986
  * #53 - Documentation bugs 
  * #55 - Barcodes produce classnotfounderror
  * #54 - Timeout value from default table not working
  * #51 - Batch files on Windows throw error: main class not found

## Changed behaviour
  * *none*

## Deprecated features (still available but will go away eventually)
  * *none*

## Obsoleted features (no longer available)
  * *none*

## Known issues
  * Please check the current list of open issues: https://github.com/daust/JasperReportsIntegration/issues . 


# Version 2.6.1 (release: 03.10.2020)

*(version 2.6.1 includes all changes from 2.6.0 as well)*

With this release, the full source code is published on github and can be used freely. The build process is now implemented using ``gradle`` instead of ``ant``. Also, it is now a lot easier to upgrade the integration with the newest jasperreports libraries. It can be done just using a configuration parameter and running the gradle build process. 

You can see the full list of issues with details in the [milestones page](https://github.com/daust/JasperReportsIntegration/milestone/4?closed=1). 

## New features
  * #30 - Update the standalone application server to jetty-distribution-9.4.31.v20200723
  * #17 - Wrong ojdbc library used causing connection failure
  * #30 - Upgrade jasperreports libraries to current version 6.14.0
  * #7 - Update documentation
  * #40 - APEX 20.1 security bundle (PSE 30990551) rejects response header "Cache-Control: private"
  * #2 - Deploying .jrxml and / or .jasper files
  * #45 - Update APEX test application (new and updated design for APEX 19.1)
  * #44 - Store defaults for url and wallet in configuration table

## Bug fixes
  * #20 - When using jasper report Integration sessions are not closed propperly bug
  * #28 - error connection database on 2.5.0.1
  * other changes (2.6.1): 
    - added missing libraries to the build process and the release: 
      - jasperreports-chart-customizers-6.14.0.jar
      - jasperreports-chart-themes-6.14.0.jar
      - jasperreports-fonts-6.14.0.jar
      - jasperreports-functions-6.14.0.jar
    - removed legacy html documentation, replaced with link to specific version on github, e.g. https://github.com/daust/JasperReportsIntegration/tree/v2.6.1

## Changed behaviour
  * *none*

## Known issues
  * *none*

# Version 2.6.0 (pre-release: 14.09.2020)

With this release, the full source code is published on github and can be used freely. The build process is now implemented using ``gradle`` instead of ``ant``. Also, it is now a lot easier to upgrade the integration with the newest jasperreports libraries. It can be done just using a configuration parameter and running the gradle build process. 

## New features
  * #30 - Update the standalone application server to jetty-distribution-9.4.31.v20200723
  * #17 - Wrong ojdbc library used causing connection failure
  * #30 - Upgrade jasperreports libraries to current version 6.14.0

## Bug fixes
  * #20 - When using jasper report Integration sessions are not closed propperly bug
  * #28 - error connection database on 2.5.0.1

## Changed behaviour
  * *none*

## Known issues
  * When contributing as a developer, the integration with eclipse still has issues, some libraries are included redundantly and are causing errors. 
  * The command line ``setConfigDir`` is currently not working. You can use the environment variable ``OC_JASPER_CONFIG_HOME`` as an alternative or manually edit the file using these commands: 
  ```
  // copy web.xml file from JasperReportsIntegration.war file
  java -jar ../lib/truezip-samples-7.7.10-jar-with-dependencies.jar cp ../webapp/JasperReportsIntegration.war/WEB-INF/web.xml web.xml

  ... now edit the web.xml file and modify the parameter oc.jasper.config.home: 

     	<!-- optionally define the oc.jasper.config.home --> 
   	<context-param>
     	<param-name>oc.jasper.config.home</param-name>
     	<param-value></param-value>
     	<!-- Examples: 
     	<param-value>/Users/daust/oc-jasper</param-value> 
     	<param-value>D:\\JasperReportsIntegration</param-value> 
     	-->
   	</context-param>

  // copy local file web.xml into the JasperReportsIntegration.war file
  java -jar ../lib/truezip-samples-7.7.10-jar-with-dependencies.jar cp web.xml ../webapp/JasperReportsIntegration.war/WEB-INF/web.xml
  ```

# Version 2.5.0 (Pre-release: 30.09.2018)

* Moved to Github for Issue Tracking ( https://github.com/daust/JasperReportsIntegration ). Source code and files will be moved later. 
* Further details on the changes can be found here: https://github.com/daust/JasperReportsIntegration/issues

## New features
  * FEATURE: #1 - Upgrade to JasperReports 6.7.0
  * FEATURE: #9 - Ability to set Printjob name (programmatically)
  * FEATURE: #13 - Upgrade to JDBC libraries for Oracle 12 / 18.x

## Bug fixes
  * BUG: #12 - encryptPasswords throws exection
  * BUG: #11 - Issues with Glassfish

## Changed behaviour
  * The minimum requirement is now a Java JRE 8 because JasperReports requires this starting with release 6.6.0 ( https://sourceforge.net/projects/jasperreports/files/jasperreports/JasperReports%206.6.0/ ). See the change log at the bottom. 

You can also download the binaries for this pre-release here: http://www.opal-consulting.de/downloads/free_tools/JasperReportsIntegration/Beta-releases/2.5.0.1/

## Module Version Info:
- apex/f121_JasperReportsIntegration-Test_2.5.0.0  	: 2.5.0.0 => CHANGED
- sql/xlib_http    							        : 2.3.0.0 => not changed
- sql/xlib_jasperreports    					    : 2.5.0.0 => CHANGED
- webapp/JasperReportsIntegration.war			   	: 2.5.0.0 => CHANGED



# Version 2.4.0 - 15.10.2017

## New features
* FEATURE: #3707 - Upgrade to JasperReports 6.4.1
* FEATURE: #3941 - Support for timeZones (report parameter REPORT_TIME_ZONE)
* FEATURE: #3942 - test.jrxml - list of user objects removed - timeZone displayed

## Bug fixes
* BUG: #3939 - Built-in report functions not working due to missing library jasperreports-functions-$version.jar
* BUG: #3940 - printerDiagnostics abort when supported attribute values cannot be retrieved for category

## Module Version Info:
- apex/f121_JasperReportsIntegration-Test_2.4.0.0  	: 2.4.0.0 => CHANGED
- sql/xlib_http    							        : 2.3.0.0 => not changed
- sql/xlib_jasperreports    					    : 2.4.0.0 => CHANGED
- webapp/JasperReportsIntegration.war			   	: 2.4.0.0 => CHANGED


# Version 2.3.0 - 05.10.2015

## New features
* FEATURE: #298 - Java runtime version and JasperReports version now included in J2ee homepage / index.jsp
* FEATURE: #299 - Changed implementation for format "html": deprecated JRHtmlExporter replaced with HtmlExporter
* FEATURE: #300 - Upgrade from JDK 1.4 to JDK 1.6
* FEATURE: #673 - Upgrade to JasperReports version 6.1.1
* FEATURE: #674 - Security: Change Test Application - user objects are no longer displayed
* FEATURE: #675 - Update API calls (some are deprecated)
* FEATURE: #676 - Resolve local files with relative file paths, i.e. images in the same directory as the report itself
* FEATURE: #678 - Security: Encrypt password in application.properties file
* FEATURE: #680 - Security: Move default folder to WEB-INF
* FEATURE: #684 - Security: disable j2ee info and test page (as a configurable parameter)
* FEATURE: #689 - Set initial log level to INFO for classes de.oc.* from ALL
* FEATURE: #692 - Setup-script to change the setting for the config-directory in the JasperReportsIntegration.war file

## Bug fixes
* BUG: #294 - Fix chunked encoding problem in xlib_http.get_report

## Module Version Info:
- apex/f121_JasperReportsIntegration-Test_2.3.0.1  	: 2.3.0.1 => CHANGED
- sql/xlib_http    									: 2.3.0.0 => CHANGED
- sql/xlib_jasperreports    						: 2.3.0.0 => CHANGED
- webapp/JasperReportsIntegration.war				: 2.3.0.1 => CHANGED

# Version 2.1.0 - 13.05.2013
* 2.1.0: REQ-00025 (SYSTEM): Support for JasperReports 5.1.0
* 2.1.0: REQ-00026 (SYSTEM): Add configuration of web.xml parameter for location of config files
* 2.1.0: REQ-00028 (SYSTEM): html2 format for using the new HTMLExporter in JasperReports 5.0
* 2.1.0: REQ-00030 (CHANGE): tunnel images for html reports through the database
