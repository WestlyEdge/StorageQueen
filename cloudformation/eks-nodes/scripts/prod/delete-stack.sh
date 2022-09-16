#!/bin/bash

REGION="us-east-1";
ENV="prod";
STACK_NAME="sq-$ENV-eks-nodes";

aws cloudformation delete-stack \
--region $REGION \
--stack-name $STACK_NAME