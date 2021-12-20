#!/bin/bash -x

#/mnt/user1/DATA/git-public/prototype/STRATAGEM/d3fend.json
#/mnt/user1/DATA/git-public/prototype/STRATAGEM/d3fend.owl
#/mnt/user1/DATA/git-public/prototype/STRATAGEM/d3fend.trig
#/mnt/user1/DATA/git-public/prototype/STRATAGEM/d3fend.ttl

RDF_SERVER=http://192.168.0.124:28080/rdf4j-server/repositories/rdf-d3fend/add
CONTENT_TYPE="application/rdf+xml"
DATA_FILE_PATH="@/mnt/user1/DATA/git-public/RDF/RDF-Files/d3fend.owl"

curl -L -X POST "${RDF_SERVER}" -H "Content-Type: ${CONTENT_TYPE}" -H "Accept: application/sparql-results+json" --data-binary ${DATA_FILE_PATH}

