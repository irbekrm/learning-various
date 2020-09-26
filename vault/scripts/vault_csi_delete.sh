#!/bin/bash

set -eux

./scripts/delete.sh

kubectl delete -f examples/service-account.yaml
kubectl delete -f examples/vault-clusterrole-binding.yaml