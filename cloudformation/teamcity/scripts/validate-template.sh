#!/bin/bash

REGION="us-east-1";
SCRIPT_DIR=$(dirname "$0");
TEMPLATE_FILE=file://$SCRIPT_DIR/../template.yaml;

aws cloudformation validate-template \
--region $REGION \
--template-body $TEMPLATE_FILE