#!/bin/bash

# this script installs a new account onto the sq software platform
# this script can also be used to update an existing account (idempotency is assumed)

ENV=${1}; # environment name must be passed in as the first input arg (dev or prod)
ACCOUNT_ID=${2}; # an account id must be passed in as the second input arg
SCRIPT_DIR=$(dirname "$0");

if [ -z "$ENV" ]
then
    echo "ERROR: environment name must be passed in as the first input arg, example: \"dev\" or \"prod\"";
    exit 1; # terminate and indicate error
fi

if [ -z "$ACCOUNT_ID" ]
then
    echo "ERROR: an account id must be passed in as the second input arg, example: \"sto1664349483\"";
    exit 1; # terminate and indicate error
fi

# create the cloudformation dynamodb stack for this account
TEMPLATE_PATH="$SCRIPT_DIR/../../cloudformation/dynamodb/scripts/$ENV/deploy-stack.sh";
echo; echo "creating dynamodb stack for account $ACCOUNT_ID";
exec $TEMPLATE_PATH $ACCOUNT_ID;
