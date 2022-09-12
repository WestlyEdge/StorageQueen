#!/bin/bash

SCRIPT_DIR=$(dirname "$0");

REPO_NAME=${1} # docker image repo name arg must be passed in as the first input arg
IMAGE_NAME=${2} # docker image name arg must be passed in as the second input arg
IMAGE_TAG=${3} # docker image tag arg must be passed in as the third input arg

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
    IMAGE_TAG=$(date +%Y.%m.%d.%H.%M);
fi

$SCRIPT_DIR/docker-build.sh $REPO_NAME $IMAGE_NAME $IMAGE_TAG;
$SCRIPT_DIR/docker-push.sh $REPO_NAME $IMAGE_NAME $IMAGE_TAG;