# Busybox with a Tomcat installation

FROM jeanblanchard/busybox-java:8
MAINTAINER Jean Blanchard <jean@blanchard.io>

# Expose web port
EXPOSE 8080

# Tomcat Version
ENV TOMCAT_VERSION_MAJOR 8
ENV TOMCAT_VERSION_FULL  8.0.22

# Download and install
RUN curl -kLO https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_VERSION_MAJOR}/v${TOMCAT_VERSION_FULL}/bin/apache-tomcat-${TOMCAT_VERSION_FULL}.tar.gz &&\
    gunzip apache-tomcat-${TOMCAT_VERSION_FULL}.tar.gz &&\
    tar -xf apache-tomcat-${TOMCAT_VERSION_FULL}.tar -C /opt &&\
    rm apache-tomcat-${TOMCAT_VERSION_FULL}.tar &&\
    ln -s /opt/apache-tomcat-${TOMCAT_VERSION_FULL} /opt/tomcat &&\
    rm -rf /opt/tomcat/webapps/examples /opt/tomcat/webapps/docs

# Configuration
ADD tomcat-users.xml /opt/tomcat/conf/
RUN sed -i 's/52428800/5242880000/g' /opt/tomcat/webapps/manager/WEB-INF/web.xml 

# Set environment
ENV CATALINA_HOME /opt/tomcat

# Launch Tomcat on startup
CMD ${CATALINA_HOME}/bin/catalina.sh run
