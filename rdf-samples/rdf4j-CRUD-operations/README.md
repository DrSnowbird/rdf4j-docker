# RDF4J REST API

# Overview 
The following is an overview of the resources that are available from RDF4J server.
```
<RDF4J_URL>
   /protocol         : protocol version (GET)
   /repositories     : overview of available repositories (GET)
      /<REP_ID>      : query evaluation and administration tasks on a repository
                       (GET/POST/PUT/DELETE)
       /config       : repository configuration (GET/POST)
       /statements   : repository statements (GET/POST/PUT/DELETE)
       /contexts     : context overview (GET)
       /size         : # statements in repository (GET)
       /rdf-graphs   : named graphs overview (GET)
           /service  : SPARQL Graph Store operations on indirectly referenced named
                       graphs in repository (GET/PUT/POST/DELETE)
           /<NAME>   : SPARQL Graph Store operations on directly referenced named
                       graphs in repository (GET/PUT/POST/DELETE)
       /namespaces   : overview of namespace definitions (GET/DELETE)
           /<PREFIX> : namespace-prefix definition (GET/PUT/DELETE)
       /transactions : starting point for creating transactions on the current repository (POST)
           /<TXN_ID> : a specific transaction which can be updated (PUT/DELETE)
```
For example:
```
http://0.0.0.0:28080/rdf4j-server/repositories/rdf-shacl/rdf-graphs/service

# Resources
1. https://rdf4j.org/documentation/reference/rest-api/
