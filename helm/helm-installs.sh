#!/bin/bash

ENV=${1}; # environment name must be passed in as the first input arg (dev or prod)
SCRIPT_DIR=$(dirname "$0");
VALUES_DIR="$SCRIPT_DIR/values/$ENV/";

if [ -z "$ENV" ]
then
    echo "ERROR: environment name must be passed in as the first input arg (dev or prod)";
    exit 1; # terminate and indicate error
fi

# install nginx ingress controller
helm upgrade "ingress-nginx" \
"https://github.com/kubernetes/ingress-nginx/releases/download/helm-chart-4.2.5/ingress-nginx-4.2.5.tgz" \
--values "$VALUES_DIR/ingress-nginx.yaml" \
--install;

## install prometheus
#helm upgrade "prometheus" \
#"https://github.com/prometheus-community/helm-charts/releases/download/prometheus-15.12.2/prometheus-15.12.2.tgz" \
#--values "$VALUES_DIR/prometheus.yaml" \
#--install;

#kubectl annotate pods --all --overwrite --namespace "kube-system" prometheus.io/scrape="true";
#kubectl annotate pods --all --overwrite --namespace "kube-system" prometheus.io/path="/metrics";
#kubectl annotate pods --all --overwrite --namespace "kube-system" prometheus.io/port="8080";
