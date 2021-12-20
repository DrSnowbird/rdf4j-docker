#!/bin/bash -x

curl -L -X DELETE "http://0.0.0.0:28080/rdf4j-server/repositories/rdf-student/rdf-graphs/service?graph=http://dig.isi.edu/" \
	-H "Accept: application/sparql-results+json"
