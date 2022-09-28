#!/bin/bash

# this script generates a unique account id (sent to stdout)

ACCOUNT_NAME=${1}; # an account name must be passed in as the first input arg

if [ -z "$ACCOUNT_NAME" ]
then
    echo "ERROR: an account name must be passed in as the first input arg, example: \"A1 Storage LLC\"";
    exit 1; # terminate and indicate error
fi

NO_WHITESPACE="$(echo -e "${ACCOUNT_NAME}" | tr -d '[:space:]')";
TO_LOWER=$(echo "$NO_WHITESPACE" | awk '{print tolower($0)}');
PREFIX=${TO_LOWER:0:3};
EPOCH=$(date +%s);
ACCOUNT_ID="$PREFIX$EPOCH";

echo $ACCOUNT_ID;
