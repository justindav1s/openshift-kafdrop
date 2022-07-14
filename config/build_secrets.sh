#!/bin/bash


oc create secret generic kafdrop-kafka-properties \
    --from-file=kafka.properties=kafka.properties \
    --dry-run=client -o yaml > ../chart/templates/kafdrop-kafka-properties-secret.yaml 

oc create configmap kafdrop-kafka-properties \
    --from-file=kafka.properties=kafka.properties \
    --dry-run=client -o yaml > ../chart/templates/kafdrop-kafka-properties-configmap.yaml     