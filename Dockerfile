FROM alpine:3.4
MAINTAINER Niclas Björner <niclas@cromigon.se>

ENV JAVA_HOME="/usr/lib/jvm/java-1.8-openjdk/bin/java" APP_VERSION="1.10.1"

RUN apk --no-cache add openjdk8-jre-base openjdk8-jre-lib curl unzip && \
    mkdir -p /opt/ubooquity/fonts && mkdir -p /opt/ubooquity-data && mkdir -p /opt/data && \
    curl -Ss http://vaemendis.net/ubooquity/downloads/Ubooquity-${APP_VERSION}.zip -o /tmp/${APP_VERSION}.zip && \
    unzip /tmp/${APP_VERSION}.zip -d /opt/ubooquity && \
    rm /tmp/${APP_VERSION}.zip

WORKDIR /opt/ubooquity
EXPOSE 2202

ENTRYPOINT ["java", "-jar", "Ubooquity.jar", "-workdir", "/opt/ubooquity-data", "-headless"]
