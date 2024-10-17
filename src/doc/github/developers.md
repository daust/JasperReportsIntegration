# Instructions for developers to contribute

## Requirements

* Java JDK >= **Java 8**
* Gradle (https://gradle.org/) (this is optional and not required, only when upgrading the gradle environment). Currently, we are using Gradle 7.6.4 and a gradle wrapper is provided.
* *Apache ant and Apache Ivy are no longer required, because the JasperReports libraries are no longer built using those tools. Since JasperReports 7.0.0 this has been moved to a pure Maven build.* 

## Setup

### Download 

First you need to download the files to a local directory, either use git clone or download them using the download link from github: Code > Download as zip. 

### Using gradle

We are using the gradle build tool (https://gradle.org/), specifically with the gradle wrapper (https://tomgregory.com/what-is-the-gradle-wrapper-and-why-should-you-use-it/).

Thus, for all commands you can use `./gradlew` or `gradle.bat` instead of `gradle`. The advantage is that you don't have to download and install gradle. Also, you can always be sure to use the correct version of gradle for the build. In the instructions we will always refer to ``<gradle command>``, so on Windows replace that with ``gradlew`` or ``gradlew.bat``, on Linux and MacOS replace it with ``./gradlew``. 

### Configuration

Please create a local file named `gradle.properties` in the root directory. This will remain local and not be included on github (see file `.gitignore` for details). 

All local configuration files for the JasperReportsIntegration at runtime (``application.properties`` and ``report`` directories) will be created there. Everything will be created automatically, even the directory itself. You only need to register the path to hold the configuration files. 

**Sample file contents for Linux or MacOS:**

```
// custom file for each developer different
// jriLocalPath points to the local environment where the configuration files for the JasperReportsIntegration can be found
// this file is registered in the .gitignore file and thus will never uploaded to github itself. It is a local file for each developer. 
// Use \\ or / to separate the path on Windows, either one is fine
//  jriLocalPath=C:/temp/jri
//  jriLocalPath=C:\\temp\\jri

jriLocalPath=/tmp/jri
```

**Sample file contents for Windows:**
```
// custom file for each developer different
// jriLocalPath points to the local environment where the configuration files for the JasperReportsIntegration can be found
// this file is registered in the .gitignore file and thus will never uploaded to github itself. It is a local file for each developer. 
// Use \\ or / to separate the path on Windows, either one is fine
//  jriLocalPath=C:/temp/jri
//  jriLocalPath=C:\\temp\\jri

jriLocalPath=c:/temp/jri
```
This will point to the local directory where the configuration and report files will be located for developing, testing and debugging. 

When you run the following command, all relevant files will be created there: 
```
<gradle command> jriCreateLocalEnvironment
```

The following file system structure will be created for you: 
```
.
├── conf
│   ├── application.properties
│   └── log4j2.xml
├── logs
└── reports
    ├── test.jasper
    └── test.jrxml
```
## Tasks

You can get an overview of all available build tasks by using: 
```
<gradle command> tasks --all
```

### Upating the configuration

The most important configuration can be found in the build file `build.gradle`:

```
  project.description       = "JasperReportsIntegration"
  project.version           = '3.0.0'
  
  sourceCompatibility       = 1.11
  targetCompatibility       = 1.11

  archivesBaseName          = "JasperReportsIntegration"

  // version of jasperreports to be used
  def jasperreportsVersion  ='7.0.1'  
```

If you create a new version (meaning you change the Java sources), please update the property `project.version`. Should you only want to download and include a new version of the jasperreport libraries, then you can change the property `jasperreportsVersion`. 

## Building

### Building a version of the project

There are many different ways you can build the project ... depending on your needs: 
* cleaning the build directory
    * `<gradle command> clean`
* the main build command to create the ``.war`` file and the binary files for the release. In ``distributions`` you will find the binaries to upload to GitHub as a release. In ``libs`` you will find the generated ``.jar`` and ``.war`` file. 
    * `<gradle command> build`
* building the distribution (without zip) into the build directory `build/install/JasperReportsIntegration`. This is for local testing of the command line scripts and the embedded Jetty. 
    * `<gradle command> installDist`

The following naming conventions will be used: `JasperReportsIntegration-<project.version>-<jasperreportsVersion>.zip`.

A ``*.tar`` file will also be created. 

## Setting up the Eclipse project

You can use the build task ``eclipse`` to create a project file for Eclipse. 

```
<gradle command> eclipse
```

## Testing / debugging

<!-- This is a comment and will not be displayed in the rendered Markdown 

This section can be re-introduced again once the conflicts regarding java versions
has been fixed. 

* starting the built-in jetty (provided by gretty) - (faster) - will use an inplace web application and not compile the full war file. Thus the version numbers might not show properly. 
    * `<gradle command> appRun`
* starting the built-in jetty (provided by gretty) - will actually build the war file first and run it
    * `<gradle command> appRunWar`

Should you get an error message like ``Caused by: java.net.BindException: Address already in use: bind`` then you need to change the port that the integrated jetty is using. Look for the following section in the ``build.gradle`` file and change the parameter **httpPort**: 

```
gretty {
  httpPort = 8099
  jvmArgs = ['-Djava.awt.headless=true']
} 
```

-->

Debugging is done in your local development environment. There you can start a Tomcat9 instance and deploy the application automatically. 

In the Eclipse environment, I am using the following settings: 
- apache-tomcat-9.0.95
- Open JDK 17.0.4.1 as a runtime engine for Tomcat
- In the runtime environment for the Tomcat container, specify the environment variable ``OC_JASPER_CONFIG_HOME``. In my environment it defaults to ``/tmp/jri`` which also corresponds to the entry in the ``build.gradle`` file. 

## Test checklist

This is the checklist I run for each release, please adapt to your local environment. 

### Test command line scripts on MacOS (encrypt passwords, deploy, start)

```
*) local install on MacOS
./gradlew clean
./gradlew installDist

cd /Users/daust/LOCAL-FILES/50-Projects/JasperReportsIntegration/build/install/JasperReportsIntegration/bin

*) edit configuration
vi ../conf/application.properties

Modify default data source to connect to your development environment, e.g.:

[datasource:default]
type=jdbc
name=default
url=jdbc:oracle:thin:@win11:1521/orclpdb
username=demo
password=oracle1

*) encryptPasswords

./encryptPasswords.sh ../conf/application.properties

*) check encryption

cat ../conf/application.properties

*) start 
./deployJasperReportsIntegration.sh
./startJasperReportsIntegration.sh

open http://localhost:8090/jri/

*) compilation of .jrxml => .jasper on-the-fly

rm /Users/daust/LOCAL-FILES/50-Projects/JasperReportsIntegration/build/install/JasperReportsIntegration/reports/test.jasper

open http://localhost:8090/jri/report?_repName=test&_repFormat=pdf&_dataSource=default&_outFilename=&_repLocale=&_repEncoding=&_repTimeZone=&_printIsEnabled=&_printPrinterName=&_printJobName=&_printPrinterTray=&_printCopies=&_printDuplex=&_printCollate=&_saveIsEnabled=&_saveFileName=

*) create config directory

./createConfigDir.sh /tmp/jri ..
tree /tmp/jri

*) get config directory - should be empty

./getConfigDir.sh ../webapp/jri.war
ConfigDir: 

*) set config dir

./setConfigDir.sh ../webapp/jri.war /tmp/jri
process web.xml
replace config.home with directory: /tmp/jri

*) get config directory - should now be /tmp/jri

./getConfigDir.sh ../webapp/jri.war
ConfigDir: /tmp/jri
```
### Test different report types through APEX

```
*) Start APEX application

/usr/bin/open -a "/Applications/Google Chrome.app" 'http://win11:8090/ords/f?p=201'

*) Verify Setup
Enter the correct URL (parts) into the section: J2EE Server Configuration (Defaults)
E.g. connect from the database in my local virtual machine to the http://macbook2022.local:9080/jri
Both my Eclipse environment and also my Tomcat10 on the MacBook (host machine) run on this port. 

*) Test reports
- Go to "Report Demos"
- Execute all reports in order

*) Test saving files on the server
- edit ``application.properties`` file:

[saveFileOnServer]
isEnabled=true
directoryWhitelist=/tmp/jri

- Restart Appserver
- Go to "Release Checklist" in APEX app
- Click on "Save file on server (test.pdf)" => will create the file in ``/tmp/jri/test.pdf``
- Click on "Save file on server and show (test.pdf)" => will create the file in ``/tmp/jri/test.pdf`` and also display it in the browser
- Click on "Save file on server (test.csv)" => will export the test report in CSV format as ``/tmp/jri/test.pdf``.
```

### Test Tomcat 10 support on MacOS

```
*) Build war file for Tomcat10 (will take 2min approx.)

./gradlew buildWarTomcat10

*) Deploy to apache-tomcat-10.0.16 and start it

./gradlew deployTomcat10

*) Start browser

open http://localhost:9080/jri/

*) When done, stop Tomcat10
/Users/daust/Downloads/KEEP/tomcat/apache-tomcat-10.0.16/bin/shutdown.sh

```

### Test command line scripts on Windows (encrypt passwords, deploy, start)

```
*) Download and unzip to Windows

e.g. File: jri-3.0.0-jasper-7.0.1.zip
download to c:\temp
unzip
rename directory to c:\temp\jri-install
download jri-3.0.0-jasper-7.0.1-tomcat10.war to c:\temp\jri-install\webapp
and rename it to jri-tomcat10.war

*) Start a cmd command shell and navigate to that directory
cd /d C:\temp\jri-install\bin

*) edit configuration
start ..\conf\application.properties

Modify default data source to connect to your development environment, e.g.:

[datasource:default]
type=jdbc
name=default
url=jdbc:oracle:thin:@win11:1521/orclpdb
username=demo
password=oracle1

*) encryptPasswords

encryptPasswords.cmd ..\conf\application.properties

*) check encryption

type  ..\conf\application.properties

*) deploy web application and start embedded jetty

deployJasperReportsIntegration.cmd
startJasperReportsIntegration.cmd

start http://localhost:8090/jri/

*) compilation of .jrxml => .jasper on-the-fly (should create the file ``test.jasper`` in the ``reports`` directory)

del "C:\temp\jri-install\reports\test.jasper"
start http://localhost:8090/jri/report?_repName=test

*) create config directory (delete first)

rmdir /s /q c:\temp\jri
cd /d C:\temp\jri-install\bin
createConfigDir.cmd c:\temp\jri ..
tree c:\temp\jri

*) get config directory - should be empty

getConfigDir.cmd ..\webapp\jri.war
ConfigDir: 

*) set config dir

setConfigDir.cmd ..\webapp\jri.war c:\temp\jri
=> process web.xml
=> replace config.home with directory: c:\temp\jri

*) get config directory - should now be c:\temp\jri

getConfigDir.cmd ..\webapp\jri.war
=> ConfigDir: c:\temp\jri

*) Deploy to local installations (mandatory step, else the wrong config directory will be picked up. The entry in the web.xml overrides the environment variable). Alternatively, you can take a "fresh" war file that has not yet a config dir set. 
setConfigDir.cmd ..\webapp\jri.war C:\app\jri
setConfigDir.cmd ..\webapp\jri-tomcat10.war C:\app\jri

*) Deploy the war file to different local application servers and to basic tests there
"C:\Programme-Manuell\deployWAR.cmd"

- Tomcat9 + current JDK (http://localhost:8090/jri)
- Tomcat10 + current JDK (http://localhost:8080/jri)
- Weblogic 14 + JDK8 (http://localhost:7001/jri/)
- Weblogic 12 + JDK8 (http://localhost:7001/jri/)
- Wildfly 26.1 + JDK11 (http://localhost:8080/jri)
- Wildfly 26.1 + current JDK (http://localhost:8080/jri)
- Glassfish 4.1 +  JDK8 (http://localhost:8080/jri/)

```

## Checklist for a new release

What are the steps for releasing a new version of JRI?

* Update the release notes => ``ReleaseNotes.md``
* Build the current release
    * ``<gradle command> clean``
    * ``<gradle command> build``
    * ``<gradle command> buildWarTomcat10``
* Test all use cases in the APEX application
* Do a full install on Windows following the full installation guidelines
* Do a full install on Linux following the full installation guidelines
* Merge the current branch into the main branch
    * e.g. for version 3.0.0, merge the branch ``b3.0.0`` back into branch ``main``
* Close the current milestone ( https://github.com/daust/JasperReportsIntegration/milestones ) 
* Create a new release
    * Draft a new release
    * Tag as ``v3.0.0`` for version ``3.0.0``
    * Release title is ``Version 3.0.0 (release: 17.10.2024)`` from the file ``ReleaseNotes.md``
    * The contents is also from ``ReleaseNotes.md``, just without the title
    * Upload the binaries
        * e.g. ``jri-3.0.0-jasper-7.0.1.zip``
        * e.g. ``jri-3.0.0-jasper-7.0.1.tar``
        * e.g. ``jri-3.0.0-jasper-7.0.1-tomcat10.war``
* Post on Twitter / X

## Development with Eclipse

* the following task will create all required files for Eclipse
    * `<gradle command> eclipse`

Then you can just start Eclipse and import the root directory into Eclipse as a gradle project. 

## Working with Markdown (*.md) files

Markdown files are used for the documentation, they are written in Markdown syntax as described [here](https://guides.github.com/features/mastering-markdown/). In Visual Studio Code you can use plugins to display the Markdown preview in a separate window. But you can also use a Google Chrome Extension to render the markdown files in the browser, e.g. [the Markdown Viewer](https://chrome.google.com/webstore/detail/markdown-viewer/ckkdlimhmcjmikdlpkmbgfkaikojcbjk).

## Coding 

### Updating Oracle JDBC Libraries

See: 
- https://blogs.oracle.com/developers/post/oracle-database-client-libraries-for-java-now-on-maven-central
- https://www.oracle.com/database/technologies/maven-central-guide.html

For the newest version, check: https://www.oracle.com/database/technologies/appdev/jdbc-downloads.html

Then, update the ``build.gradle`` file: 
```
    // Get BOM file and choose Oracle JDBC driver (ojdbc8.jar) and Universal Connection Pool (ucp.jar)
    // https://www.oracle.com/database/technologies/appdev/jdbc-downloads.html
    // check the current version 
    implementation(enforcedPlatform("com.oracle.database.jdbc:ojdbc-bom:21.4.0.0.1"))
    implementation("com.oracle.database.jdbc:ojdbc8")
    implementation("com.oracle.database.jdbc:ucp")

    // Additional Jars for using Oracle Wallets 
    implementation("com.oracle.database.security:oraclepki")
    implementation("com.oracle.database.security:osdt_core")
    implementation("com.oracle.database.security:osdt_cert")

    // Additional Jars for High Availability 
    // ons removed due to Timeout issue when connecting to cloud database #69
    // https://github.com/daust/JasperReportsIntegration/issues/69
    //implementation("com.oracle.database.ha:ons")
    implementation("com.oracle.database.ha:simplefan")
```


