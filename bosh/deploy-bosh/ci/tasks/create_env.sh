#!/bin/bash

set -eoux pipefail

jq -r '.bosh_ssh_key' tf_infra/metadata > private_key.pem

# Interpolate values from Terraform outputs

bosh create-env manifests/bosh.yml \
  --state=state_bucket/director_state/state.json \
  --vars-store=state_bucket/director_state/creds.yml \
  -o manifests/aws/cpi.yml \
  --vars-file=tf_infra/metadata \
  -v director-name=bosh \
  -v access_key_id="${AWS_ACCESS_KEY_ID}" \
  -v secret_access_key="${AWS_SECRET_ACCESS_KEY}"