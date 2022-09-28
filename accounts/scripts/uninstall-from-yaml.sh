#!/bin/bash

# WARNING - this script uninstalls all accounts from the sq software platform
# this script iterates through all accounts in accounts.yaml and runs uninstall-account.sh for each account found

ENV=${1}; # environment name must be passed in as the first input arg (dev or prod)
SCRIPT_DIR=$(dirname "$0");
YAML_PATH="$SCRIPT_DIR/../$ENV/accounts.yaml";
UNINSTALL_SCRIPT_DIR="$SCRIPT_DIR/uninstall-account.sh";

if [ -z "$ENV" ]
then
    echo "ERROR: environment name must be passed in as the first input arg, example: \"dev\" or \"prod\"";
    exit 1; # terminate and indicate error
fi

# display the state of the accounts.yaml file
echo; echo "the following accounts will be uninstalled..."; echo;
yq $YAML_PATH;

# convert the yaml to json so we can use jq below
JSON=$(yq -o=j "$YAML_PATH");

# make newlines the only separator for the bash for loop below (otherwise spaces in string values will break the loop logic)
IFS=$'\n'

# iterate through each account in the yaml file and run the uninstall script for each one
for account in $(echo $JSON | jq -cr '.accounts[]'); do

  # get the account id
  ACCOUNT_ID=$(echo $account | jq -r ".id");
  echo; echo "found account $ACCOUNT_ID";
  echo "  - the account will be uninstalled if it exists";

  # run the account uninstall script for this account id
  $UNINSTALL_SCRIPT_DIR $ENV $ACCOUNT_ID;

done
