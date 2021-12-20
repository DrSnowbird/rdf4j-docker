# How to use CURL to create RDF4J Repository using REST API

# Resources - Native Stor + SHACL
* [RDF4j - Documentation](https://rdf4j.org/documentation/reference/configuration/#shacl-sail)

# Illustration to create a `graph-test` repository with `NativeStore + SHACL`"

# How to use CURL to create RDF4J Repository - `graph-test`
## 1. Create a TTL (Tutle) file `./rdf4j-Native+Shacl.ttl` as:
```
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>.
@prefix rep: <http://www.openrdf.org/config/repository#>.
@prefix sr: <http://www.openrdf.org/config/repository/sail#>.
@prefix sail: <http://www.openrdf.org/config/sail#>.
@prefix ms: <http://www.openrdf.org/config/sail/memory#>.
@prefix sb: <http://www.openrdf.org/config/sail/base#>.
@prefix ssc: <http://rdf4j.org/config/sail/shacl#> .

[] a rep:Repository ;
   rep:repositoryID "graph-test" ;
   rdfs:label "test Native store" ;
   rep:repositoryImpl [
      rep:repositoryType "openrdf:SailRepository" ;
      sr:sailImpl [
	 sail:sailType "rdf4j:ShaclSail" ;
	 ssc:parallelValidation true;
         ssc:validationResultsLimitTotal 300;
         sail:delegate [
             sail:sailType "openrdf:NativeStore" ;
	     ms:persist true ;
    	     ms:syncDelay 120
         ];
      ]
   ].
```
## 2. Run the CURL command as:
* the URL with `graph-test` at the ending as the new Repository ID to create.
* Use HTTP PUT protocol (not POST!)
```
curl -X PUT -H "Content-Type: text/turtle" --data-binary @rdf4j-Native+Shacl.ttl http://0.0.0.0:28080/rdf4j-server/repositories/graph-test
```
