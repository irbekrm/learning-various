#!/bin/sh

set -x
set -euo pipefail

cd react-app/docker/basics/react-app/client

npm install

npm run test -- --coverage