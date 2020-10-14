@echo off

REM pass ALL parameters to the class
java -cp "../lib/*" main/CommandLine encryptPasswords %*
