@echo off

REM ###########################################################
REM # set the environment for JasperReportsIntegration first
REM ###########################################################

set DIR=%~dp0
pushd %DIR%\..
set OC_JASPER_CONFIG_HOME=%CD%
popd

REM pass ALL parameters to the class
java -cp "lib/*" main/CommandLine setConfigDir %*
