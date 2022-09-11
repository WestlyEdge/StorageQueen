#!/bin/bash

REGION="us-east-1";
ENV="Dev";
STACK_NAME="sq-$ENV-networking";

aws cloudformation delete-stack \
--region $REGION \
--stack-name $STACK_NAME