FROM openkbs/tomcat-docker

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

#### ------------------------
#### ---- APP: RDF4J     ----
#### ------------------------
####
#ENV CATALINA_HOME=${CATALINA_HOME:-/opt/tomcat}
#ENV CATALINA_WEBAPPS=${CATALINA_WEBAPPS:-/opt/tomcat/webapps}
#ENV TOMCAT_HOME=${TOMCAT_HOME:-/opt/tomcat}

#### ====
#### ==== This will be replaced with the latest release from the download site of the product ====
#### ====
ENV PRODUCT_VERSION=3.7.4
ENV RDF4J_VERSION=${PRODUCT_VERSION}
ENV RDF4J_HOME=${RDF4J_HOME:-/opt/eclipse-rdf4j-${RDF4J_VERSION}}
#ENV RDF4J_DATA=${RDF4J_DATA:-${HOME}/.RDF4J}

ENV JVM_PARAMS=${JVM_PARAMS:-"-Xms1g -Xmx4g"}

#ENV USER=tomcat
#ENV HOME=/home/${USER}
USER ${USER}
WORKDIR ${HOME}

RUN curl -k -o ${HOME}/rdf4j.zip -L http://download.eclipse.org/rdf4j/eclipse-rdf4j-${RDF4J_VERSION}-sdk.zip && \
    unzip ${HOME}/rdf4j.zip && \
    sudo mv eclipse-rdf4j-${RDF4J_VERSION} /opt && \
    rm ${HOME}/rdf4j.zip

RUN cp ${RDF4J_HOME}/war/*.war ${CATALINA_WEBAPPS}

