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

# Resource
* [RDF4J](https://rdf4j.org/)
* [RDF4J-Documentation](https://rdf4j.org/documentation/)
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
