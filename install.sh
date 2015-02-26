#!/bin/bash

apt-get install apache2-utils supervisor -y
cp apache/*.conf /etc/apache2/site-availables/
a2ensite kibana
service apache2 restart
sudo cp supervisor/kibana4.conf /etc/supervisor/conf.d/
mkdir /var/log/kibana
chown ubuntu:ubuntu /var/log/kibana 
service supervisor restart
