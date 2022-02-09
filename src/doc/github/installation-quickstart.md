## Quick Start

In order to get you up and running in the shortest amount of time you can use the included Jetty J2EE server in the download.
This is really useful for checking out the integration, for test and development environments. Typically in production environments, you can deploy it to your J2EE server of choice, i.e. Weblogic, Glassfish, Tomcat, etc. If you want to do that, follow the regular installation procedure [here](#install.installation).

### 1. Download the files
You can download the files from [here](https://github.com/daust/JasperReportsIntegration/releases) and unzip them.

### 2. Configure your database access

Edit the file ``conf/application.properties`` and configure the data source ``default`` to connect to your Oracle schema (change the parts in bold to point to the Oracle schema you want to connect to):

<pre>
#====================================================================
# JDBC datasource configuration
# http://www.orafaq.com/wiki/JDBC#Thin_driver
#====================================================================
[datasource:default]
url=jdbc:oracle:thin:<b>@192.168.2.114:1521:XE</b>
username=<b>HR</b>
password=<b>hr_password</b>
</pre>

### 3. Deploy the jri.war file

This step has only to be executed once, the J2EE application is deployed on the Jetty J2EE server initially.

### On Unix / Linux:
On the command line enter the following commands:
```
cd bin
chmod u+x *.sh
./deployJasperReportsIntegration.sh
```

### On Windows:
```
cd bin
deployJasperReportsIntegration.cmd
```

### 4. Start the J2EE server

### On Unix / Linux:
```
On the command line enter the following command:
cd bin
./startJasperReportsIntegration.sh
```

### On Windows:
```
cd bin
startJasperReportsIntegration.cmd
```

### 5. Test the server

After 30seconds you can access the server. By default I will start it on port 8090. If you need a different port, just change it in the script ``startJasperReportsIntegration``.

* ``http://localhost:8090/``   => Jetty Homepage
* ``http://localhost:8090/jri`` => Homepage of the integration

### 6. Installation of database objects

Now that we have the J2EE application working, we can install the PL/SQL API in the database. The database objects required for the integration will be installed into each application schema that you want to use with the integration. 
The installation instructions will refer to the application schema (in which you install the software) as ``[application schema]``. The password for the application schema will be referred to as ``[application schema password]``.

Thus when I use an instruction like ``sqlplus [application schema]/[application schema password]@[database]`` please replace that with the actual values of your local installation. For example, if you want to install the integration kit into the schema ``HR`` with the password ``hr1`` into your local XE instance (having a TNS entry named ``xe``) then this instruction translates to:
```
sqlplus hr/hr1@xe
```

### 6.1 Database installation (SYS)
First of all we need to grant the required privileges to the Oracle user who will own the packages for the integration.

1. Extract the downloaded zip file.
2. Open a command shell:
    * e.g. on Windows: ``Start > Execute : cmd``

3. Go to the subdirectory sql (of where you extracted the file):
```
cd sql
```

4. Connect as SYS to the local instance (using sqlplus)
```
sqlplus "sys/[sys password]@[database] as sysdba"
```

5. Run the installation script (and pass the name of the target application schema as a parameter)
```
@sys_install.sql [application schema]
```

6. [optional] If you are installing on an Oracle Release 11.0 and higher, you have to grant the required network privileges to the application schema. 
    * For 11g use: 
        ```
        @sys_install_acl_11g.sql [application schema] [server name]
        ```
        e.g. (installing into schema SCOTT and calling url http://localhost:8080/jri)
        ```
        @sys_install_acl_11g.sql SCOTT localhost
        ```
    * For 12c and above use: 
        ```
        @sys_install_acl_12_and_above.sql [application schema] [server name]
        ```
        e.g. (installing into schema SCOTT and calling url http://localhost:8080/jri)
        ```
        @sys_install_acl_12_and_above.sql SCOTT localhost
        ```

6.2 Database installation (Application Schema)

1. Open a command shell:
    * e.g. on Windows: ``Start > Execute : cmd``

2. Go to the subdirectory sql (of where you extracted the file):
```
cd sql
```

3. Change encoding to Unicode for the sql files
```
On Windows: set NLS_LANG=AMERICAN_AMERICA.AL32UTF8
On Linux/Unix: export NLS_LANG=AMERICAN_AMERICA.AL32UTF8
```

4. Connect as the application schema to the local instance (using sqlplus)
```
sqlplus [application schema]/[application schema password]@[database]
```

5. Run the installation script
```
@user_install.sql
```

### 7. Installation of the test application

The test application will allow for basic testing of the integration with all relevant parts. Install the application file ``apex\[apex version]\f201_JasperReportsIntegration-Test_[version].sql`` into your workspace. 

Please always pick the highest APEX version, e.g. when running APEX 19.1 and above (19.2, 20.1, ...), please install ``apex\APEX 19.1\f201_JasperReportsIntegration-Test_2.6.1.sql``.
