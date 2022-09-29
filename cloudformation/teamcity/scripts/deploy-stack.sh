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
SecretsManagerName="sq.teamcity" \
PostgresPasswordKey="POSTGRES_USER_PASSWORD" \
DNSHostedZoneId="Z011097625Z3C8FFCPBT2" \
DNSRecordName="teamcity.storagequeen.com" \
DNSRecordTTL="300" \
AllowAccessCidrIp="24.240.92.10/24" \
PostgresDockerImage="wesedge/sq-postgres:2022.09.12.03.18" \
TeamCityServerDockerImage="wesedge/sq-teamcity-server:2022.09.12.03.13" \
TeamCityAgentDockerImage="wesedge/sq-teamcity-agent:2022.09.29.04.56" \
AutoScalingGroupMinSize="0" \
AutoScalingGroupMaxSize="1" \
AutoScalingGroupDesiredCapacity="1";
