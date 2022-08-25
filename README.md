[//]: # (Infos about this file)
[//]: # (Markdown Syntax: https://guides.github.com/features/mastering-markdown/)
[//]: # (how to write a good readme for a github project: https://bulldogjob.com/news/449-how-to-write-a-good-readme-for-your-github-project)


<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=NH8MWBUXWQ73W&source=url"><img alt="Donate" border="0" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif"></a>

* [What is the JasperReportsIntegration?](#intro)
* [Related Projects](#relatedProjects)
* [Download](#download)
* [Installation](#install)
    * System Requirements
    * Quickstart
    * Installation
    * Upgrade
* [Integration and Usage](#integration)
* [Configuration](#configuration)
* [PL/SQL API](#plsql_api)
* [External Documentation / Training](#external_documentation_training)
* [Legacy Documentation](#legacy_documentation)
* [Change Log / Release Notes](#changelog)
* [Credit](#credit)
* [Contributing](#contribute)
* [License](#license)
* [FAQ/ Troubleshooting](#faq)
* [Support / Forum](#support)

# <a name="intro"></a> What is the JasperReportsIntegration?

JasperReportsIntegration provides an interface to use the [JasperReports reporting engine](https://community.jaspersoft.com/project/jasperreports-library) in an Oracle database application, specifically with Oracle Application Express (Oracle APEX). 

>"The JasperReports Library is the world's most popular open source reporting engine. It is entirely written in Java and it is able to use data coming from any kind of data source and produce pixel-perfect documents that can be viewed, printed or exported in a variety of document formats including HTML, PDF, Excel, OpenOffice and Word."

The main purpose is to provide a cost free alternative for high-fidelity printing / PDF generation with Oracle APEX. This integration kit allows to run JasperReports reports from within your Oracle APEX application. 

## How does it work?

This integration approach focuses on the integration with Jasper Reports, but is not limited to it. Using a generic URL-based approach, it can easily be extended to call any other reporting engine that provides a URL based interface for running reports, for example Oracle Reports, BIRT or Crystal Reports.

### What are the parts of the integration?

The integration kit consists of the following components:

* a J2EE application to call the specified report definition file, make a connection to the target database and return the generated report

    * This J2EE application (``jri.war``) is deployed in a standard J2EE container.
    
    * Also, all reports we want to use have to be copied to the J2EE server, so that they are accessible by the J2EE application. These Jasper Report definition files are usually created with the iReport designer or the newer Jaspersoft Studio, this is the most convenient way.
    
    * Finally, we need to configure the JNDI datasources in the J2EE server (or the ``application.properties`` file) to connect to our Oracle databases.

* a PL/SQL interface which can you can use in your application (package ``XLIB_JASPERREPORTS``)

    * This package essentially takes the parameters and constructs a URL for the J2EE application. This URL is then passed to the J2EE application via ``UTL_HTTP``. Once the report is run, it will return the report as a BLOB. This BLOB can be displayed immediately, stored in the database or sent via Email.

### Preparation

First of all, we need to design the report. The preferred method is to use the newer Jaspersoft Studio (https://community.jaspersoft.com/project/jaspersoft-studio/releases) to create the report definition file, but reports created with the older iReport designer will also work. We use a JDBC connection to connect to the target Oracle Schema and design the report. The report definition file is then copied into a specific directory on the J2EE server so that it can be used by the J2EE application .

Next we use the PL/SQL call interface in our APEX application to call the report and pass all required parameters to it.

### One roundtrip ...

Once the user invokes the report generation functionality (by clicking on a link or a button), usually a PL/SQL process is invoked to call the report, e.g.:

```
begin
  xlib_jasperreports.show_report (p_rep_name => :p5_rep_name,
                                  p_rep_format => :p5_rep_format,
                                  p_data_source => :p5_data_source,
                                  p_out_filename => :p5_out_filename,
                                  p_rep_locale => :p5_rep_locale,
                                  p_rep_encoding => :p5_rep_encoding,
                                  p_additional_params => :p5_additional_params);

  -- stop rendering of the current APEX page
  apex_application.g_unrecoverable_error := true;

exception
  when apex_application.e_stop_apex_engine then
    null; -- ok, stop engine raises exception, we can ignore that  
end;
```

This will result in a URL like ``http://localhost:8080/JasperReportsIntegration/report?_repName=test&_repFormat=pdf&_dataSource=default&_outFilename=myTest.pdf&_repLocale=de_DE&_repEncoding=UTF-8&p_deptno=10``

Within the J2EE server we have already defined a data source named ``default``. For example this could be the HR schema in our target database.

The J2EE application will use a JDBC connection from the connection pool to connect to the schema ``HR`` and run the report named ``test``.

Since the report format in our example is specified as PDF, the reporting engine will return a PDF document.

This PDF document will be returned as a BLOB and thus can be displayed directly in our application, stored in the database or sent via email.

# <a name="relatedProjects"></a> Related Projects

You might want to check out the project [JRI Publisher](https://davidghedini.com/jri-publisher/) which uses JasperReportsIntegration as the foundation and builds infrastructure around it. 

JRI Publisher is a Webmin module for installing, configuring, and managing JasperReportsIntegration.

JRI Publisher can serve as a stand-alone Oracle Reporting solution or to simply looking to get up and running quickly and easily with JasperReportsIntegration.

While JasperReportsIntegration was originally designed for Oracle APEX (and can be used for APEX), JRI Publisher does not require APEX or installation of the SQL Schema files. Thus it can be used with or without APEX. 

In addition to Oracle, JRI Publisher includes one-click JNDI support for PostgreSQL, MySQL, and SQL Server

JRI Publisher takes just a few minutes to install and has been tested on CentOS 7 and 8 and Ubuntu 18.

* [JRI Homepage](https://davidghedini.com/jri-publisher/)
* [JRI Documentation](https://jripub.davidghedini.com/)
* [JRI on GitHub](https://github.com/DavidGhedini/jri-publisher)

# <a name="download"></a>Download

Binary releases can be downloaded from [the releases folder](https://github.com/daust/JasperReportsIntegration/releases). There you can find the released binaries as well as pre-releases for testing in the field. 

The following naming convention will be used for the provided binaries: `JasperReportsIntegration-<project.version>-<jasperreportsVersion>.zip`.

Legacy releases (up until version 2.4) can be downloaded here: https://www.opal-consulting.de/downloads/free_tools/JasperReportsIntegration/

# <a name="install"></a>Installation

## System Requirements

The integration has no requirement on a specific operating system, it is widely used on Linux systems as well as on Windows. It is mainly developed on MacOS. 

* **Oracle Database Release**: The minimum requirement is the availability of the package ``UTL_HTTP``. Thus the integration will work with all Oracle versions in which Oracle APEX can be installed, even Oracle XE (10g).  

* **Oracle APEX Release**: The minimum release for the test application is APEX 4.2.  Aside from the test application there is no dependency on a specific Oracle APEX Release, therefore it should work with any Oracle APEX Release.

* **Disk Space**: 150 MB of disk space.

* **J2EE Server**: It is still compatible with the fairly old servlet specification 2.4 (Java JDK 1.8), thus the J2EE application should work in most J2EE servers, it even works with Apache Tomcat 5.5. See [Apache Tomcat Versions](https://tomcat.apache.org/whichversion.html) for details. 

## Quickstart

In order to get you up and running in the shortest amount of time you can use the included Jetty J2EE server in the download.
This is really useful for checking out the integration, for test and development environments. Typically in production environments, you can deploy it to your J2EE server of choice, i.e. Weblogic, Glassfish, Tomcat, etc. 

You can find the quickstart instructions [here](src/doc/github/installation-quickstart.md).

## <a name="install.installation"></a>Installation

You can find the complete installation instructions [here](src/doc/github/installation-full.md).

## Upgrade

If you are already using JasperReportsIntegration and simply want to upgrade it to the latest release, you can find the instructions [here](src/doc/github/installation-upgrade.md).

# <a name="integration"></a>Integration and Usage

You can find the instructions [here](src/doc/github/integration-usage.md).

# <a name="configuration"></a> Configuration

## <a name="configuration.jasperreports_properties"></a> jasperreports.properties file
```
#====================================================================
# 2.3.0.0   D. Aust   08.04.2015  New config parameter: 
#                                   - application.infoPageIsEnabled
# 2.6.1     D. Aust   15.09.2020  New config parameter: 
#                                   - application.ipAddressesAllowed
# 2.8.0     D. Aust   08.02.2022  #84: Variable for report path
#                                   - application.reportsPath
#                                   "name" in jdbc connection definition
#                                     no longer required
# 2.9.0     D. Aust   03.06.2022  #94 Suppressing debug information 
#                                   - application.printDebugToScreen          
#                                 #109 Ip Addresses Allowed
#                                   - ipAddressesAllowed available for 
#                                       each data source                  
#====================================================================

#====================================================================
# Application properties (global)
#====================================================================
[application]
configFileVersion=2.9.0

# set the jndiPrefix, this is different for different
# containers, e.g. 
# for Glassfish: jndiPrefix=jdbc/
# for Tomcat   : jndiPrefix=java:comp/env/jdbc/
jndiPrefix=java:comp/env/jdbc/

# infoPageIsEnabled will show the initial start page of the j2ee application
# including testing and the environment settings
infoPageIsEnabled=true

# this parameter is limiting access to the integration for the 
# specified list of ip addresses, e.g.: 
# ipAddressesAllowed=127.0.0.1,10.10.10.10,192.168.178.31
# if the list is empty, ALL addresses are allowed
# ipAddressesAllowed=0:0:0:0:0:0:0:1

# report definition files will be looked up in the following order as
#   specified by the reportsPath, e.g.: 
#     Linux/macOS: reportsPath=../reports,/path/to/reports1:/path/to/reports2,/path/to/reports3
#     Windows: reportsPath=..\\reports,c:\\path\\to\\reports1,c:\\path\\to\\reports2,c:\\path\\to\\reports3
#   If the reportsPath is left empty or not defined, then the default is "../reports" (*nix) or
#      "..\\reports" (windows) respectively, will start from the location of the application.properties (this)
#      file
reportsPath=

# To enable detailed request error messages, set printDebugToScreen=true
# When this setting enabled, any request that produces an error response includes a detailed message, 
# including a stack trace. 
# This setting must not be enabled on productions systems due to the risk of sensitive information being 
# revealed to an attacker.
# The default value is false
#printDebugToScreen=true

#====================================================================
# JDBC datasource configuration
# http://www.orafaq.com/wiki/JDBC#Thin_driver
# type=jndi|jdbc
#====================================================================
[datasource:default]
type=jdbc
url=jdbc:oracle:thin:@127.0.0.1:1521:XE
username=my_oracle_user
password=my_oracle_user_pwd
# this parameter is limiting access to the integration for the 
# specified list of ip addresses, e.g.: 
# ipAddressesAllowed=127.0.0.1,10.10.10.10,192.168.178.31
# if the list is empty, ALL addresses are allowed

#====================================================================
# Native JNDI datasource, to be configured in the application server
# name: jndi_test
#====================================================================
#[datasource:jndi_test]
#type=jndi
#name=jndi_test
# this parameter is limiting access to the integration for the 
# specified list of ip addresses, e.g.: 
# ipAddressesAllowed=127.0.0.1,10.10.10.10,192.168.178.31
# if the list is empty, ALL addresses are allowed

#====================================================================
# JDBC datasource configuration
# http://www.orafaq.com/wiki/JDBC#Thin_driver
# additional jdbc configurations, please uncomment
#====================================================================
#[datasource:test]
#type=jdbc
#url=jdbc:oracle:thin:@127.0.0.1:1521:XE
#username=my_oracle_user
#password=my_oracle_user_pwd
# this parameter is limiting access to the integration for the 
# specified list of ip addresses, e.g.: 
# ipAddressesAllowed=127.0.0.1,10.10.10.10,192.168.178.31
# if the list is empty, ALL addresses are allowed

#====================================================================
# Direct printing
#====================================================================
[directPrinting]
isEnabled=false

# for debugging purposes does it make sense to display the 
# print dialog ON THE SERVER before printing. You can even cancel the 
# request through the print dialog
# DON'T do that in production (displayPrintDialog=true)!!!
displayPrintDialog=false

#====================================================================
# Save File on Server
#====================================================================
[saveFileOnServer]
isEnabled=false

# allow only certain directories on the server to write to
# Use "," to separate between path entries
#directoryWhitelist=/Users/daust/oc-jasper/tmp,/Users/daust/oc-jasper

#====================================================================
## Syntax for specifying properties: 
## http://commons.apache.org/configuration/userguide/howto_basicfeatures.html#Basic_features_and_AbstractConfiguration
#====================================================================
```

## Security

Initially, JasperReportsIntegration did not implement a security strategy at all. 

Nevertheless, it was always quite easy to implement security. By using a firewall we can prohibit access to the J2EE server and only allow communication between the Oracle database and the J2EE server. This way we easily implement all required authentication and authorization just within our APEX application.

Unfortunately, many people don't set things up this way and thus they use "security by obscurity". When you deploy it on the same outside-facing application server together with Oracle REST Data Services, you can circumvent any security measures implemented in your APEX application once you get the details of the call to the J2EE application like name of the datasource, report names and parameters. 

Thus, over time some security features were implemented and more will follow in the future. 

Currently, you can use the following features for improved security: 
* The info page of the J2EE application shows lots of important information like version information and current configuration values. For production environments this can quickly become a security issue. You can turn off the info page by specifying the parameter ``infoPageIsEnabled=true`` in the ``application.properties`` file, see details [here](#configuration.jasperreports_properties).
* Restrict access based on IP address: You typically want to restrict access to the JasperReportsIntegration J2EE application. Only the database server should be allowed to call it. You can can restrict access to certain ip addresses by specifying the parameter ``ipAddressesAllowed=...`` in the ``application.properties`` file, see details [here](#configuration.jasperreports_properties).
* The parameter ``ipAddressesAllowed`` is also available for each data source (since 2.9.0).
* You should encrypt the passwords in the configuration file ``application.properties``. You can do this using the command line script ``bin\encryptPasswords.cmd`` or ``bin/encryptPasswords.sh`` respectively. 
* You should delete the directory ``reports/demo`` because it contains sample reports, particulary one that works on the user objects installed in the schema. 
* Since 2.9.0, all error messages will be suppressed. For development systems you need to enable the error messages by specifying the parameter ``printDebugToScree=true`` in the ``application.properties`` file, see details [here](#configuration.jasperreports_properties).

## Accessing JasperReportsIntegration through SSL

When you have SSL enabled on your application server then your url to the reporting services will look like ``https://server:port/jri``. 

In order for you to use calls via ``utl_http`` or ``apex_web_service`` to an ssl secured service, you need to set up a wallet and import the certificate chain of the target service. 

The following blogpost details quite nicely how to set up your Oracle wallet: https://fuzziebrain.com/content/id/1720/.

Based on that information I have created simple instructions as an example for my local server ``vm1`` using the url ``https://vm1/jri``. The default port for ``https`` is ``443``, thus the actual url is : ``https://vm1:443/jri`` if you want to be more explicit. 

### Download certificate from server
```
openssl s_client -showcerts -connect vm1:443 </dev/null
```

* copy lines from ``-----BEGIN CERTIFICATE-----`` until ``-----END CERTIFICATE----``- into a file, e.g. ``vm1.cer``
    - Don't use the first one ... only the rest of the chain. 
    - UNLESS you use a self-signed certificate, then the certificate is also the 
    ROOT certificate and thus needs to be imported, too. 

* Also, make sure the common name in the certificate matches the name of the server you are using in the call to utl_http or apex_web_service

```
# create autologin wallet and set password
orapki wallet create -wallet ./wallet -pwd YourWalletPasswd123 -auto_login

# add the certificate to the wallet
# in this case when accessing a local server with a self-signed certificate, 
# we MUST import the server certificate itself, because it is also the ROOT
# certificate. In all other cases you need to import each certificate of the
# certificate chain BUT NOT the server certificate itself

orapki wallet add -wallet ./wallet -trusted_cert -cert "vm1.cer" -pwd YourWalletPasswd123

# display the certificates that are contained in the wallet
orapki wallet display -wallet ./wallet
```

e.g.
```
[oracle@localhost create_wallet3]$ orapki wallet display -wallet ./wallet
Oracle PKI Tool Release 18.0.0.0.0 - Production
Version 18.1.0.0.0
Copyright (c) 2004, 2017, Oracle and/or its affiliates. All rights reserved.

Requested Certificates: 
User Certificates:
Trusted Certificates: 
Subject:        CN=vm1
Subject:        CN=dietmarausted48
Subject:        CN=GTS CA 1O1,O=Google Trust Services,C=US
```

**In our case we need to make sure, that we have an entry with the common name vm1 (CN=vm1).**

### Run test in Oracle

* Make sure you create a new session to the database, because the wallet information is cached on the session level. 
* Thus, for APEX you would need to restart ORDS.

```
-- calling the service using http
select apex_web_service.make_rest_request('http://vm1:8080/jri','GET') from dual;

-- calling the service using https and the wallet
select apex_web_service.make_rest_request(
        p_url         => 'https://vm1/jri/',
        p_http_method => 'GET',
        p_wallet_path => 'file:/u01/app/dietmar/create_wallet3/wallet',
        p_wallet_pwd  => 'YourWalletPasswd123') as r
  from dual;
```

I am using apex_web_service in this example but you could do it just as well using utl_http. 

## Using additional fonts

In a jasper report (.jrxml file) you can use several fonts for displaying labels/texts. These fonts may not be always available on different platforms/OS. (e.g. There are some MS fonts which are unavailable on linux machines unless you install them manually). 

Some fonts are bundled with jasperreports itself into a jar and make them work irrespective of underlying platform. Those are the DejaVuSans fonts. They are always available on all platforms because they are included in the file ``jasperreports-fonts-<version>.jar``. 

More information can be found here: 
* https://community.jaspersoft.com/wiki/custom-font-font-extension (this is the easiest one), then add it to the classpath
* https://stackoverflow.com/questions/27184408/what-is-the-jasperrepots-fonts-jar-for-and-how-to-use-it
* http://jasperreports.sourceforge.net/sample.reference/fonts/index.html#fontextensions

More details will follow later ... *tbd*

# <a name="plsql_api"></a> PL/SQL API

*tbd*

# <a name="external_documentation_training"></a> External Documentation Training

* [JasperReports Wiki](https://community.jaspersoft.com/wiki/jaspersoft-community-wiki-0)


# <a name="legacy_documentation"></a> Legacy documentation

Previously, the documentation was provided using html. This is still part of the distribution. This is to be considered deprecated and will be removed in future releases. The documentation has been moved to GitHub using the markdown format. 

You can find the current html documentation <a href="https://daust.github.io/JasperReportsIntegration/src/doc/User-Documentation/Index-Local.html" target="_blank">here</a>.

# <a name="changelog"></a>Change Log / Release Notes

The [ReleaseNotes.md](src/doc/github/ReleaseNotes.md) contain all the major updates for each release. The complete set of issues can be found on [Milestones](https://github.com/daust/JasperReportsIntegration/milestones) page.

# <a name="credit"></a>Credit

The software is provided for free by [OPAL Consulting (Dietmar Aust)](https://www.opal-consulting.de/). 

# <a name="contribute"></a>Contributing

In case you want to contribute to the project, you can find instructions [here](src/doc/github/developers.md) on how to set up your development environment how supply patches to the software or documentation. 

It also includes instructions on how to upgrade the jasperreports libraries which are included in the J2EE application. 

One could say that the project consists of two main aspects: 
* the JasperReportsIntegration software itself (the Java war file and the pl/sql apis)
* the jasperreports libraries, see [jasperreports libraries](https://sourceforge.net/projects/jasperreports/files/jasperreports)

Often a new release is required when a new version of the libraries is available. This can now easily be done by everybody. You are no longer dependent on the main developer. 

# <a name="license"></a>License

For this project we are using a "BSD 3-Clause License", you can find the full license text [here](LICENSE).

The BSD style license is very different from the GNU Public License. While the GNU license puts all sorts of restrictions on what you can do with the software, BSD-style licenses say "Hey, do what you like, we don't care. Just let people know we wrote it, and don't sue us." That's really all there is to it.

The first paragraph with the numbered items says you can do what you like with the code, as long as you keep our name on it. And you cannot use our name(s) for advertising.

The second paragraph, all in capital letters, is a standard legal boilerplate notification that tries to make it difficult for anyone to successfully sue us over the software.

# <a name="faq"></a>FAQ / Troubleshooting

## Enable Debugging

JasperReportsIntegration is using the log4j2 framework for logging. 
The configuration file for logging is ``conf/log4j2.xml``. 

* Edit the file ``conf/log4j2.xml`` and change the log level from ``INFO`` to ``TRACE``, ``DEBUG``, ``WARN`` or ``ERROR``: 
    <pre>&lt;Logger name="de.oc" level="<b>info</b>" additivity="false" \&gt;</pre>
  to
    <pre>&lt;Logger name="de.oc" level="<b>debug</b>" additivity="false" \&gt;</pre>
* You can restart the application server, but you don't have it. It should pick up the change after 30 seconds automatically without restarting. 
* Then you can find the log entries in the file ``logs/JasperReportsIntegration.log``.

## Error Messages in the Browser

Since 2.9.0, all error messages will be suppressed. For development systems you need to enable the error messages by specifying the parameter ``printDebugToScree=true`` in the ``application.properties`` file, see details [here](#configuration.jasperreports_properties).

## Direct Printing

In order to use direct printing, two things have to happen: 
- You need to specify the parameter ``isEnabled=true`` in the section ``[directPrinting]`` of the configuration file ``application.properties``, see details [here](#configuration.jasperreports_properties).
- You need to pass the parameter ``p_print_is_enabled`` in the request for the report.

If you specify it in the request for the report but it is *not* enabled in the configuration file on the server, an exception will be raised. 

## Encrypting and Password-Protecting PDF Files

Starting 2.9.0 you can encrypt and password-protect your generated pdf files, for details see [the section on integration and usage](src/doc/github/integration-usage.md).

## Known Issues

* When using "headless" Linux servers (https://www.howtogeek.com/660841/what-is-a-headless-server/, ), you might encounter error messages regarding awt like the following: ``"java.lang.NoClassDefFoundError: Could not initialize class sun.awt.X11GraphicsEnvironment"``.  
    - Solution: You need to configure your application server (e.g. Tomcat) in headless mode. You can get more information here: https://www.xwiki.org/xwiki/bin/view/Documentation/AdminGuide/Installation/InstallationWAR/InstallationTomcat/
    - For Windows, create a file named ``setenv.bat`` in the directory ``%TOMCAT_HOME%/bin``. It will be called from ``catalina.bat``:
        ```
        set JAVA_OPTS=%JAVA_OPTS% -Djava.awt.headless=true
        ```

    - For *nix systems, create a file named ``setenv.sh`` in the directory ``$TOMCAT_HOME/bin``. It will be called from ``catalina.sh``:
        ```
        #!/bin/sh
        export JAVA_OPTS="${JAVA_OPTS} -Djava.awt.headless=true"
        ```

* Error connecting to Oracle Cloud Database on Windows:

  This is weird, you might get one of the following errors: 
  ```
  Invalid connection string format, a valid format is: "host:port:sid"
  ```
  or
  ```
  Dez 15, 2020 1:14:00 PM oracle.net.resolver.EZConnectResolver parseExtendedProperties
   SCHWERWIEGEND: Extended settings parsing failed.
  java.lang.RuntimeException: Invalid character at 32 : \
	at oracle.net.resolver.EZConnectResolver.parseExtendedProperties(EZConnectResolver.java:393)
	at oracle.net.resolver.EZConnectResolver.parseExtendedSettings(EZConnectResolver.java:366)
  ```
  when using a JDBC url like: 
  ```
  url=jdbc:oracle:thin:@tnsnames_entry?TNS_ADMIN=C:\mywalletpath
  ```
  You can see the details and multiple workarounds here: https://github.com/daust/JasperReportsIntegration/issues/68 . 
  
  The simplest workaround is to replace all ``\`` with ``/``, e.g.:
  ```
  url=jdbc:oracle:thin:@tnsnames_entry?TNS_ADMIN=C:/mywalletpath
  ```
* Error in APEX: ``Unexpected token % in JSON at position 0``

  When you create a button to call a pl/sql process you might encounter the error message: 
  ```
  1 error has occurred
  Error: SyntaxError: Unexpected token % in JSON at position 0
  ```
  The solution is to change the setting ``Advanced/Reload on Submit: Only for success`` to ``Always``. 

# <a name="support"></a>Support / Forum

There is a FORUM for getting help here: https://gitq.com/daust/JasperReportsIntegration. Please be as specific as possible: 

* Error Message
* Steps to reproduce
* Operating system of the application server and version (e.g. Linux Redhat 7.x)
* Application server and version (e.g. Apache Tomcat/8.0.23)
* JasperReportsIntegration version (e.g. JasperReportsIntegration-2.6.0-6.14.0 )
* Possibly logfiles of Apache Tomcat
* Log entries from xlib_logs for making the url call using utl_http

Also, when you encounter issues that you suspect are bugs and/or want to request enhancements to the software, please [enter the issues here](issues). 
