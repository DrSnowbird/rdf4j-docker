#!/bin/bash -x

curl -L -X GET "http://0.0.0.0:28080/rdf4j-server/repositories/rdf-student/rdf-graphs/service?graph=http://dig.isi.edu/" \
	-H "Accept: application/rdf+xml"
