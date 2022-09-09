#!/bin/bash

REGION="us-east-1";
STACK_NAME="sq-teamcity";

aws cloudformation delete-stack \
--region $REGION \
--stack-name $STACK_NAME