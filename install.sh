#!/bin/bash

# Pass the host name
if [ ! -z "$1" ]; then
    host=$1
# Use the stack name env variable
elif [ ! -z "$STACK_ID" ]; then
    host=$STACK_ID
    echo "$host"
else
    echo 'usage: install.sh host_name'
    exit 1
fi

sed -i -e "s/myhost/$host/g" apache/kibana.conf

certbot -q --apache --redirect --hsts --uir --agree-tos -m presales@nuxeo.com -d kibana-$host.cloud.nuxeo.com

apt-get install apache2-utils supervisor -y
a2enmod proxy_html
cp apache/kibana.conf /etc/apache2/sites-available/
a2ensite kibana
service apache2 restart
sudo cp supervisor/kibana.conf /etc/supervisor/conf.d/
mkdir /var/log/kibana
chown ubuntu:ubuntu /var/log/kibana
service supervisor restart
