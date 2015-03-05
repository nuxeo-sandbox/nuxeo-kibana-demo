# Nuxeo Kibana 4 Demo
===

This repository contains configuration files and installation scripts to set up a Kibana 4 server on an AWS Nuxeo demo instance

## Build

Install the latest version of ES (see http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/setup-repositories.html)

Edit nuxeo your nuxeo.conf file
```
sudo vim /etc/nuxeo/nuxeo.conf
```

Uncomment the following lines : 
```
elasticsearch.addressList=localhost:9300
elasticsearch.clusterName=elasticsearch
```

Restart your nuxeo instance
```
sudo service nuxeo restart
```

Clone this repository 

```
cd /home/ubuntu
git clone https://github.com/michaelva/nuxeo-demo-kibana4
```

Edit the apache configuration files (set ServerName with your actual domain name)

Create a kibana user in apache

```
sudo apt-get install apache2-utils
sudo htpasswd -c /etc/apache2/passwords kibana
```

Download Kibana 4 (change the version in the script if necessary)

```
cd nuxeo-demo-kibana4
chmod 777 download.sh
./download.sh
```

Run install script as root

```
chmod 777 install.sh
sudo ./install.sh
```


## Important Note

**These features are not part of the Nuxeo Production platform.**

These solutions are provided for inspiration and we encourage customers to use them as code samples and learning resources.

## About Nuxeo

Nuxeo provides a modular, extensible Java-based [open source software platform for enterprise content management](http://www.nuxeo.com/en/products/ep) and packaged applications for [document management](http://www.nuxeo.com/en/products/document-management), [digital asset management](http://www.nuxeo.com/en/products/dam) and [case management](http://www.nuxeo.com/en/products/case-management). Designed by developers for developers, the Nuxeo platform offers a modern architecture, a powerful plug-in model and extensive packaging capabilities for building content applications.

More information at <http://www.nuxeo.com/>
