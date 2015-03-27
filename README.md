## Minimal Docker image with Apache Tomcat [![Build Status](https://travis-ci.org/jeanblanchard/docker-busybox-tomcat.svg?branch=tomcat8java7)](https://travis-ci.org/jeanblanchard/docker-busybox-tomcat)

Basic [Docker](https://www.docker.com/) image to run [Apache Tomcat](http://tomcat.apache.org/).
This is based off [Busybox](http://www.busybox.net/) to keep the size minimal.

* Tomcat is installed in `/opt/tomcat`.
* A user **admin** is configured, with access to the _manager_ and _host-manager_ apps.
* Documentation and examples have been removed.


### Tags

* `latest` or `8` or `tomcat8java8`: Tomcat 8 on Oracle Java 8
* `tomcat7java8`: Tomcat 7 on Oracle Java 8
* `tomcat8java7`: Tomcat 8 on Oracle Java 7
* `7` or `tomcat7java7`: Tomcat 7 on Oracle Java 7

### Usage

Example: 

    docker run -d jeanblanchard/busybox-tomcat:tomcat8java7
