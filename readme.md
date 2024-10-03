This repository contains some deployment setup for
the [yamp project](https://github.com/ngodat0103/yamp.git).

# Architecture
![architecture](docs/architecture.png)

# Components
1. [Kubernetes](https://kubernetes.io/docs/concepts/overview/): a container orchestration platform.
2. [Hashicorp](https://developer.hashicorp.com/hcp/docs/vault-secrets): a secret management platform. 
I am currently using a secret management platform, but I plan to deploy a dedicated Vault server due to limitations with HashiCorp
3. [Kafka](https://kafka.apache.org/): a distributed event streaming platform.
4. [Vault-secret-operator](https://developer.hashicorp.com/vault/tutorials/kubernetes/vault-secrets-operator): a Kubernetes operator for managing secrets. 
4. [Prometheus](https://prometheus.io/): a monitoring and alerting toolkit.
5. [Grafana](https://grafana.com/): a visualization platform.
6. [Redis](https://redis.io/): a in-memory data structure store.
7. [Tempo](https://grafana.com/oss/tempo/): a distributed tracing platform.
8. [Loki](https://grafana.com/oss/loki/): a log aggregation platform.

# Tools have been used
1. [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/): a command line tool for interacting with Kubernetes clusters.
2. [helm](https://helm.sh/): a package manager for Kubernetes.
3. [ArgoCD](https://argoproj.github.io/argo/): a workflow engine for Kubernetes.
# How this project be deployed
## Specification
This project was deployed and tested using Minikube version 1.32.0 on a system with the following hardware specifications:
- OS: Ubuntu 22.04 
- CPU: i5-3470s
- Memory: 16GB
- Storage: 120GB SSD 
## Detail 
1. Register an account on [hashicorp](https://app.terraform.io/signup/account) and create a new organization.
2. Set up and configure the secrets in the vault secrets in the organization.
![hashicorp-secret](docs/hashicorp-secret.png)
3. Set up secret management in the Kubernetes cluster, check the [hcp-k8s-operator](charts/template-old/hcp-k8s-operator) folder.
, [cloudflare-hcpvaultsecretsapp](charts/template-old/hcp-k8s-operator/hcpvaultsecretsapp/cloudflared-hcpvaultsecretsapp.yaml)
4. Configure the values for infrastructure in the [helm-config](./infra/helm-config) folder
5. Deploying the infrastructure by running the [first_time_setup.sh](./infra/first_time_setup.sh) script. 
6. install the secret for hcp, the only secret for hcp-operator fetching the secret from the Hashicorp Cloud Platform.
7. Deploy the application using argocd by apply the [argocd-application](argocd/prod) folder.
# Some images about the project
## Deployment with ArgoCD
![argocd](docs/argocd.png)
## Monitoring
![application](docs/application-monitoring.png)
## Request tracing for some endpoints
### /api/v1/user/get-me
** With no cache **
![get-me.png](docs/get-me-with-no-cache.png)
** With cache **
![get-me-cache.png](docs/get-me-with-cache.png)
### /api/v1/user/register
![register.png](docs/register.png)


Continue to update...
```



