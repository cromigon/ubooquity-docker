# Pull base image.
FROM ubuntu:16.04

# Maintainer
LABEL maintainer="Niclas Björner <niclas@cromigon.se>"

# Define commonly used JAVA_HOME variable and Ubooquity version
ENV \
  JAVA_HOME="/usr/lib/jvm/java-9-oracle" \
  APP_VERSION="2.0.1" 

# Install Java.
RUN \
  apt-get update && \
  apt-get install -y software-properties-common && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java9-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Install Ubooquity
RUN \
  apt-get update && \
  apt-get install -y wget unzip curl && \
  mkdir -p /opt/ubooquity/fonts /opt/ubooquity-conf /opt/data && \
  cd /opt/ubooquity && \
  wget http://vaemendis.net/ubooquity/downloads/special/SimpletofMars/Ubooquity.jar

# Define working directory.
WORKDIR /opt/ubooquity

# Expose Ubooquity ports
EXPOSE 2202 2502

# Declare volumes
VOLUME /opt/ubooquity-conf /opt/data

# Define default command
ENTRYPOINT ["java", "-Dfile.encoding=UTF-8", "-jar", "-Xmx512m", "Ubooquity.jar", "-workdir", "/opt/ubooquity-conf", "-headless", "-libraryport", "2202", "-adminport", "2502", "-remoteadmin"]
