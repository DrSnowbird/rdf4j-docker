#!/bin/bash -x

curl 'http://0.0.0.0:28080/rdf4j-workbench/repositories/rdf-shacl/create' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  --data-raw 'type=memory-rdfs-lucene&Repository+ID=rdf-student-graph&Repository+title=rdf-student-graph&Persist=true&Sync+delay=0' 
