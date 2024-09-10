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
kubectl apply -f ../secret/
helm repo add grafana https://grafana.github.io/helm-charts
helm repo add argo https://argoproj.github.io/argo-helm
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install share-db bitnami/postgresql --version=15.5.27 --namespace yamp --values=./helm-config/postgresql/values.yaml
helm install redis bitnami/redis --version 20.0.3 -n yamp --values=./helm-config/redis/values.yaml
helm install kafka bitnami/kafka --version 30.0.5 -n yamp --values=./helm-config/kafka/values.yaml
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack --namespace monitoring --version=62.3.1 --values=./helm-config/kube-prometheus-stack/values.yaml
helm install tempo-release grafana/tempo --namespace monitoring --version=1.10.3
#helm install grafana-release grafana/grafana --namespace monitoring --version=8.4.8
helm install argocd-release argo/argo-cd --version 7.4.7 --namespace=argocd --create-namespace

echo "argocd password init is: $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)"



