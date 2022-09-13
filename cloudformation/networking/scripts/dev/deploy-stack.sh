#!/bin/bash

REGION="us-east-1";
ENV="dev";
STACK_NAME="sq-$ENV-networking";
SCRIPT_DIR=$(dirname "$0");
TEMPLATE_FILE=$SCRIPT_DIR/../../template.yaml;

aws cloudformation deploy \
--region $REGION \
--stack-name $STACK_NAME \
--template-file $TEMPLATE_FILE \
--tags Env=$ENV \
--parameter-overrides \
VPCCidrBlock=10.0.0.0/16 \
PublicSubnet1CidrBlock=10.0.3.0/24 \
PublicSubnet2CidrBlock=10.0.4.0/24 \
Subnet1AZ=us-east-1a \
Subnet2AZ=us-east-1b \
Env=$ENV;
