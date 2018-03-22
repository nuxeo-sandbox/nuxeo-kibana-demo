# Nuxeo Kibana For Demos

This repository contains configuration files and installation scripts to set up a Kibana server on an AWS Nuxeo demo instance

# Prequisites

*IMPORTANT* these steps are optional, standalone ES is not required.

*Install the latest version of ES (see http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/setup-repositories.html)
* Start elastic search is needed

```
# Assuming you used the defaut 9200 port
# Check to see if elasticsearch is installed:
curl "http://localhost:9200"
# Must return a value with status 200

# To start elasticsearch:
sudo service elasticsearch start
```

* Edit nuxeo your nuxeo.conf file

```
sudo vim /etc/nuxeo/nuxeo.conf
```

* Uncomment the following lines (and assuming you let the default value for clusters, 9300):

```
elasticsearch.addressList=localhost:9300
elasticsearch.clusterName=elasticsearch
```

* Restart your nuxeo instance

```
sudo service nuxeo restart
```

# Install

* Clone this GitHub repository

```
cd /home/ubuntu
git clone https://github.com/nuxeo-sandbox/nuxeo-kibana4-demo
```

* Edit the apache configuration files in nuxeo-kibana4-demo/apache:
  * set ServerName with your actual domain name: in the file, replace `host` with the name of the prospect, typically
  * Make sure the Kibana URL is enabled in Route53

* Create a kibana user in apache

```
sudo apt-get install apache2-utils
sudo htpasswd -c /etc/apache2/passwords kibana
```

* Download Kibana (change the version in the script if necessary)

```
cd nuxeo-kibana4-demo
chmod 777 download.sh
./download.sh
```

* Run install script as root

```
chmod 777 install.sh
sudo ./install.sh
```

* If your instance already had some data, you must now [rebuild the Elasticsearch index](https://doc.nuxeo.com/display/ADMINDOC/Elasticsearch+Setup#ElasticsearchSetup-RebuildingtheIndexRebuildingtheIndex).

* Update the route 53 (on AWS), if relevant, so to add kibana.somename.cloud.nuxeo.com (with the exact same TNAME as somename.cloud.nuxeo.com)

* To access kibana:  go to kibana.somename.cloud.nuxeo.com, use `kibana` as user, enter the password you set for this user.

## Troubleshooting

* If using standalone Elasticsearch with less than three nodes, the Nuxeo server log will contain a warning about cluster health not being "GREEN". This is normal, an Elasticsearch cluster requires a minimum of 3 nodes to be GREEN.

* On some configuration, we noticed that after the installation process, nuxeo server displays the Welcome Wizard again. If this is the case for you, then edit `nuxeo.conf` and set `nuxeo.wizard.done` to `true`.

## Upgrade

To upgrade the kibana version, first delete or remove the existing folder

```
cd
mv kibana kibana.old
```

Modify the version in download.sh, run the script and finally restart supervisor

```
sudo service supervisor restart
```


## Important Note

**These features are not part of the Nuxeo Production platform.**

These solutions are provided for inspiration and we encourage customers to use them as code samples and learning resources.

## About Nuxeo

Nuxeo provides a modular, extensible Java-based [open source software platform for enterprise content management](http://www.nuxeo.com/en/products/ep) and packaged applications for [document management](http://www.nuxeo.com/en/products/document-management), [digital asset management](http://www.nuxeo.com/en/products/dam) and [case management](http://www.nuxeo.com/en/products/case-management). Designed by developers for developers, the Nuxeo platform offers a modern architecture, a powerful plug-in model and extensive packaging capabilities for building content applications.

More information at <http://www.nuxeo.com/>
