#!/bin/sh

set -euxo pipefail

curl -L https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -o /usr/local/bin/jq
chmod +x /usr/local/bin/jq

apk add --no-cache libcrypto1.0 libssl1.0

kafkacat -V
jq --version

rm -rf /tmp/*
