#!/bin/bash

REGION="us-east-1";
ENV="prod";
STACK_NAME="sq-$ENV-eks-nodes";
SCRIPT_DIR=$(dirname "$0");
TEMPLATE_FILE=$SCRIPT_DIR/../../template.yaml;

aws cloudformation deploy \
--region $REGION \
--stack-name $STACK_NAME \
--template-file $TEMPLATE_FILE \
--capabilities "CAPABILITY_NAMED_IAM" \
--tags Env=$ENV \
--parameter-overrides \
Env=$ENV \
EKSClusterName="sq-$ENV-eks-cluster" \
InstanceType="t2.medium" \
ImageId="ami-087b755b20f3ec965" \
KeyPairName="storage-queen-keypair" \
NodeGroupDesiredCapacity="1" \
NodeGroupMinSize="1" \
NodeGroupMaxSize="1" \
EKSBootstrapArguments="" \
AllowSSHAccessCidrIp="24.240.92.10/24" \
DNSHostedZoneId="Z011097625Z3C8FFCPBT2" \
DNSRecordName="eks.storagequeen.com" \
ALBListenerHttpPort=80 \
NginxControllerHttpNodePort=32080 \
NginxControllerHealthCheckPath="/healthz";
