#!/bin/bash

VERSION="5.6.3"
ARCH="x86_64"

cd
wget https://artifacts.elastic.co/downloads/kibana/kibana-$VERSION-linux-$ARCH.tar.gz
tar -xvf kibana-$VERSION-linux-$ARCH.tar.gz
mv  kibana-$VERSION-linux-$ARCH kibana
