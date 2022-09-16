#!/bin/bash

# this script maps an IAM user to the k8s rbac system:masters group

EKS_CLUSTER_NAME=${1} # eks cluster name must be passed in as the first input arg
IAM_USER_ARN=${2} # aws user arn must be passed in as the second input arg
AWS_REGION="us-east-1"; # aws region

eksctl create iamidentitymapping \
--region "$AWS_REGION" \
--cluster "$EKS_CLUSTER_NAME" \
--arn "$IAM_USER_ARN" \
--group "system:masters" \
--no-duplicate-arns;