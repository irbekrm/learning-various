#!/bin/bash

set -eux

# Mostly ripped from https://github.com/kubernetes-sigs/secrets-store-csi-driver#optional-sync-with-kubernetes-secrets

# Full path of the directory inside which is this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# Full path of the learning-various repo
ROOT="${DIR}/../../../.."
SECRETSSTORE_PATH="${ROOT}/kubernetes/csi/secretsstore"

# kill kubectl port-forward process
function cleanup()
{
    kill $(pgrep kubectl)
}

# Authenticate with Vault
vault_pod=$(kubectl get pod --selector app=vault --output jsonpath="{.items[0].metadata.name}")
kubectl port-forward "${vault_pod}" 8200:8200 &
export VAULT_ADDR="http://127.0.0.1:8200"
export VAULT_TOKEN="root"

trap cleanup EXIT

# Write some example secrets to Vault
vault kv put secret/foo bar=hello
vault kv put secret/foo1 bar=hi

# Create SecretProviderClass with Vault creds and paths to the two secrets created above
vault_service_ip=$(kubectl get svc --selector app=vault --output=jsonpath="{.items[0].spec.clusterIP}")
export VAULT_SERVICE_IP=$vault_service_ip
cat "${SECRETSSTORE_PATH}/examples/vault-secretproviderclass.yaml" | envsubst '$VAULT_SERVICE_IP' | kubectl apply -f -

# Deploy a pod that mounts a volume created from the new SecretProviderClass
kubectl apply -f "${SECRETSSTORE_PATH}/examples/test-deployment.yaml"


echo   "to test run kubectl exec -it nginx-secrets-store-inline cat /mnt/secrets-store/bar"



