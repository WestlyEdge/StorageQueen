#!/bin/bash

# WARNING - this script completely uninstalls an existing account from the sq software platform
# this script does NOT remove the account from accounts.yaml though
# if you want to remove an account from accounts.yaml then you need to run delete-account-yaml.sh

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
    echo "ERROR: an account id must be passed in as the first input arg, example: \"sto1664349483\"";
    exit 1; # terminate and indicate error
fi

# delete the cloudformation dynamodb stack for this account
TEMPLATE_PATH="$SCRIPT_DIR/../../cloudformation/dynamodb/scripts/$ENV/delete-stack.sh";
echo; echo "deleting dynamodb cloudformation stack for account $ACCOUNT_ID"; echo;
exec $TEMPLATE_PATH $ACCOUNT_ID;
