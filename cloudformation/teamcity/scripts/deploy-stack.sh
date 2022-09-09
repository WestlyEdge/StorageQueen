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
VpcId="vpc-0076efa73224f9c6d" \
SubnetIds="subnet-0d2ec6c687fd344d1, subnet-0063d85ef0f22f5ef, subnet-021efa10cf691557c, subnet-0dd04f53960f71b00, subnet-08f66bdba40d62cd2, subnet-09de3e8f762a260f6" \
InstanceType="t2.medium" \
ImageId="ami-05fa00d4c63e32376" \
KeyPairName="storage-queen-keypair" \
AutoScalingGroupMinSize="1" \
AutoScalingGroupMaxSize="1" \
ALBListenerPort=80 \
ALBListenerProtocol="HTTP" \
EC2HostPort=8112 \
EC2HostProtocol="HTTP" \
TeamCityVersion="2022.04.3";


