#!/bin/bash

REGION="us-east-1";
ENV="prod";
STACK_NAME="sq-$ENV-eks-cluster";
SCRIPT_DIR=$(dirname "$0");
TEMPLATE_FILE=$SCRIPT_DIR/../../template.yaml;

aws cloudformation deploy \
--region $REGION \
--stack-name $STACK_NAME \
--template-file $TEMPLATE_FILE \
--tags Env=$ENV \
--capabilities "CAPABILITY_NAMED_IAM" \
--parameter-overrides \
Env=$ENV \
NetworkingStackName="sq-$ENV-networking" \
KubernetesVersion="1.23";
