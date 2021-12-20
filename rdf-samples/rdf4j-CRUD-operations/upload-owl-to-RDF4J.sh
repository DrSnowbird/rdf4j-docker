#!/bin/bash 

REPO_ID=rdf-shacl
REST_URL=${1:-"http://0.0.0.0:28080/rdf4j-server/repositories/${REPO_ID}/rdf-graph/service"}
CONTENT_TYPE=${2:-"application/rdf+xml"}
DATA_FILE=${3:-"/mnt/user1/DATA/git-public/prototype/STRATAGEM/d3fend.owl"}
GRAPH_NAME=${4:-"http://d3fend/ontology"}

PARAMS=
if [ "{GRAPH_NAME}" != "" ]; then
    PARAMS="?graph:${GRAPH_NAME}"
fi

if [ $# -lt 3 ]; then
    echo "*** Usage: $(basename $0) <REST_URL> <CONTENT_TYPE> <DATA_FILE> [<GRAPH_NAME>]"
    echo "e.g."
    echo "$(basename $0) $REST_URL $CONTENT_TYPE $DATA_FILE $GRAPH_NAME"
    echo
    echo curl -L -X POST ${REST_URL}${PARAMS} -H "Content-Type: ${CONTENT_TYPE}" -H "Accept: application/sparql-results+json" --data-binary "@${DATA_FILE}"
    exit 1
fi

# e.g.
# curl -L -X POST "http://0.0.0.0:28080/rdf4j-server/repositories/rdf-shacl/rdf-graph/service" -H "Content-Type: application/rdf+xml" -H "Accept: application/sparql-results+json" --data-binary "@/mnt/user1/DATA/git-public/prototype/STRATAGEM/d3fend.owl"

curl -L -X POST ${REST_URL}${PARAMS} -H "Content-Type: ${CONTENT_TYPE}" -H "Accept: application/sparql-results+json" --data-binary "@${DATA_FILE}"

