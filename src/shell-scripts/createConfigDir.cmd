@echo off
setlocal 

REM ###########################################################
REM # creates the config directoy and copies all required files
REM # and directories if it does NOT yet exist
REM ###########################################################

REM check if two parameters were passed
REM check second parameter
if "%2"=="" goto SYNTAX

set DIR=%1
set TEMPLATE_DIR=%2

echo Check existence of target directory %DIR% and copy files from %TEMPLATE_DIR%
echo.
if exist %DIR% (
    REM ### Directory exists, stop ###
    echo Directory %DIR% already exists, can only be used for non-existing directories.
    goto EOF
) else (
    REM ### Directory does not exist, create directory and copy files ###
    echo Directory %DIR% will be created
    mkdir %DIR%

    echo Copy files conf\*, reports\* and create directory logs
	echo xcopy /s /i %TEMPLATE_DIR%\conf %DIR%\conf
    xcopy /s /i %TEMPLATE_DIR%\conf %DIR%\conf
	echo mkdir %DIR%\logs
    mkdir %DIR%\logs
    echo xcopy /s /i %TEMPLATE_DIR%\reports %DIR%\reports
	xcopy /s /i %TEMPLATE_DIR%\reports %DIR%\reports
)

goto EOF
echo.

:SYNTAX
echo.
echo Creates a config directory for the JasperReportsIntegration.
echo Copies directories conf, logs and reports with all files from 
echo   the template directory, typically where you downloaded the files.
echo.
echo Syntax:
echo   createConfigDir.sh ^<target config directory^> ^<template directory^>
echo   e.g. createConfigDir.cmd  c:\app\JasperReportsIntegration ..
echo.


:EOF
