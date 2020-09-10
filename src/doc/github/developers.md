# Instructions for developers to contribute

## Requirements

* Java JDK >= Java 8
* Gradle (https://gradle.org/) (this is optional and not required, only when upgrading the gradle environment). Currently, we are using Gradle 6.6.1 and a gradle wrapper is provided.
* ant (you need a working installation of ant in order to download the new libraries for jasperreports)

## Best practices

When contributing as a developer, please adhere to the best practices: https://www.datree.io/resources/github-best-practices. 
Specifically, the main branch is protected: https://docs.github.com/en/github/administering-a-repository/configuring-protected-branches.

## Setup

### Download 

First you need to download the files to a local directory, either use git clone or download them using the download link from github: Code > Download as zip. 

### Configuration

Please create a local file named `gradle.properties` in the root directory. This will remain local and not be included on github (see file `.gitignore` for details). 

```
// custom file for each developer different
// please use gitignore on this file
// this file is always included automatically by Gradle
// jriLocalPath points to the local environment where the configuration files for the JasperReportsIntegration can be found

jriLocalPath=/tmp/jri
```

On Windows please use:
```
// custom file for each developer different
// please use gitignore on this file
// this file is always included automatically by Gradle
// jriLocalPath points to the local environment where the configuration files for the JasperReportsIntegration can be found

jriLocalPath=C:\temp\jri
```
This will point to the local directory where the configuration and report files will be located for developing, testing and debugging. 

You need at least the following files / directories there: 
```
.
├── conf
│   ├── application.properties
│   └── log4j.properties
├── logs
└── reports
    ├── test.jasper
    └── test.jrxml
```

Once the configuration file is done you can create the local configuration files with this command: 
```
./gradlew jriCreateLocalEnvironment
```
This will copy all required files there and the required files will be created automatically for you. 

### Using the gradle wrapper

We are using the gradle build tool (https://gradle.org/), specifically with the gradle wrapper (https://tomgregory.com/what-is-the-gradle-wrapper-and-why-should-you-use-it/).

Thus, for all commands you can use `./gradlew` or `gradle.bat` instead of `gradle`. The advantage is that you don't have to download and install gradle. Also, you can always be sure to use the correct version of gradle for the build. 


## Tasks

You can get an overview of all available build tasks by using: 
```
./gradlew tasks --all
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
./gradlew jriDownloadJasperLibraries
```

This will download the files into the directory: lib/jasper-reports/\<version\> .

### Building a version of the project

There are many different ways you can build the project ... depending on your needs: 
* cleaning the build directory
    * `./gradlew clean`
* building the war file 
    * `./gradlew build`
* building the distribution (without zip) into the build directory `build/install/JasperReportsIntegration`
    * `./gradlew installDist
* building the distribution as zip into the build directory: `build/distributions`
    * `./gradlew assembleDist`

The following naming conventions will be used: `JasperReportsIntegration-<project.version>-<jasperreportsVersion>.zip`.

A *.tar file will also be created. 




