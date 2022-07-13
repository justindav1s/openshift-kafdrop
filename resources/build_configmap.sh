#!/bin/bash


  oc create configmap residency-kafdrop-application-yaml \
    --from-file=application.yml=application.yml \
    -o yaml \
    --dry-run=client \
    > ../chart/templates/residency-kafdrop-application-yaml-configmap.yaml 
