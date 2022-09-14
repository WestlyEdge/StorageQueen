#!/bin/bash

REGION="us-east-1";
ENV="dev";
STACK_NAME="sq-$ENV-eks-cluster";

aws cloudformation delete-stack \
--region $REGION \
--stack-name $STACK_NAME