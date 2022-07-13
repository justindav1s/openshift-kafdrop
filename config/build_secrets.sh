#!/bin/bash


oc create secret generic residency-kafdrop-kafka-properties \
    --from-file=kafka.properties=kafka.properties \
    --dry-run=client -o yaml > ../chart/templates/residency-kafdrop-application-properties-secret.yaml 