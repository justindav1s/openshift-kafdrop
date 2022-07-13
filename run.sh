#!/bin/bash

KAFKA_PROPERTIES_FILE=config/kafka.properties

java -cp /Users/justin/rh/VW/residency-Kafdrop/config --add-opens=java.base/sun.nio.ch=ALL-UNNAMED \
    -Dspring.config.location=resources/application.yml \
    -jar target/kafdrop-3.31.0-SNAPSHOT.jar