#!/bin/bash

REGION="us-east-1";
ENV="prod";
STACK_NAME="sq-$ENV-networking";
SCRIPT_DIR=$(dirname "$0");
TEMPLATE_FILE=$SCRIPT_DIR/../../template.yaml;

aws cloudformation deploy \
--region $REGION \
--stack-name $STACK_NAME \
--template-file $TEMPLATE_FILE \
--tags Env=$ENV \
--parameter-overrides \
VPCCidrBlock=10.1.0.0/16 \
PrivateSubnet1CidrBlock=10.1.1.0/24 \
PrivateSubnet2CidrBlock=10.1.2.0/24 \
PublicSubnet1CidrBlock=10.1.3.0/24 \
PublicSubnet2CidrBlock=10.1.4.0/24 \
Subnet1AZ=us-east-1a \
Subnet2AZ=us-east-1b \
Env=$ENV;
