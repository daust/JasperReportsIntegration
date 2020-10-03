###########################################################
# set the environment for JasperReportsIntegration first
###########################################################
pushd ..
OC_JASPER_CONFIG_HOME=$(pwd)
export OC_JASPER_CONFIG_HOME

echo
echo
echo ============================================================
echo == Configuration will be used from: 
echo ==   $OC_JASPER_CONFIG_HOME
echo == Starting Jetty on port 8090
echo == 
echo == Homepage: http://localhost:8090/jri
echo ==
echo == Configuration: conf/application.properties
echo ============================================================
echo
echo

pushd jetty
java -jar start.jar -Djetty.port="8090" -Dorg.apache.jasper.compiler.disablejsr199=true
popd
popd
