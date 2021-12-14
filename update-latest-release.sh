#!/bin/bash -x

LATEST_URL=https://rdf4j.org/download/
LATEST_VERSION=3.7.4
function get_latest_release_tomcat() {
    ## -- you need to manual modify this lin to match the latest download URL specifics.
    LATEST_VERSION=`curl --silent ${LATEST_URL} 2>&1 | grep "(latest)" | head -n 1 | awk '{print $2}'`
}
get_latest_release_tomcat

CONFIG_FILE=${1:-./Dockerfile}
CONFIG_KEY="PRODUCT_VERSION"
CONFIG_VALUE=${LATEST_VERSION}

function replaceValueInConfig() {
    FILE=${1}
    KEY=${2}
    VALUE=${3}
    #sed -i 's#^ENV[[:blank:]]*'$KEY'[[:blank:]]*=.*/ENV '$KEY'='$VALUE'#gm' $FILE
    #sed -i 's#^ARG[[:blank:]]*'$KEY'[[:blank:]]*=.*#ARG '$KEY'='$VALUE'#gm' $FILE
    sed -i 's#^\(ARG\|ENV\)[[:blank:]]*'$KEY'[[:blank:]]*=.*#\1 '$KEY'='"$VALUE"'#gm' $FILE
    echo "results (after replacement) with new value:"
    cat $FILE |grep "${CONFIG_KEY}"
}

replaceValueInConfig ${CONFIG_FILE} ${CONFIG_KEY} ${CONFIG_VALUE}

make build
