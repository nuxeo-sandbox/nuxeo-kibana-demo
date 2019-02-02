#!/bin/bash

function version_gt() { test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1"; }

# Pass the version (optional)
if [ ! -z "$1" ]
then
    VERSION=$1
else
    ES_VERSION="$(sudo dpkg -l | grep elasticsearch | awk '{print $3}')"
    if [ -z "$ES_VERSION" ]
    then
        VERSION="6.5.4"
    else VERSION=$ES_VERSION
    fi
fi

# Starting with version 6.3, Kibana includes X-Pack by default, whereas the
# embdedded ElasticSearch server that Nuxeo uses does not. So this project now
# installs the "oss" version of Kibana, which doesn't include X-Pack.
if version_gt "6.3.0" $VERSION; then
    OSS=""
else
    OSS="-oss"
fi

ARCH="x86_64"

echo "Version to download: $VERSION"

cd
wget https://artifacts.elastic.co/downloads/kibana/kibana$OSS-$VERSION-linux-$ARCH.tar.gz
tar -xvf kibana$OSS-$VERSION-linux-$ARCH.tar.gz
mv  kibana-$VERSION-linux-$ARCH kibana
chown -R ubuntu:ubuntu kibana
