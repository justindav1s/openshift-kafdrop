#!/bin/bash

PROJECT=labs-test
USER=sim-reg-user

rm -rf $USER-keystore.jks

oc get secret $USER -n $PROJECT -o jsonpath='{.data.user\.p12}' | base64 --decode > $USER.p12
oc get secret $USER -n  $PROJECT -o jsonpath='{.data.user\.password}' | base64 --decode > $USER.password

export PASSWORD=`cat  $USER.password`
echo PASSWORD: $PASSWORD

keytool -importkeystore \
    -srckeystore $USER.p12 -srcstoretype pkcs12 -srcstorepass $PASSWORD \
    -destkeystore $USER-keystore.jks -deststoretype jks -deststorepass $PASSWORD


oc create secret generic $USER-keystore --from-file=$USER-keystor.jks=$USER-keystore.jks --dry-run=client -o yaml > $USER-keystore-secret.yaml

rm -rf $USER.p12 $USER.password
