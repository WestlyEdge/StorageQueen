#!/bin/bash

REGION="us-east-1";
ENV="dev";
ACCOUNT_ID=${1}; # an account id must be passed in as the first input arg
STACK_NAME="sq-$ENV-dynamodb-$ACCOUNT_ID";

if [ -z "$ACCOUNT_ID" ]
then
    echo "ERROR: an account id must be passed in as the first input arg, example: \"sto1664349483\"";
    exit 1; # terminate and indicate error
fi

aws cloudformation delete-stack \
--region $REGION \
--stack-name $STACK_NAME