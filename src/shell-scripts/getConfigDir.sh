###########################################################
# set the environment for JasperReportsIntegration first
###########################################################
CP="../lib/JasperReportsIntegration-#project.version#.jar:../lib/log4j-1.2.15.jar:../lib/commons-configuration-1.8.jar:../lib/velocity-1.7-dep.jar:../lib/jasperreports-#jasperreports.version#.jar:../lib/commons-logging-1.1.1.jar:../lib/commons-codec-1.5.jar"

# pass ALL parameters to the class
java -cp $CP main/CommandLine getConfigDir "$@"

