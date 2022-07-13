FROM registry.access.redhat.com/ubi8/openjdk-11:1.11

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en'

COPY --chown=185 target/kafdrop-3.31.0-SNAPSHOT.jar /deployments/

WORKDIR /deployments
USER 185
ENV AB_JOLOKIA_OFF=""
ENV JAVA_OPTS="--add-opens=java.base/sun.nio.ch=ALL-UNNAMED -Dspring.config.location=resources/application.yml"
ENV JAVA_APP_JAR="/deployments/kafdrop-3.31.0-SNAPSHOT.jar"
