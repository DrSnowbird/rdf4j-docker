#!/bin/bash -x

curl -L -X POST "http://0.0.0.0:9999/bigdata/sparql" -H "Content-Type: application/sparql-query" -H "Accept: application/sparql-results+json" --data-raw "PREFIX ex: <http://www.example.org/vocabulary#>
PREFIX : <http://www.example.org/exampleDocument#>

SELECT *
FROM :ExampleMonicGraph
WHERE {
    ?s ?p ?o .
}
"
