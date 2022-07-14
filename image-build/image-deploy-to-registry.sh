#!/bin/bash

BUILD_TOOL=$1 #podman or docker
echo $BUILD_TOOL
if [[ "$BUILD_TOOL" != "podman" ]] && [[ "$BUILD_TOOL" != "docker" ]]; then
    echo "Usage: build.sh [podman|docker]"
    echo "Please specify the build tool you want to use!📦"
    exit 1
fi

IMAGE=kafdrop
REGISTRY_HOST=${QUAYIO_HOST}
REPO=justindav1s
VERSION=latest

$BUILD_TOOL login ${REGISTRY_HOST} -u ${QUAYIO_USER} -p ${QUAYIO_PASSWORD}

TAG=$REGISTRY_HOST/$REPO/$IMAGE:$VERSION

$BUILD_TOOL tag $IMAGE $TAG

$BUILD_TOOL push $TAG