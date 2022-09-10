#!/bin/bash

REGION="us-east-1";
STACK_NAME="sq-teamcity";
SCRIPT_DIR=$(dirname "$0");
TEMPLATE_FILE="$SCRIPT_DIR/../template.yaml";

aws cloudformation deploy \
--region $REGION \
--stack-name $STACK_NAME \
--template-file $TEMPLATE_FILE \
--capabilities "CAPABILITY_NAMED_IAM" \
--parameter-overrides \
InstanceType="t2.medium" \
ImageId="ami-05fa00d4c63e32376" \
KeyPairName="storage-queen-keypair" \
EC2HostPort=80 \
TeamCityVersion="2022.04.3" \
SecretsManagerName="sq.teamcity" \
PostgresPasswordKey="POSTGRES_USER_PASSWORD";


