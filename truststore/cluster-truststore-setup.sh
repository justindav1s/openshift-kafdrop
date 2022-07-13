#!/bin/bash


PROJECT=labs-test
CLUSTER=wc-test-kafka-cluster

rm -rf $CLUSTER-truststore.jks

oc get secret $CLUSTER-cluster-ca-cert -n $PROJECT -o jsonpath='{.data.ca\.crt}' | base64 --decode > ca.crt

PASSWORD=monkey123
keytool -import -trustcacerts -file ca.crt -keystore $CLUSTER-truststore.jks -storepass $PASSWORD -noprompt

oc create secret generic $CLUSTER-truststore --from-file=$CLUSTER-truststore.jks=$CLUSTER-truststore.jks --dry-run=client -o yaml > $CLUSTER-truststore-secret.yaml

rm -rf ca.crt
