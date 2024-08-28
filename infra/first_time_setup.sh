#!/bin/bash
NAMESPACE="yamp"
if ! kubectl get namespace "$NAMESPACE" > /dev/null 2>&1; then
  kubectl create namespace "$NAMESPACE"
else
  echo "Namespace $NAMESPACE already exists"
fi


if ! kubectl get namespace "monitoring" > /dev/null 2>&1; then
  kubectl create namespace "monitoring"
else
  echo "Namespace monitoring already exists"
fi

kubectl config set-context --current --namespace="$NAMESPACE"
helm repo add hashicorp https://helm.releases.hashicorp.com
helm repo update
helm install vault-secrets-operator hashicorp/vault-secrets-operator

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus-release prometheus-community/prometheus --namespace monitoring --values=./prometheus/values.yaml

helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install tempo-release grafana/tempo --namespace monitoring
helm install grafana-release grafana/grafana --namespace monitoring

kubectl apply -f ./hcp-k8s-operator --recursive



