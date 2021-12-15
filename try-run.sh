#!/bin/bash -x

docker run --name=rdf4j-docker --restart=no --gpus all --ulimit memlock=-1 --ulimit stack=67108864 --rm -it --user 1001:1001 -e USER_ID=1001 -e GROUP_ID=1001 -e TOMCAT_PASSWORD=password -e RDF4J_VERSION=3.7.4 -e RDF4J_DATA=/home/tomcat/.RDF4J -e JVM_PARAMS=-Xmx4g -v /mnt/user1/DATA/git-public/RDF/rdf4j-docker/data-rdf4j:/home/tomcat/.RDF4J -v /mnt/user1/DATA/git-public/RDF/rdf4j-docker/workspace:/home/tomcat/workspace -p 28080:8080 -p 28443:8443 openkbs/rdf4j-docker
