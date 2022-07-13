#!/bin/bash

BUILD_TOOL=$1 #podman or docker
echo $BUILD_TOOL
if [[ "$BUILD_TOOL" != "podman" ]] && [[ "$BUILD_TOOL" != "docker" ]]; then
    echo "Usage: build.sh [podman|docker]"
    echo "Please specify the build tool you want to use!📦"
    exit 1
fi

IMAGE=sim-data-handler
REGISTRY_HOST=residencyregistry.azurecr.io
REPO=sim-data-handler
VERSION=latest
USER=00000000-0000-0000-0000-000000000000

TOKEN=$(az acr login --name residencyregistry --expose-token | jq -r .accessToken)
echo TOKEN : $TOKEN
# az acr login --name residencyregistry
$BUILD_TOOL login ${REGISTRY_HOST} -u ${USER} -p $TOKEN

TAG=$REGISTRY_HOST/$REPO/$IMAGE:$VERSION

$BUILD_TOOL tag $IMAGE $TAG

$BUILD_TOOL push $TAG