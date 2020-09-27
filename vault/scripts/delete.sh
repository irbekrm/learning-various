#!/bin/bash

set -eux

# Full path of the directory inside which is this script
# From https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# Full path of the learning-various repo
ROOT="${DIR}/../.."
VAULT_PATH="${ROOT}/vault"

kubectl delete -f "${VAULT_PATH}/examples/vault.yaml"