#!/bin/bash

ENV=${1}; # environment name must be passed in as the first input arg (dev or prod)
SCRIPT_DIR=$(dirname "$0");
VALUES_DIR="$SCRIPT_DIR/values/$ENV/";

if [ -z "$ENV" ]
then
    echo "ERROR: environment name must be passed in as the first input arg (dev or prod)";
    exit 1; # terminate and indicate error
fi

# alb ingress controller
helm upgrade "aws-load-balancer-controller" \
"https://aws.github.io/eks-charts/aws-load-balancer-controller-1.4.4.tgz" \
--namespace "kube-system" \
--values "$VALUES_DIR/aws-load-balancer-controller.yaml" \
--install;
