# (Some being Duplicated from W3C RDF 1.1 TriG)
* RDF Dataset Language
* W3C Recommendation 25 February 2014

## Triple Statements
As TriG is an extention of the Turtle language it allows for any constructs from the Turtle language. Simple Triples, Predicate Lists, and Object Lists can all be used either inside a graph statement, or on their own as in a Turtle document. When outside a graph statement, the triples are considered to be part of the default graph of the RDF Dataset.

## Graph Statements
A graph statement pairs an IRI or blank node with a RDF graph. The triple statements that make up the graph are enclosed in {}.

In a TriG document a graph IRI or blank node may be used as label for more than one graph statements. The graph label of a graph statement may be omitted. In this case the graph is considered the default graph of the RDF Dataset.

# Graphs-Tests
### Using RDF4J RDF database
* First, you need to create RDF4J repository, "graph-test" as `http://0.0.0.0:28080/rdf4j-server/graph-test` as below:
```
RDF4J Server:
    http://0.0.0.0:28080/rdf4j-server/
Repository:
    graph-test 
```

### EXAMPLE 1
A RDF Dataset might contain only a single graph.
```
# This document encodes one graph.
@prefix ex: <http://www.example.org/vocabulary#> .
@prefix : <http://www.example.org/exampleDocument#> .

:G1 { :Monica a ex:Person ;
              ex:name "Monica Murphy" ;
              ex:homepage <http://www.monicamurphy.org> ;
              ex:email <mailto:monica@monicamurphy.org> ;
              ex:hasSkill ex:Management ,
                          ex:Programming . }
```


### EXAMPLE 2
A RDF Dataset may contain a default graph, and named graphs.
```
# This document contains a default graph and two named graphs.

@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix dc: <http://purl.org/dc/terms/> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .

# default graph
    {
      <http://example.org/bob> dc:publisher "Bob" .
      <http://example.org/alice> dc:publisher "Alice" .
    }

<http://example.org/bob>
    {
       _:a foaf:name "Bob" .
       _:a foaf:mbox <mailto:bob@oldcorp.example.org> .
       _:a foaf:knows _:b .
    }

<http://example.org/alice>
    {
       _:b foaf:name "Alice" .
       _:b foaf:mbox <mailto:alice@work.example.org> .
    }
```


### EXAMPLE 3
TriG provides various alternative ways to write graphs and triples, giving the data writer choices for clarity.
```
# This document contains a same data as the
previous example.

@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix dc: <http://purl.org/dc/terms/> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .

# default graph - no {} used.
<http://example.org/bob> dc:publisher "Bob" .
<http://example.org/alice> dc:publisher "Alice" .

# GRAPH keyword to highlight a named graph
# Abbreviation of triples using ;
GRAPH <http://example.org/bob>
{
   [] foaf:name "Bob" ;
      foaf:mbox <mailto:bob@oldcorp.example.org> ;
      foaf:knows _:b .
}

GRAPH <http://example.org/alice>
{
    _:b foaf:name "Alice" ;
        foaf:mbox <mailto:alice@work.example.org>
}
```
