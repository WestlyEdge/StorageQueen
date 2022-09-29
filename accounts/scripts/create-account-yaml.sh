#!/bin/bash

# this script adds an account to the accounts.yaml file

ENV=${1}; # environment name must be passed in as the first input arg (dev or prod)
ACCOUNT_NAME=${2}; # an account name must be passed in as the second input arg
SCRIPT_DIR=$(dirname "$0");
ACCOUNT_YAML_PATH="$SCRIPT_DIR/../$ENV/accounts.yaml";

if [ -z "$ENV" ]
then
    echo "ERROR: environment name must be passed in as the first input arg, example: \"dev\" or \"prod\"";
    exit 1; # terminate and indicate error
fi

if [ -z "$ACCOUNT_NAME" ]
then
    echo "ERROR: an account name must be passed in as the second input arg, example: \"A1 Storage LLC\"";
    exit 1; # terminate and indicate error
fi

# display the state of the accounts before we edit the file
echo; echo "before..."; echo;
yq eval $ACCOUNT_YAML_PATH;

# generate the new account id
ACCOUNT_ID=$("$SCRIPT_DIR/generate-account-id.sh" $ACCOUNT_NAME);

# add the new account to the yaml file
ACCOUNT_NAME="$ACCOUNT_NAME" \
ACCOUNT_ID="$ACCOUNT_ID" \
yq eval --inplace '.accounts += {
"name":env(ACCOUNT_NAME),
"id":env(ACCOUNT_ID)
} | .. style="double"' $ACCOUNT_YAML_PATH

# display the state of the accounts after we edit the file
echo; echo "after..."; echo;
yq eval $ACCOUNT_YAML_PATH;
echo;

