#/bin/bash

jq -r '.bosh_ssh_key' > private_key.pem

# Interpolate values from Terraform outputs

bosh create-env manifests/bosh.yml \
  --state=director-state/state.json \
  --vars-store=director-state/creds.yml \
  -o manifests/cpi.yml \
  --vars-file=tf-outputs/metadata \
  -v director-name=bosh \
  -v access_key_id="${AWS_ACCESS_KEY_ID}" \
  -v secret_access_key="${AWS_SECRET_ACCESS_KEY}"