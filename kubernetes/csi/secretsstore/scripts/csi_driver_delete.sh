#!/bin/bash

set -eux

# This is mostly ripped from https://github.com/kubernetes-sigs/secrets-store-csi-driver#usage

# Full path of the directory inside which is this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# Path of the learning-various repo from DIR
ROOT="${DIR}/../../../.."
SECRETSSTORE_PATH="${ROOT}/kubernetes/csi/secretsstore"

kubectl delete -f "${SECRETSSTORE_PATH}/examples/rbac-secretproviderclass.yaml"
kubectl delete -f "${SECRETSSTORE_PATH}/examples/csidriver.yaml"
kubectl delete -f "${SECRETSSTORE_PATH}/examples/secrets-store.csi.x-k8s.io_secretproviderclasses.yaml"
kubectl delete -f "${SECRETSSTORE_PATH}/examples/secrets-store.csi.x-k8s.io_secretproviderclasspodstatuses.yaml"
kubectl delete -f "${SECRETSSTORE_PATH}/examples/secrets-store-csi-driver.yaml"