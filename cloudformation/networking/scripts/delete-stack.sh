#!/bin/bash

REGION="us-east-1";
ENV="Dev";
STACK_NAME="Storage-Queen-$ENV-Networking";

aws cloudformation delete-stack \
--region $REGION \
--stack-name $STACK_NAME