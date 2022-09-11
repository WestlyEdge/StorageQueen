#!/bin/bash

SCRIPT_DIR=$(dirname "$0");

REPO_NAME=${1} # docker image repo name arg must be passed in as the first input arg
IMAGE_NAME=${2} # docker image name arg must be passed in as the second input arg
IMAGE_TAG=${3} # docker image tag arg must be pased in as the third input arg

if [ -z "$REPO_NAME" ]
then
    echo "ERROR: docker image repo name arg must be passed in as the first input arg";
    exit 1; # terminate and indicate error
fi

if [ -z "$IMAGE_NAME" ]
then
    echo "ERROR: docker image name arg must be passed in as the second input arg";
    exit 1; # terminate and indicate error
fi

if [ -z "$IMAGE_TAG" ]
then
    echo "ERROR: docker image tag arg must be passed in as the third input arg";
    exit 1; # terminate and indicate error
fi

docker build --tag "$REPO_NAME/$IMAGE_NAME:$IMAGE_TAG" "$SCRIPT_DIR/../$IMAGE_NAME";