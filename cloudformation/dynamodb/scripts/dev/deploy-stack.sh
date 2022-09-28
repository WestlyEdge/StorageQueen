#!/bin/bash

REGION="us-east-1";
ENV="dev";
ACCOUNT_ID=${1}; # an account id must be passed in as the first input arg
STACK_NAME="sq-$ENV-dynamodb-$ACCOUNT_ID";
SCRIPT_DIR=$(dirname "$0");
TEMPLATE_FILE=$SCRIPT_DIR/../../template.yaml;

if [ -z "$ACCOUNT_ID" ]
then
    echo "ERROR: an account id must be passed in as the first input arg, example: \"sto1664349483\"";
    exit 1; # terminate and indicate error
fi

aws cloudformation deploy \
--region $REGION \
--stack-name $STACK_NAME \
--template-file $TEMPLATE_FILE \
--tags Env=$ENV AccountId=$ACCOUNT_ID \
--parameter-overrides \
Env=$ENV \
AccountId=$ACCOUNT_ID \
BillingMode="PAY_PER_REQUEST" \
TableClass="STANDARD";