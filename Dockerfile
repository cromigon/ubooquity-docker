# Pull base image.
FROM java:8u111-jre-alpine

# Define commonly used JAVA_HOME variable and Ubooquity version
ENV \
  APP_VERSION="2.0.1"

# Install Ubooquity
RUN \
  apk --no-cache add curl unzip wget && \
  mkdir -p /config /media /ubooquity && \
  cd /ubooquity && \
  wget http://vaemendis.net/ubooquity/downloads/special/beta4/Ubooquity.jar

# Define working directory.
WORKDIR /ubooquity

# Expose Ubooquity ports
EXPOSE 2202 2502

# Declare volumes
VOLUME /config /media

# Define default command
ENTRYPOINT ["java", "-Dfile.encoding=UTF-8", "-jar", "-Xmx512m", "/ubooquity/Ubooquity.jar", "-workdir", "/config", "-headless", "-libraryport", "2202", "-adminport", "2502", "-remoteadmin"]

# Maintainer
LABEL maintainer="zer <zerpex@gmail.com>"
