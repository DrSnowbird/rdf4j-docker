#!/bin/bash -x

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

################################################
#### ---- USER_OPTIONS: Optional setup:---- ####
################################################
DOCKER_ENV_FILE=".env"
USER_OPTION=
function user_ids_options() {
    #USER_OPTIONS="--user $(id -g):$(id -u)"
    USER_ID=`cat ${DOCKER_ENV_FILE} | grep  "^USER_ID=" | cut -d'=' -f2 | sed 's/ *$//g'`
    GROUP_ID=`cat ${DOCKER_ENV_FILE} | grep  "^GROUP_ID=" | cut -d'=' -f2 | sed 's/ *$//g'`
    if [ "${USER_ID}" != "" ] && [ "${USER_ID}" != "" ]; then
        USER_OPTIONS="--user ${USER_ID:-$(id -g)}:${GROUP_ID:-$(id -u)}"
    fi
}
user_ids_options
echo ">>> USER_OPTIONS=${USER_OPTIONS}"

echo "---------------------------------------------"
echo "---- shell into the Container for ${imageTag}"
echo "---------------------------------------------"

if [ ${instanceName} ]; then
    
    for war in `ls ./deploy/*.war`; do
        war_name=$(basename $war)
        echo "... Deploying ${war_name} ..."
        docker cp ${war} ${instanceName}:/opt/tomcat/webapps/${war_name} && \
            docker exec -u 0 ${instanceName} chown ${USER_ID}:${USER_ID} /opt/tomcat/webapps/${war_name}
    done
else
    echo "*** ERROR: No Container instance, ${instanceName}, found! "
    echo "***    --> Hence Abort the $(basename $0) operation! now"
    echo "*** Please run (./run.sh) the container first, then deploy WAR files!"
fi


