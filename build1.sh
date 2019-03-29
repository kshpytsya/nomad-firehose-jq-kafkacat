#!/bin/sh

set -euxo pipefail

export LANG=en_US.UTF-8
export LC_ALL=C.UTF-8
export LANGUAGE=en_US.UTF-8

apk add --no-cache libcrypto1.0 libssl1.0 openssl-dev curl git build-base bash tar wget python yajl yajl-dev cmake coreutils
git clone --branch "${KAFKACAT_VER}" --single-branch https://github.com/edenhill/kafkacat.git kafkacat
cd kafkacat
./bootstrap.sh
make install
strip /usr/local/bin/kafkacat
