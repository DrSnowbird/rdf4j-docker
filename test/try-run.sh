#!/bin/bash -x

PORT_HTTP=38080
PORT_HTTPS=38443
NAME_RDF4J=rdf4j-test

DATA_DIR=./data-rdf4j

if [ ! -s $DATA_DIR ]; then
    mkdir -p $DATA_DIR
fi
sudo chown -R 1001:1001 $DATA_DIR

docker run --name=${NAME_RDF4J} --restart=no --gpus all --ulimit memlock=-1 --ulimit stack=67108864 --rm -it --user 1001:1001 -e USER_ID=1001 -e GROUP_ID=1001 -e TOMCAT_PASSWORD=password -e RDF4J_VERSION=3.7.4 -e RDF4J_DATA=/home/tomcat/.RDF4J -e JVM_PARAMS=-Xmx4g -v $(realpath $DATA_DIR):/home/tomcat/.RDF4J -p ${PORT_HTTP}:8080 -p ${PORT_HTTPS}:8443 openkbs/rdf4j-docker
