# secrets store csi driver

## Deploy

`learning-various/kubernetes/csi/secretsstore/scripts/csi_driver_deploy.sh`

What it does:
* Creates a CSIDriver CRD (for the discovery and custom options of secrets store csi driver)
* Deploys the secrets store CSI driver with sidecar node-driver-registrar and liveness probe as a DaemonSet
* Creates a CRD for SecretProviderClass (objects of this kind will contain details of an external secret source and what secret(s) should be retrieved)
* Creates a CRD for SecretProviderClassPodStatus
* Creates a ClusterRole that allows accessing various secretsstore csi-related resources, and a service account bound to the ClusterRole. This SA is used by the secrets store CSI driver

## Delete

`learning-various/kubernetes/csi/secretsstore/scripts/csi_driver_delete.sh`

## Vault backend for [secrets store csi driver](https://github.com/kubernetes-sigs/secrets-store-csi-driver)

### Deploy Vault and necessary resources for Secrets Store CSI Vault driver

Assumes that the Secrets Store CSI driver has been deployed (see above)

This script is currently not idempotent

`./learning-various/kubernetes/csi/secretsstore/scripts/vault-csi-deploy.sh` 

What it does:
* Creates a Deployment with 1 replica running Vault in dev mode
* Creates a NodePort Service exposing Vault on port 8200
* Creates a ServiceAccount for Vault so it can verify Kubernetes tokens when a ServiceAccount tries to authenticate
* Creates a ClusterRoleBinding between Vault ServiceAccount and `system:auth-delegator` clusterrole
* Enables Vault's Kubernetes auth
* Provides Vault with k8s cluster details so it can verify ServiceAccount tokens
* Creates a Vault role `csi-role` bound to `secrets-store-csi-driver` k8s service account and with a policy attached that allows it reading secrets at certain paths
* Deploys Secrets Store CSI Vault provider as a Daemonset

### Delete Vault and the resources created for Secrets Store CSI Vault driver

`./learning-various/kubernetes/csi/secretsstore/scripts/vault_csi_delete.sh` 