#!/bin/bash

set -eux

# Mostly ripped from https://github.com/hashicorp/secrets-store-csi-driver-provider-vault/blob/master/docs/vault-setup.md

# Full path of the directory inside which is this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# Full path of the learning-various repo
ROOT="${DIR}/../.."
MODE="${MODE:-default}"
VAULT_PATH="${ROOT}/vault"


kubectl apply -f "${VAULT_PATH}/examples/vault_${MODE}.yaml"

# Check if the pod is running
running=$(kubectl get pod --selector app=vault --output jsonpath="{.items[0].status.phase}")
while [[ "Running" != "$running" ]]; do
    echo "Waiting for pod to run"
    sleep 1
    running=$(kubectl get pod --selector app=vault --output jsonpath="{.items[0].status.phase}")
done


vault_pod=$(kubectl get pod --selector app=vault --output jsonpath="{.items[0].metadata.name}")
cat << EOF
 Vault is now up and running.
 To access Vault run the following:
 kubectl port-forward "${vault_pod}" 8200:8200 &
 export VAULT_ADDR="http://127.0.0.1:8200"
 export VAULT_TOKEN="root"
EOF