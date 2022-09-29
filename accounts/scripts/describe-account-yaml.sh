#!/bin/bash

# this script pretty prints the contents of the accounts.yaml file to stdout

ENV=${1}; # environment name must be passed in as the first input arg (dev or prod)
SCRIPT_DIR=$(dirname "$0");
ACCOUNT_YAML_PATH="$SCRIPT_DIR/../$ENV/accounts.yaml";

if [ -z "$ENV" ]
then
    echo "ERROR: environment name must be passed in as the first input arg, example: \"dev\" or \"prod\"";
    exit 1; # terminate and indicate error
fi

# display the state of the account yaml file
yq eval $ACCOUNT_YAML_PATH;