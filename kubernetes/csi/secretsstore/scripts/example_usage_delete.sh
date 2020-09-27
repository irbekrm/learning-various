#!/bin/bash

set -eux

# Mostly ripped from https://github.com/kubernetes-sigs/secrets-store-csi-driver#optional-sync-with-kubernetes-secrets

# Full path of the directory inside which is this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# Full path of the learning-various repo
ROOT="${DIR}/../../../.."
SECRETSSTORE_PATH="${ROOT}/kubernetes/csi/secretsstore"

# Create SecretProviderClass with Vault creds and paths to the two secrets created above
vault_service_ip=$(kubectl get svc --selector app=vault --output=jsonpath="{.items[0].spec.clusterIP}")
export VAULT_SERVICE_IP=$vault_service_ip
cat "${SECRETSSTORE_PATH}/examples/vault-secretproviderclass.yaml" | envsubst '$VAULT_SERVICE_IP' | kubectl delete -f -

# Deploy a pod that mounts a volume created from the new SecretProviderClass
kubectl delete -f "${SECRETSSTORE_PATH}/examples/test-deployment.yaml"