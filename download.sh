#!/bin/bash

VERSION="4.5.4"
ARCH="x64"

cd
wget https://download.elasticsearch.org/kibana/kibana/kibana-$VERSION-linux-$ARCH.tar.gz
tar -xvf kibana-$VERSION-linux-$ARCH.tar.gz
mv  kibana-$VERSION-linux-$ARCH kibana
