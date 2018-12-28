#!/bin/bash
apt-get install apache2-utils
htpasswd -c /etc/apache2/passwords kibana
cd nuxeo-kibana4-demo
chmod 777 download.sh
./download.sh
chmod 777 install.sh
./install.sh
