#!/bin/bash

set -eu

# needs to be ran from learning-various/vault

# Mostly ripped from https://github.com/hashicorp/secrets-store-csi-driver-provider-vault/blob/master/docs/vault-setup.md

kubectl apply -f examples/vault.yaml

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
 To access Vault run
 kubectl port-forward "${vault_pod}" 8200:8200 &
 export VAULT_ADDR="http://127.0.0.1:8200"
 export VAULT_TOKEN="root"
EOF