###########################################################
# creates the config directoy and copies all required files
# and directories if it does NOT yet exist
###########################################################

#check if parameter was set
if [ $# -ne 2 ]
  then
    echo ""
    echo "Error: Invalid number of parameters"
    echo ""
    echo "Creates a config directory for the JasperReportsIntegration."
    echo "Copies directories conf, logs and reports with all files from "
    echo "  the template directory, typically where you downloaded the files."
    echo ""
    echo "Syntax:"
    echo "  createConfigDir.sh <target config directory> <template directory>"
    echo "  e.g. ./createConfigDir.sh /tmp/jri .."
    exit 1
fi

# check existence of target directory and copy files
DIR="$1"
TEMPLATE_DIR="$2"

if [ -d "$DIR" ]; then
    ### Directory exists, stop ###
    echo "Directory ${DIR} already exists, can only be used for non-existing directories."
    exit 1
else
    ### Directory does not exist, create directory and copy files ###
    echo "Directory ${DIR} will be created"
    mkdir ${DIR}

    echo "Copy files conf/*, reports/* and create directory logs"
    cp -R ${TEMPLATE_DIR}/conf ${DIR}
    mkdir ${DIR}/logs
    cp -R ${TEMPLATE_DIR}/reports ${DIR}
    
fi