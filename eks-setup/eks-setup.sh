#!/bin/bash

ENV=${1}; # environment name must be passed in as the first input arg (dev or prod)
EKS_CLUSTER_NAME="sq-$ENV-eks-cluster";
AWS_REGION="us-east-1";
SCRIPT_DIR=$(dirname "$0");

if [ -z "$ENV" ]
then
    echo "ERROR: environment name must be passed in as the first input arg (dev or prod)";
    exit 1; # terminate and indicate error
fi

# create your kubeconfig file (kubeconfig default location is ~/.kube/config)
aws eks update-kubeconfig --region $AWS_REGION --name $EKS_CLUSTER_NAME;

# map ec2 worker nodes to k8s rbac group to allow bootstrapping themselves into the eks cluster
$SCRIPT_DIR/map-worker-nodes.sh "$EKS_CLUSTER_NAME" "arn:aws:iam::682922730738:role/$ENV-eks-worker-node-instance-role";

# map iam user(s) to k8s rbac admin group
$SCRIPT_DIR/map-admin-user.sh "$EKS_CLUSTER_NAME" "arn:aws:iam::682922730738:user/Wes"


