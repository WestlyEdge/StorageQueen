#!/bin/bash

# this script loads new initialization data into the dynamodb table for an sq account

REGION="us-east-1";
ENV=${1}; # environment name must be passed in as the first input arg (dev or prod)
ACCOUNT_ID=${2}; # an account id must be passed in as the second input arg
SCRIPT_DIR=$(dirname "$0");
JSON_DOCUMENT_DIR="$SCRIPT_DIR/documents";
DYNAMODB_TABLE_NAME="sq-$ENV-$ACCOUNT_ID";

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

echo;

# for each json file in the documents folder
for file in $JSON_DOCUMENT_DIR/*; do

  # get the json file name
  JSON_FILE_NAME="${file##*/}";

  # get the json file contents
  JSON_FILE_CONTENTS=$(cat $file);

  # get the json document name (strip ".json" from the end of the file name)
  JSON_DOCUMENT_NAME=${JSON_FILE_NAME%".json"}

  # write the action details to stdout
  echo "--------------------------------------------"; echo;
  echo "dynamodb table -> $DYNAMODB_TABLE_NAME";
  echo "dynamodb document-name -> $JSON_DOCUMENT_NAME";
  echo "dynamodb document ->"; echo;
  echo "$JSON_FILE_CONTENTS";

  # save the json document to dynamodb for this account
  aws dynamodb put-item \
  --region $REGION \
  --table-name $DYNAMODB_TABLE_NAME \
  --item "$JSON_FILE_CONTENTS";

  echo;

done
