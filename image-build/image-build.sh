#!/bin/bash

BUILD_TOOL=$1 #podman or docker
echo $BUILD_TOOL
if [[ "$BUILD_TOOL" != "podman" ]] && [[ "$BUILD_TOOL" != "docker" ]]; then
    echo "Usage: build.sh [podman|docker]"
    echo "Please specify the build tool you want to use!📦"
    exit 1
fi

IMAGE=kafdrop

$BUILD_TOOL build -t ${IMAGE} -f ../Dockerfile ..

