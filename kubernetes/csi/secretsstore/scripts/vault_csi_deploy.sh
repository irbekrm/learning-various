#!/bin/bash

set -eux

# This script is mostly ripped from https://github.com/hashicorp/secrets-store-csi-driver-provider-vault/blob/master/docs/vault-setup.md

# Full path of the directory inside which is this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# Full path of the learning-various repo
ROOT="${DIR}/../../../.."
SECRETSSTORE_PATH="${ROOT}/kubernetes/csi/secretsstore"

function cleanup()
{
    kill $(pgrep kubectl)
}

# deploy Vault
"${ROOT}/vault/scripts/deploy.sh"

# Export Vault creds
vault_pod=$(kubectl get pod --selector app=vault --output jsonpath="{.items[0].metadata.name}")
kubectl port-forward "${vault_pod}" 8200:8200 &
trap cleanup EXIT
export VAULT_ADDR="http://127.0.0.1:8200"
export VAULT_TOKEN="root"

# Kubernetes service account for Vault
kubectl apply -f "${SECRETSSTORE_PATH}/examples/vault-sa.yaml"

# Bind the service account to system:auth-delegator clusterrole (create access to tokenreviews and subjectaccessreviews)
kubectl apply -f "${SECRETSSTORE_PATH}/examples/vault-clusterrole-binding.yaml"

# enable Kubernetes auth for Vault
# to be able to authenticate with Vault using k8s SA token

cluster_name="$(kubectl config view --raw \
  -o go-template="{{ range .contexts }}{{ if eq .name \"$(kubectl config current-context)\" }}{{ index .context \"cluster\" }}{{ end }}{{ end }}")"

secret_name="$(kubectl get serviceaccount vault-auth \
  -o go-template='{{ (index .secrets 0).name }}')"

tr_account_token="$(kubectl get secret ${secret_name} \
  -o go-template='{{ .data.token }}' | base64 --decode)"

k8s_host="https://$(kubectl get svc kubernetes -o go-template="{{ .spec.clusterIP }}")"

k8s_cacert="$(kubectl config view --raw \
  -o go-template="{{ range .clusters }}{{ if eq .name \"${cluster_name}\" }}{{ index .cluster \"certificate-authority-data\" }}{{ end }}{{ end }}" | base64 --decode)"


vault auth enable kubernetes

vault write auth/kubernetes/config \
  kubernetes_host="${k8s_host}" \
  kubernetes_ca_cert="${k8s_cacert}" \
  token_reviewer_jwt="${tr_account_token}"

# Create a Vault policy that allows reading secrets from a certain paths and
# a role that has that policy attached

vault policy write csi-readonly "${SECRETSSTORE_PATH}/examples/vault-readonly-policy.hcl"

vault write auth/kubernetes/role/csi-role \
  bound_service_account_names=secrets-store-csi-driver \
  bound_service_account_namespaces=default \
  policies=default,example-readonly \
  ttl=20m

# Write an example secret to Vault
vault kv put secret/foo bar=hello

vault_pod=$(kubectl get pod --selector app=vault --output jsonpath="{.items[0].metadata.name}")
cat << EOF
 Vault is now up and running.
 To access Vault run the following:
 kubectl port-forward "${vault_pod}" 8200:8200 &
 export VAULT_ADDR="http://127.0.0.1:8200"
 export VAULT_TOKEN="root"
EOF