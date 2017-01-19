#!/bin/bash

VERSION="4.6.4"
ARCH="x86_64"

cd
wget https://download.elasticsearch.org/kibana/kibana/kibana-$VERSION-linux-$ARCH.tar.gz
tar -xvf kibana-$VERSION-linux-$ARCH.tar.gz
mv  kibana-$VERSION-linux-$ARCH kibana
