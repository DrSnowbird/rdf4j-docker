#!/bin/bash -x

## -- RDF/XML --
#  -H 'accept: application/sparql-results+xml' \

curl -X POST \
  http://0.0.0.0:28080/rdf4j-server/repositories/rdfs001 \
  -H 'accept: application/sparql-results+json' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/sparql-query' \
  -H 'postman-token: 1cde015b-b293-80df-ba6c-f0f06b1d4963' \
  -d 'PREFIX dig: <http://dig.isi.edu/>
PREFIX spider: <http://spiderman.example.org/>

PREFIX : <http://dig.isi.edu/>
PREFIX rel: <http://www.perceive.net/schemas/relationship/>

SELECT ?s ?p ?o
FROM dig:
WHERE {
    ?s ?p ?o .
}'
