#!/bin/bash

LOGIN_NAME=${1} # docker hub login name arg must be passed in as the first input arg
LOGIN_ACCESS_TOKEN=${2} # docker hub login access token arg must be passed in as the second input arg

docker login --u=$LOGIN_NAME --password=$LOGIN_ACCESS_TOKEN;