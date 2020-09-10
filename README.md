[//]: # (Infos about this file)
[//]: # (Markdown Syntax: https://guides.github.com/features/mastering-markdown/)
[//]: # (how to write a good readme for a github project: https://bulldogjob.com/news/449-how-to-write-a-good-readme-for-your-github-project)

# JasperReportsIntegration

JasperReportsIntegration provides an interface to use the JasperReports reporting engine in an Oracle database application, specifically with Oracle Application Express (Oracle APEX).

There is a FORUM for getting help here: https://gitq.com/daust/JasperReportsIntegration. Please be as specific as possible (error message, what is working, what is not working, steps to reproduce, operating system and version of application server, JasperReportsIntegration and application server). 

The reports will be created using the JasperSoft Studio software: https://community.jaspersoft.com/project/jaspersoft-studio/releases. 

## Table of Contents

* [Links](#links)
* [technologies](#technologies) 

## <a name="links"></a> Links

* Release Notes: [ReleaseNotes.md](ReleaseNotes.md)
* Download binary releases: https://github.com/daust/JasperReportsIntegration/releases
    * The following naming convention will be used: `JasperReportsIntegration-<project.version>-<jasperreportsVersion>.zip`.
* Download legacy releases: http://www.opal-consulting.de/downloads/free_tools/JasperReportsIntegration/
* Forum: https://gitq.com/daust/JasperReportsIntegration
* API docs: ... to be done
* FAQ: ... to be done

## <a name="links"></a> Links


## Include newer versions of the JasperReports libraries on your own

One could say that the project consists of two main aspects: 
* the JasperReportsIntegration software itself (the Java war file and the pl/sql apis)
* the jasperreports libraries, see [jasperreports libraries](https://sourceforge.net/projects/jasperreports/files/jasperreports)

Often a new release is required when a new version of the libraries is available. 

Everybody can do this now. Please follow the instructions for developers: [src/doc/github/developers.md](src/doc/github/developers.md)

## Contribute to the project as a developer
* [src/doc/github/developers.md](src/doc/github/developers.md)

Cheers, 
~Dietmar. 
