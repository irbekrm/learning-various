# vault

## Deploy (in dev mode)

`./scripts/deploy.sh`

Creates:
* A deployment with 1 replica running Vault in dev mode
* A NodePort service exposing Vault on port 8200

## Delete
`./scripts/delete.sh`

## Vault backend for [secrets store csi driver](https://github.com/kubernetes-sigs/secrets-store-csi-driver)

### Deploy Vault and necessary resources for Secrets Store CSI Vault driver

This script is currently not idempotent

`.scripts/vault-csi.sh`

What it does:
* Creates a Deployment with 1 replica running Vault in dev mode
* Creates a NodePort Service exposing Vault on port 8200
* Creates a ServiceAccount for Vault so it can verify Kubernetes tokens when a ServiceAccount tries to authenticate
* Creates a ClusterRoleBinding between Vault ServiceAccount and `system:auth-delegator` clusterrole
* Enables Vault's Kubernetes auth
* Provides Vault with k8s cluster details so it can verify ServiceAccount tokens
* Creates a Vault role `csi-role` bound to `secrets-store-csi-driver` k8s service account and with a policy attached that allows it reading secrets at certain paths


### Delete Vault and the resources created for Secrets Store CSI Vault driver

`./scripts/vault_csi_delete.sh`

