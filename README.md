# RDF4J Server (w/SPARQL Endpoint) + RDF4J Workbench (Web UI) + Docker + OpenJDK 8 + Maven 3.6 + Node 15
[![](https://images.microbadger.com/badges/image/openkbs/rdf4j-docker.svg)](https://microbadger.com/images/openkbs/rdf4j-docker "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/rdf4j-docker.svg)](https://microbadger.com/images/openkbs/rdf4j-docker "Get your own version badge on microbadger.com")

# Run (recommended for easy-start)

```
./run.sh
```
Then, open Web Browser: login `tomcat` (or `admin`) with default password, `ChangeNow!`
```
http://<host_ip>:28880/
    or
https://<host_ip>:28443/
```

# Build (local image)
```
make build
    or
./build.sh
```

# Deploy a WAR file
You can deploy additional WAR files in this Docker Container.
To deploy an WAR file, first make sure that you already started container and then just drop your WAR file into the `./deploy` directory, then run the command below. You can deploy multiple WAR files by drop all of them into the deploy directory.
```
./deploy.sh
```

# Setting a specific password for the admin account
-------------------------------------------------

If you want to use a preset password instead of a randomly generated one, you can
set the environment variable `TOMCAT_PASSWORD` to your specific password when running the container:
```
docker run -d -p 8080:8080 -p 8443:8443-e TOMCAT_PASSWORD="mypass" openkbs/jdk-tomcat
```

# Resource
[RDF4J](https://rdf4j.org/)
[RDF4J-Documentation](https://rdf4j.org/documentation/)

# Reference: 
* [Apache Tomcat](https://tomcat.apache.org/)
* [Apache Tomcat9 SSL/TLS Configuration HOW-TO](https://tomcat.apache.org/tomcat-9.0-doc/ssl-howto.html)
* [Apache Tomcat change 8080 to 80 port](https://www.baeldung.com/tomcat-change-port)
* [Apache Tomcat Access Denied 403](https://itpeopleblog.wordpress.com/2018/03/19/access-tomcat8-application-manager-gui/)
* [Access tomcat8 Application Manager GUI](https://itpeopleblog.wordpress.com/2018/03/19/access-tomcat8-application-manager-gui/)

# Releases information
* [See Releases Information](https://github.com/DrSnowbird/jdk-mvn-py3#releases-information)
