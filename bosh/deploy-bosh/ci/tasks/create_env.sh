#!/bin/bash

set -eoux pipefail

jq -r '.bosh_ssh_key' tf_infra/metadata > private_key.pem

# Interpolate values from Terraform outputs
export BOSH_LOG_LEVEL=debug
export BOSH_LOG_PATH=/tmp/bosh_logs

bosh create-env manifests/bosh.yml \
  --state=state_bucket/state.json \
  --vars-store=state_bucket/creds.yml \
  -o manifests/aws/cpi.yml \
  -o manifests/external-ip-with-registry-not-recommended.yml \
  --vars-file=tf_infra/metadata \
  --var-file private_key=./private_key.pem \
  -v director_name=bosh \
  -v access_key_id="${AWS_ACCESS_KEY_ID}" \
  -v secret_access_key="${AWS_SECRET_ACCESS_KEY}"

tar -czvf outputs/director.tar.gz state_bucket/state.json state_bucket/creds.yml