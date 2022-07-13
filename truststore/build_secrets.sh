#!/bin/bash


./cluster-truststore-setup.sh

./user-keystore-setup.sh


oc create secret generic sim-reg-user-keystore \
    --from-file=sim-reg-user-keystore.jks=sim-reg-user-keystore.jks \
    --dry-run=client -o yaml > ../chart/templates/sim-reg-user-keystore-secret.yaml

oc create secret generic wc-test-kafka-cluster-truststore \
    --from-file=wc-test-kafka-cluster-truststore.jks=wc-test-kafka-cluster-truststore.jks \
    --dry-run=client -o yaml > ../chart/templates/wc-test-kafka-cluster-truststore-secret.yaml    