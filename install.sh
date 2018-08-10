#!/bin/bash

# Pass `https` if you are using https
if [[ $1 == https ]];
then
    kibana_conf=apache/kibana-https.conf
    kibana_site=kibana-https
    nuxeo_conf=apache/nuxeo-https.conf
else
    kibana_conf=apache/kibana.conf
    kibana_site=kibana-https
    nuxeo_conf=apache/nuxeo.conf
fi

apt-get install apache2-utils supervisor -y
a2enmod proxy_html
cp $kibana_conf /etc/apache2/sites-available/
cp $nuxeo_conf /etc/apache2/sites-available/
a2ensite $kibana_site
service apache2 restart
sudo cp supervisor/kibana.conf /etc/supervisor/conf.d/
mkdir /var/log/kibana
chown ubuntu:ubuntu /var/log/kibana
service supervisor restart
