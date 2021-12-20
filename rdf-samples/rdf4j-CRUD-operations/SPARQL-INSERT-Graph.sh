#!/bin/bash -x

curl 'http://0.0.0.0:28080/rdf4j-workbench/repositories/rdf-f3fend-graph/update' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  --data-raw 'update=PREFIX+ns%3A+%3Chttp%3A%2F%2Fexample.org%2Fns%23%3E%0D%0AINSERT+DATA%0D%0A%7B+GRAPH+%3Chttp%3A%2F%2Fexample%2FbookStore%3E+%7B+%3Chttp%3A%2F%2Fexample%2Fbook1%3E++ns%3Aprice++42+%7D+%7D%0D%0A%0D%0A' 
