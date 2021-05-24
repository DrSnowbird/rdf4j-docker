#!/bin/bash

MY_DIR=$(dirname "$(readlink -f "$0")")

if [ $# -lt 1 ]; then
    echo "Usage: "
    echo "  ${0} <container_shell_command>"
    echo "e.g.: "
    echo "  ${0} ls -al "
fi

###################################################
#### ---- Change this only to use your own ----
###################################################
ORGANIZATION=openkbs
baseDataFolder="$HOME/data-docker"

###################################################
#### **** Container package information ****
###################################################
DOCKER_IMAGE_REPO=`echo $(basename $PWD)|tr '[:upper:]' '[:lower:]'|tr "/: " "_" `
imageTag="${ORGANIZATION}/${DOCKER_IMAGE_REPO}"

## -- transform '-' and space to '_' 
#instanceName=`echo $(basename ${imageTag})|tr '[:upper:]' '[:lower:]'|tr "/\-: " "_"`
instanceName=`echo $(basename ${imageTag})|tr '[:upper:]' '[:lower:]'|tr "/: " "_"`

echo "---------------------------------------------"
echo "---- shell into the Container for ${imageTag}"
echo "---------------------------------------------"

if [ ${instanceName} ]; then
    for war in `ls ./deploy/*.war`; do
        echo "... Deploying $war ..."
        docker cp  $war ${instanceName}:/opt/tomcat/webapps/
    done
else
    echo "*** ERROR: No Container instance, ${instanceName}, found! "
    echo "***    --> Hence Abort the $(basename $0) operation! now"
    echo "*** Please run (./run.sh) the container first, then deploy WAR files!"
fi


