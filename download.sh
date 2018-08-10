#!/bin/bash

VERSION="6.3.0"
ARCH="x86_64"

wget https://artifacts.elastic.co/downloads/kibana/kibana-oss-$VERSION-linux-$ARCH.tar.gz
tar -xvf kibana-oss-$VERSION-linux-$ARCH.tar.gz
mv  kibana-$VERSION-linux-$ARCH kibana
