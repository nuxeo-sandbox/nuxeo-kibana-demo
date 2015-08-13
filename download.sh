#!/bin/bash

VERSION="4.1.1"

cd
wget https://download.elasticsearch.org/kibana/kibana/kibana-$VERSION-linux-x64.tar.gz
tar -xvf kibana-$VERSION-linux-x64.tar.gz
mv  kibana-$VERSION-linux-x64 kibana
