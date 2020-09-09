###########################################################
# set the environment for JasperReportsIntegration first
###########################################################

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

pushd $DIR/..

OC_JASPER_CONFIG_HOME=$(pwd)
export OC_JASPER_CONFIG_HOME

#JETTY_DIST=jetty-hightide-8.1.5.v20120716
JETTY_DIST=jetty
JETTY_HOME=$OC_JASPER_CONFIG_HOME/jetty/$JETTY_DIST

echo ============================================================
echo == Configuration will be used from: 
echo ==   $OC_JASPER_CONFIG_HOME
echo == 
echo == Starting Jetty on port 8090
echo == 
echo == Homepage: http://localhost:8090/JasperReportsIntegration
echo ==
echo == Configuration: conf/application.properties
echo ============================================================
echo

#deploy first if jasperreportsintegration.war not exists
if [ ! -f $JETTY_HOME/webapps/JasperReportsIntegration.war ]; then
    echo "First deploy the JasperReportsIntegration.war file to Jetty ..."
    cp $DIR/../webapp/JasperReportsIntegration.war $JETTY_HOME/webapps
fi

echo "Start Jetty ..."
pushd $JETTY_HOME
java -jar start.jar -Djetty.port="8090" -Dorg.apache.jasper.compiler.disablejsr199=true
popd
popd
