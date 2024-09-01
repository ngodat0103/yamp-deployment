#!/bin/bash

GHCR_SECRET="../secret/ghcr-secret.yaml"
HCP_SECRET="../secret/hcp-k8s-secret.yaml"


if [ ! -f "$GHCR_SECRET" ]; then
  echo "${GHCR_SECRET} required"
  exit 1
fi

if [ ! -f "$HCP_SECRET" ]; then
  echo "${HCP_SECRET} required"
  exit 1
fi



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
helm repo add grafana https://grafana.github.io/helm-charts
helm repo add argo https://argoproj.github.io/argo-helm
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus-release prometheus-community/prometheus --namespace monitoring --values=./helm-config/prometheus/values.yaml
helm install tempo-release grafana/tempo --namespace monitoring --version=1.10.3
helm install grafana-release grafana/grafana --namespace monitoring --version=8.4.8
helm install argocd-release argo/argo-cd --version 7.4.7 --namespace=argocd --create-namespace

echo "argocd password init is: $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)"


