#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

mkdir -p ./work
git clone $1 ./work

/opt/openvscode-server/bin/openvscode-server \
    --host 0.0.0.0 \
    --without-connection-token \
    --telemetry-level off
