#!/bin/bash

# this script maps ec2 worker nodes to to rbac groups that allow them to bootstrap themselves into the eks cluster

EKS_CLUSTER_NAME=${1} # eks cluster name must be passed in as the first input arg
EC2_NODE_ROLE_ARN=${2} # ec2 worker node iam role arn must be passed in as the second input arg
AWS_REGION="us-east-1"; # aws region

eksctl create iamidentitymapping \
--region "$AWS_REGION" \
--cluster "$EKS_CLUSTER_NAME" \
--arn "$EC2_NODE_ROLE_ARN" \
--username "system:node:{{EC2PrivateDNSName}}" \
--group "system:bootstrappers" \
--group "system:nodes" \
--no-duplicate-arns;