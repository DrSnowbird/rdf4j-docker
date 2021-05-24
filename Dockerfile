FROM openkbs/jdk-tomcat

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

#### ------------------------
#### ---- APP: RDF4J     ----
#### ------------------------
####
#ENV CATALINA_HOME=${CATALINA_HOME:-/opt/tomcat}
#ENV CATALINA_WEBAPPS=${CATALINA_WEBAPPS:-/opt/tomcat/webapps}
#ENV TOMCAT_HOME=${TOMCAT_HOME:-/opt/tomcat}

ENV RDF4J_VERSION=${RDF4J_VERSION:-3.6.3}
ENV RDF4J_HOME=${RDF4J_HOME:-/opt/eclipse-rdf4j-${RDF4J_VERSION}}
ENV RDF4J_DATA=${RDF4J_DATA:-/opt/eclipse-rdf4j-${RDF4J_VERSION}/data}
ENV JVM_PARAMS=${JVM_PARAMS:-"-Xms1g -Xmx4g"}

ENV USER=tomcat
ENV HOME=/home/${USER}
USER ${USER}
WORKDIR ${HOME}

RUN curl -sS -o ${HOME}/rdf4j.zip -L http://download.eclipse.org/rdf4j/eclipse-rdf4j-${RDF4J_VERSION}-sdk.zip && \
    unzip ${HOME}/rdf4j.zip && \
    sudo mv eclipse-rdf4j-${RDF4J_VERSION} /opt && \
    rm ${HOME}/rdf4j.zip

#RUN mv /opt/eclipse-rdf4j-${RDF4J_VERSION}/war/*.war ${CATALINA_WEBAPPS}
RUN cp ${RDF4J_HOME}/war/*.war ${CATALINA_WEBAPPS}

RUN echo "CATALINA_OPTS=\"\$CATALINA_OPTS \$JVM_PARAMS -Dorg.eclipse.rdf4j.appdata.basedir=\$RDF4J_DATA\"" >> ${CATALINA_HOME}/bin/setenv.sh

## -- debug only (remove these when done) --
RUN ls -al ${CATALINA_HOME}
RUN cat ${CATALINA_HOME}/bin/setenv.sh

VOLUME ${RDF4J_DATA}

EXPOSE 8080

#### ------------------------
#### ---- Start Tomcat:  ----
#### ------------------------

USER ${USER}
WORKDIR ${CATALINA_HOME}

CMD ["/launch_tomcat.sh"]

