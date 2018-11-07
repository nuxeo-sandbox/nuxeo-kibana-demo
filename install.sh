#!/bin/bash

# Pass the host name and
if [ ! -z "$1" ]
then
    host=$1
else
    echo 'usage: install.sh host_name'
    exit 1
fi

sed -i -e "s/myhost/$host/g" apache/kibana.conf

apt-get install apache2-utils supervisor -y
a2enmod proxy_html
cp $kibana_conf /etc/apache2/sites-available/
a2ensite $kibana_site
service apache2 restart
sudo cp supervisor/kibana.conf /etc/supervisor/conf.d/
mkdir /var/log/kibana
chown ubuntu:ubuntu /var/log/kibana
service supervisor restart
