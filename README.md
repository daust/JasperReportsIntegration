[//]: # (Infos about this file)
[//]: # (Markdown Syntax: https://guides.github.com/features/mastering-markdown/)
[//]: # (how to write a good readme for a github project: https://bulldogjob.com/news/449-how-to-write-a-good-readme-for-your-github-project)

<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick" />
<input type="hidden" name="hosted_button_id" value="NH8MWBUXWQ73W" />
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate with PayPal button" />
<img alt="" border="0" src="https://www.paypal.com/en_DE/i/scr/pixel.gif" width="1" height="1" />
</form>

* [What is the JasperReportsIntegration?](#intro)
* [Documentation](#docs)
* [Download](#download)
* [Change Log / Release Notes](#changelog)
* [FAQ / Support / Forum](#support)
* [Credit](#credit)
* [Contributing](#contribute)
* [License](#license)

# <a name="intro"></a> What is the JasperReportsIntegration?

JasperReportsIntegration provides an interface to use the [JasperReports reporting engine](https://community.jaspersoft.com/project/jasperreports-library) in an Oracle database application, specifically with Oracle Application Express (Oracle APEX).

>"The JasperReports Library is the world's most popular open source reporting engine. It is entirely written in Java and it is able to use data coming from any kind of data source and produce pixel-perfect documents that can be viewed, printed or exported in a variety of document formats including HTML, PDF, Excel, OpenOffice and Word."

The main purpose is to provide a cost free alternative for high-fidelity printing / PDF generation with Oracle APEX. This integration kit allows to run JasperReports reports from within your Oracle APEX application. 

## How does it work?

### Architecture

*tbd*

### Design and execution flow

1. Design your report against the Oracle database using the JasperSoft Studio software: https://community.jaspersoft.com/project/jaspersoft-studio/releases. 
2. Copy the ``<report name>.jasper`` file to the application server
3. Use the pl/sql api to call the report and pass any required parameters
4. The integration pl/sql api will construct the url and call the j2ee web application using utl_http. This will execute the locally stored ``<report name>.jasper`` file and use the connection pool as defined in the ``application.properties`` file. 

# <a name="docs"></a>Documentation

## System Requirements

* **Oracle Database Release**: The minimum requirement is the availability of the package ``UTL_HTTP``. Thus the integration will work with all Oracle versions in which Oracle APEX can be installed, even Oracle XE (10g).  

* **Oracle APEX Release**: The minimum release for the test application is APEX 4.2.  Aside from the test application there is no dependency on a specific Oracle APEX Release, therefore it should work with any Oracle APEX Release.

* **Disk Space**: 150 MB of disk space.

* **J2EE Server**: It is still compatible with the fairly old servlet specification 2.4 (Java JDK 1.8), thus the J2EE application should work in most J2EE servers, it even works with Apache Tomcat 5.5. See [Apache Tomcat Versions](https://tomcat.apache.org/whichversion.html) for details. 

## Quick Start
## Installation
## Integration and Usage

## Configuration
## Customizations

### jasperreports.properties file
### additional fonts

## PL/SQL API
## Security

## Legacy documentation

Previously, the documentation was provided using html

* [Include newer versions of the JasperReports libraries on your own](#updateLibs) 
* <a href="https://daust.github.io/JasperReportsIntegration/src/doc/User-Documentation/Index-Local.html" target="_blank">Documentation</a>


# <a name="download"></a>Download

Binary releases can be downloaded from [the releases folder](releases). There you can find pre-releases for testing in the field as well as actually released binaries. 

The following naming convention will be used for the provided binaries: `JasperReportsIntegration-<project.version>-<jasperreportsVersion>.zip`.

Legacy releases (up until version 2.4) can be downloaded here: https://www.opal-consulting.de/downloads/free_tools/JasperReportsIntegration/

# <a name="changelog"></a>Change Log / Release Notes

The [ReleaseNotes.md](ReleaseNotes.md) contain all the major updates for each release. ThecComplete set of issues can be found on [Milestones](milestones?state=closed) page.

# <a name="support"></a>FAQ / Support / Forum

* Forum: https://gitq.com/daust/JasperReportsIntegration

There is a FORUM for getting help here: https://gitq.com/daust/JasperReportsIntegration. Please be as specific as possible (error message, what is working, what is not working, steps to reproduce, operating system and version of application server, JasperReportsIntegration and application server). 

## <a name="updateLibs"></a> Include newer versions of the JasperReports libraries on your own

One could say that the project consists of two main aspects: 
* the JasperReportsIntegration software itself (the Java war file and the pl/sql apis)
* the jasperreports libraries, see [jasperreports libraries](https://sourceforge.net/projects/jasperreports/files/jasperreports)

Often a new release is required when a new version of the libraries is available. 

Everybody can do this now. Please follow the instructions for developers: [src/doc/github/developers.md](src/doc/github/developers.md)

# <a name="credit"></a>Credit

Provided for free by OPAL Consulting (Dietmar Aust). 

# <a name="contribute"></a>Contributing
* [src/doc/github/developers.md](src/doc/github/developers.md)

# <a name="license"></a>License

Cheers, 
~Dietmar. 
