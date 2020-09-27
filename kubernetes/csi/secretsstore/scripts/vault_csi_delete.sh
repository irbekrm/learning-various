#!/bin/bash

set -eux

# Full path of the directory inside which is this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# Full path of the learning-various repo
ROOT="${DIR}/../../../.."
SECRETSSTORE_PATH="${ROOT}/kubernetes/csi/secretsstore"

# Delete the Vault deployment
"${ROOT}/vault/scripts/delete.sh"

# Delete the associated resources
kubectl delete -f "${SECRETSSTORE_PATH}/examples/vault-sa.yaml"
kubectl delete -f "${SECRETSSTORE_PATH}/examples/vault-clusterrole-binding.yaml"
kubectl delete -f "${SECRETSSTORE_PATH}/examples/provider-vault-installer.yaml"