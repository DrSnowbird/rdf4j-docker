# RDF4J Server (w/SPARQL Endpoint) + RDF4J Workbench (Web UI) + Docker + OpenJDK 8 + Python 3 + Node 16 + Maven 3
[![](https://images.microbadger.com/badges/image/openkbs/rdf4j-docker.svg)](https://microbadger.com/images/openkbs/rdf4j-docker "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/rdf4j-docker.svg)](https://microbadger.com/images/openkbs/rdf4j-docker "Get your own version badge on microbadger.com")

# Build (local image)
```
make build
    or
./build.sh
```

# Run (recommended for easy-start)

```
./run.sh
```

## RDF4J Servers or Workbench
* When entering RDF4J Server URL: You need to use IP address which can't be '0.0.0.0' (you will get error saying 'can't connect' something like that). For example, the correct RDFJ Server URL should be like this (replace with your own host's IP address below)
```
RDF4J Server: http://192.168.0.204:28080/rdf4j-server
```
(Both HTTP and HTTPS)
* http:
```
http://<host_ip>:28880/rdf4j-workbench
http://<host_ip>:28880/rdf4j-server
```
* https:
```
https://<host_ip>:28443/rdf4j-workbench
https://<host_ip>:28443/rdf4j-server
```
## Tomcat Server
Web Browser: login `tomcat` (or `admin`) with a default password, `password`
```
http://<host_ip>:28880/
    or
https://<host_ip>:28443/
```

# Deploy a WAR file
You can deploy additional WAR files in this Docker Container.
To deploy an WAR file, first make sure that you already started container and then just drop your WAR file into the `./deploy` directory, then run the command below. You can deploy multiple WAR files by drop all of them into the deploy directory.
```
./deploy.sh
```

If your WAR files need to use additional Docker ports, you will need to modify '.env' file to add additional ports mapping.

# Setting a specific password for the admin account
-------------------------------------------------
To change TOMCAT password for login 'admin', you can edit './env' file as:
```
TOMCAT_PASSWORD=SomewSecretPassword!
```

# RDF4J Query
* Queries on a specific repository with ID <ID> can be evaluated by sending requests to: <RDF4J_URL>/repositories/<ID>. This resource represents a SPARQL query endpoint. 
* Both GET and POST methods are supported. The GET method is preferred as it adheres to the REST architectural style. 
* The POST method should be used in cases where the length of the (URL-encoded) query exceeds practicable limits of proxies, servers, etc. In case a POST request is used, the query parameters should be sent to the server as www-form-urlencoded data.
# HTTP Content Types:
* [RDF4J - Content Types](https://rdf4j.org/documentation/reference/rest-api/#content-types)
```
Content types	
The following tables summarizes the MIME types for various document formats that are relevant to this protocol.	
MIME types for RDF formats (REQUEST)
Format	MIME type
-----------------
RDF/XML	    application/rdf+xml
N-Triples	text/plain
Turtle	    text/turtle
N3	        text/rdf+n3
N-Quads	    text/x-nquads
JSON-LD	    application/ld+json
RDF/JSON	application/rdf+json
TriX	    application/trix
TriG	    application/x-trig
RDF4J Binary RDF	application/x-binary-rdf

MIME types for variable binding formats	(RESPONSE)
Format	MIME type
-----------------
SPARQL Query Results XML	application/sparql-results+xml
SPARQL Query Results JSON	application/sparql-results+json
Binary Results Format	    application/x-binary-rdf-results-table

MIME types for boolean result formats	
Format	MIME type
-----------------
SPARQL Query Results XML	application/sparql-results+xml
SPARQL Query Results JSON	application/sparql-results+json
Plain Text Boolean Result	text/boolean
```

# Resource
* [W3C SPARQL 1.1 Update - W3C Recommendation 21 March 2013](https://www.w3.org/TR/sparql11-update/)
* [RDF4J](https://rdf4j.org/)
* [RDF4J - Supported MIME (Content) Types](http://archive.rdf4j.org/users/ch10.html#table-var-binding-formats)
* [RRD4J REST API](https://rdf4j.org/documentation/reference/rest-api/)
* [RDF4J-Documentation](https://rdf4j.org/documentation/)
* [DrSnowbird/jena-fuseki-docker, Apache Jena TDB/TDB2 RDF Server](https://github.com/DrSnowbird/jena-fuseki-docker)
* [DrSnowbird/blazegraph-docker, high-performance RDF Server](https://github.com/DrSnowbird/blazegraph-docker)
* [DrSnowbird/json2rdf-docker, converting JSON to RDF](https://github.com/DrSnowbird/json2rdf-docker)
* [DrSnowbird/visualRDF, Visualize RDF Graph](https://github.com/DrSnowbird/visualRDF)
* [DrSnowbird/SANSA-RDF](https://github.com/DrSnowbird/SANSA-RDF)

# Reference: 
* [Apache Tomcat](https://tomcat.apache.org/)
* [Apache Tomcat9 SSL/TLS Configuration HOW-TO](https://tomcat.apache.org/tomcat-9.0-doc/ssl-howto.html)
* [Apache Tomcat change 8080 to 80 port](https://www.baeldung.com/tomcat-change-port)
* [Apache Tomcat Access Denied 403](https://itpeopleblog.wordpress.com/2018/03/19/access-tomcat8-application-manager-gui/)
* [Access tomcat8 Application Manager GUI](https://itpeopleblog.wordpress.com/2018/03/19/access-tomcat8-application-manager-gui/)

# Releases information
* [See Releases Information](https://github.com/DrSnowbird/jdk-mvn-py3#releases-information)



