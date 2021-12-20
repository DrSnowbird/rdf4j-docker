#!/bin/bash -x

#/mnt/user1/DATA/git-public/prototype/STRATAGEM/d3fend.json
#/mnt/user1/DATA/git-public/prototype/STRATAGEM/d3fend.owl
#/mnt/user1/DATA/git-public/prototype/STRATAGEM/d3fend.trig
#/mnt/user1/DATA/git-public/prototype/STRATAGEM/d3fend.ttl

RDF_SERVER=http://0.0.0.0:28080/rdf4j-server/repositories/rdf-student/rdf-graphs/service

GRAPH=http://dig.isi.edu/

RDF4J_GRAPH_SERVICE="${RDF_SERVER}?graph=${GRAPH}"

## --  Content negotiation should work from "http://schema.org/" and include all supported formats:
# text/turtle (Turtle)

# application/ld+json (JSON-LD)
# application/xhtml+xml (RDFa)

# <Type> <File-Extension>
# text/plain nt
# application/n-quads nq
# application/n-triples nt
# application/trig trig
# application/rdf+xml rdf
# application/x-turtle ttl
# text/rdf+n3 n3
# application/ld+json jsonld
 
CONTENT_TYPE="text/turtle"
#CONTENT_TYPE="application/n-quads"
#CONTENT_TYPE="application/n-triples"
#CONTENT_TYPE="application/ld+json"
#CONTENT_TYPE="application/rdf+xml"

ACCEPT_TYPE="application/sparql-results+json"

DATA_FILE_PATH="./student-graph.ttl"
#DATA_FILE_PATH="/mnt/user1/DATA/git-public/RDF/RDF-Files/d3fend.owl"

curl -L -X POST "${RDF_SERVER}" -H "Content-Type: ${CONTENT_TYPE}" -H "Accept: ${ACCEPT_TYPE}" --data-binary "@${DATA_FILE_PATH_REAL}"

DATA_FILE_PATH_REAL=$(realpath ${DATA_FILE_PATH})
# example:
# curl -L -X POST "http://0.0.0.0:28080/rdf4j-server/repositories/rdf-student-graph" -H "Accept: application/sparql-results+json" -H "Content-Type: text/turtle" --data-binary "@/mnt/user1/DATA/git-public/RDF/rdf4j-docker/sparql/student-graph.ttl"

curl -L -X POST "http://0.0.0.0:28080/rdf4j-server/repositories/rdf-student/rdf-graphs/service?graph=http://dig.isi.edu/" -H "Accept: application/sparql-results+json" -H "Content-Type: text/turtle" --data-binary "@/mnt/user1/DATA/git-public/RDF/rdf4j-docker/sparql/student.ttl"
