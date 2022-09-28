#!/bin/bash

ENV=${1}; # environment name must be passed in as the first input arg (dev or prod)
ACCOUNT_ID=${2}; # an account id must be passed in as the second input arg
SCRIPT_DIR=$(dirname "$0");
ACCOUNT_YAML_PATH="$SCRIPT_DIR/../$ENV/accounts.yaml";

if [ -z "$ENV" ]
then
    echo "ERROR: environment name must be passed in as the first input arg, example: \"dev\" or \"prod\"";
    exit 1; # terminate and indicate error
fi

if [ -z "$ACCOUNT_ID" ]
then
    echo "ERROR: an account id must be passed in as the second input arg, example: \"sto-1664349483\"";
    exit 1; # terminate and indicate error
fi

# display the state of the accounts before we edit the file
echo; echo "before..."; echo;
yq $ACCOUNT_YAML_PATH;

# delete the account from the yaml file if it exists
ACCOUNT_ID="$ACCOUNT_ID" \
yq --inplace 'del(.accounts[] | select(.id == env(ACCOUNT_ID)))' $ACCOUNT_YAML_PATH

# display the state of the accounts after we edit the file
echo; echo "after..."; echo;
yq $ACCOUNT_YAML_PATH;
echo;

