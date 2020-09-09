@echo off

REM =====================================================================
REM # When you encounter compile errors with Jetty and Java 8
REM # then set use a Java runtime 6 or 7:
REM HTTP ERROR 500, Problem accessing /JasperReportsIntegration/. Reason:
REM PWC6033: Error in Javac compilation for JSP
REM PWC6199: Generated servlet error:
REM The type java.util.Map$Entry cannot be resolved. It is indirectly referenced from required .class files

REM set JRE_HOME=d:\Program Files\Java\jdk1.6.0_04\jre
REM set PATH=%JRE_HOME%\bin;%PATH%
REM =====================================================================


REM 
set JETTY_DIST=jetty

REM ###########################################################
REM # set the environment for JasperReportsIntegration first
REM ###########################################################

set DIR=%~dp0
pushd %DIR%\..

set OC_JASPER_CONFIG_HOME=%CD%
set JETTY_HOME=%OC_JASPER_CONFIG_HOME%\jetty\%JETTY_DIST%

echo ============================================================
echo == Configuration will be used from: 
echo ==   %OC_JASPER_CONFIG_HOME%
echo == 
echo == Starting Jetty on port 8090
echo == 
echo == Homepage: http://localhost:8090/JasperReportsIntegration
echo ==
echo == Configuration: conf/application.properties
echo ============================================================

REM deploy first if jasperreportsintegration.war not exists

if not exist "%OC_JASPER_CONFIG_HOME%\jetty\webapps\JasperReportsIntegration.war" goto DEPLOY_WAR_FILE
goto JETTY_START

:DEPLOY_WAR_FILE
echo "First deploy the JasperReportsIntegration.war file to Jetty ..."
copy "%OC_JASPER_CONFIG_HOME%\webapp\JasperReportsIntegration.war" "%JETTY_HOME%\webapps"  


:JETTY_START
echo "Start Jetty ..."
pushd "%JETTY_HOME%"
java -jar start.jar -Djetty.port="8090" -Dorg.apache.jasper.compiler.disablejsr199=true
popd
popd

