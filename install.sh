#!/bin/bash

apt-get install apache2-utils supervisor -y
a2enmod proxy_html
cp apache/*.conf /etc/apache2/sites-available/
a2ensite kibana
service apache2 restart
sudo cp supervisor/kibana.conf /etc/supervisor/conf.d/
mkdir /var/log/kibana
chown ubuntu:ubuntu /var/log/kibana 
service supervisor restart
