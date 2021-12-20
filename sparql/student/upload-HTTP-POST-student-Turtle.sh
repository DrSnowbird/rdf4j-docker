#!/bin/bash -x

curl -L -X POST "http://0.0.0.0:28080/rdf4j-server/repositories/rdf-student/rdf-graphs/service?graph=http://dig.isi.edu/" \
	-H "Accept: application/sparql-results+json" \
	-H "Content-Type: text/turtle" \
	--data-binary "@/mnt/user1/DATA/git-public/RDF/rdf4j-docker/sparql/student/student.ttl"
