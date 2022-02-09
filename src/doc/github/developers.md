# Instructions for developers to contribute

## Requirements

* Java JDK >= **Java 8**
* Gradle (https://gradle.org/) (this is optional and not required, only when upgrading the gradle environment). Currently, we are using Gradle 6.6.1 and a gradle wrapper is provided.
* **Apache ant** (you need a working installation of ant in order to download the new libraries for jasperreports). You can download and install it from here: https://ant.apache.org/bindownload.cgi
* **Apache Ivy** (you need this extension to Apache ant in order to download the jasperreports libraries successfully). You can download it from here: https://ant.apache.org/ivy/download.cgi. Once downloaded, you need to copy the ``ivy<version>.jar`` file into the directory ``<ant install dir>\lib``. 

## Best practices

When contributing as a developer, please adhere to the best practices: https://www.datree.io/resources/github-best-practices. 
Specifically, the main branch is protected: https://docs.github.com/en/github/administering-a-repository/configuring-protected-branches.

## Setup

### Download 

First you need to download the files to a local directory, either use git clone or download them using the download link from github: Code > Download as zip. 

### Using gradle

We are using the gradle build tool (https://gradle.org/), specifically with the gradle wrapper (https://tomgregory.com/what-is-the-gradle-wrapper-and-why-should-you-use-it/).

Thus, for all commands you can use `./gradlew` or `gradle.bat` instead of `gradle`. The advantage is that you don't have to download and install gradle. Also, you can always be sure to use the correct version of gradle for the build. In the instructions we will always refer to ``<gradle command>``, so on Windows replace that with ``gradlew`` or ``gradlew.bat``, on Linux and MacOS replace it with ``./gradlew``. 

### Configuration

Please create a local file named `gradle.properties` in the root directory. This will remain local and not be included on github (see file `.gitignore` for details). 

All local configuration files for the JasperReportsIntegration at runtime (application.properties and report directories) will be created there. Everything will be created automatically, even the directory itself. You only need to register the path to hold the configuration files. 

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
  project.version           = '2.6.0'
  
  sourceCompatibility       = 1.8
  targetCompatibility       = 1.8

  archivesBaseName          = "JasperReportsIntegration"

  // version of jasperreports to be used
  def jasperreportsVersion  ='6.14.0'  
```

If you create a new version (meaning you change the Java sources), please update the property `project.version`. Should you only want to download and include a new version of the jasperreport libraries, then you can change the property `jasperreportsVersion`. 

### Downloading a new version of the libraries

Once you have updated the property `jasperreportsVersion`, you can now call the following command to download the new libraries: 

```
<gradle command> jriDownloadJasperLibraries
```

This will download the files into the directory: `lib/jasper-reports/<version>` .

**Also, this is a required step for the current release, because the libraries are not uploaded to github, they are always downloaded locally for each developer.**

## Building

### Building a version of the project

There are many different ways you can build the project ... depending on your needs: 
* cleaning the build directory
    * `<gradle command> clean`
* building the war file 
    * `<gradle command> build`
* building the distribution (without zip) into the build directory `build/install/JasperReportsIntegration`
    * `<gradle command> installDist`
* building the distribution as zip into the build directory: `build/distributions`
    * `<gradle command> assembleDist`

The following naming conventions will be used: `JasperReportsIntegration-<project.version>-<jasperreportsVersion>.zip`.

A *.tar file will also be created. 

## Testing / debugging

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

```
--------------------------------------------------------------------------------
-- Test cases
--------------------------------------------------------------------------------

*) local install
gradle clean
gradle installDist

cd /Users/daust/LOCAL-FILES/50-Projects/JasperReportsIntegration/build/install/JasperReportsIntegration/bin

*) edit configuration
vi ../conf/application.properties

Modify default data source: 

[datasource:default]
type=jdbc
name=default
url=jdbc:oracle:thin:@vm1:1521:XE
username=schema1
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

open http://localhost:8090/jri/report?_repName=test&_repFormat=pdf&_dataSource=default&_outFilename=&_repLocale=&_repEncoding=&_repTimeZone=&_printIsEnabled=&_printPrinterName=&_printJobName=&_printPrinterTray=&_printCopies=&_printDuplex=&_printCollate=&_saveIsEnabled=&_saveFileName=

*) get config directory - should be empty

./getConfigDir.sh ../webapp/jri.war
ConfigDir: /tmp/jri

*) set config dir

./setConfigDir.sh ../webapp/jri.war /tmp/jri
process web.xml
replace config.home with directory: /tmp/jri

*) get config directory - should be empty

./getConfigDir.sh ../webapp/jri.war
ConfigDir: /tmp/jri

After that, do the same thing on Windows. 

```


## Checklist for a new release

What are the steps for releasing a new version of JRI?

* Update the release notes
* Test all use cases in the APEX application
* Do a full install on Windows following the full installation guidelines
* Do a full install on Linux following the full installation guidelines
* Merge the current branch into the main branch
* Close the current milestone ( https://github.com/daust/JasperReportsIntegration/milestones ) 
* Create a new release
* Build the current release
* Upload the binaries
* Blogpost on dietmaraust.com
* Update the latest blogpost on dietmaraust.com and reference the new blogpost saying that a new version available, see: https://dietmaraust.com/jasperreportsintegration-2-6-1-released

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


