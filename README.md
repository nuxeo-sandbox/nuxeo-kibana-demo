# Nuxeo Kibana 4 Demo
===

This repository contains configuration files and installation scripts to set up a Kibana 4 server on an AWS Nuxeo demo instance

## Build

* Install the latest version of ES (see http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/setup-repositories.html)

* Started elastic search is needed

```
# Assuming you let the defaut 9200 port
# Check elasticsearch is installed:
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

* Clone this GitHub repository 

```
cd /home/ubuntu
git clone https://github.com/nuxeo-sandbox/nuxeo-kibana4-demo
```

* Edit the apache configuration files in nuxeo-kibana4-demo/apache  (set ServerName with your actual domain name: in the file, replace `host` with the name of the prospect, typically)

* Create a kibana user in apache

```
sudo apt-get install apache2-utils
sudo htpasswd -c /etc/apache2/passwords kibana
```

* Download Kibana 4 (change the version in the script if necessary)

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

* To access kibana: just go to kibana.somename.cloud.nuxeo.com, use kibana as user, enter the password you set for this user.

## Troubleshooting

* After restarting nuxeo, and as long as you have a single node of elasticsearch, you will have a `WARN` in nuxeo's server.log at startup. Something like:

```
2015-07-19 14:59:44,950 WARN  [localhost-startStop-1] [org.nuxeo.elasticsearch.core.ElasticSearchAdminImpl] Es Cluster ready but not GREEN: {
  "cluster_name" : "elasticsearch",
  "status" : "yellow",
  "timed_out" : false,
  "number_of_nodes" : 1,
  "number_of_data_nodes" : 1,
  "active_primary_shards" : 5,
  "active_shards" : 5,
  "relocating_shards" : 0,
  "initializing_shards" : 0,
  "unassigned_shards" : 5,
  "number_of_pending_tasks" : 0
}
```
This is standard elasticsearch behavior.

* On some configuration, we noticed that after the installation process, nuxeo server displays the Welcome Wizard again. If this is the case for you, then edit `nuxeo.conf` and delete all the lines (at the end of the file) after:

```
### END - DO NOT EDIT BETWEEN BEGIN AND END ###
```

## Important Note

**These features are not part of the Nuxeo Production platform.**

These solutions are provided for inspiration and we encourage customers to use them as code samples and learning resources.

## About Nuxeo

Nuxeo provides a modular, extensible Java-based [open source software platform for enterprise content management](http://www.nuxeo.com/en/products/ep) and packaged applications for [document management](http://www.nuxeo.com/en/products/document-management), [digital asset management](http://www.nuxeo.com/en/products/dam) and [case management](http://www.nuxeo.com/en/products/case-management). Designed by developers for developers, the Nuxeo platform offers a modern architecture, a powerful plug-in model and extensive packaging capabilities for building content applications.

More information at <http://www.nuxeo.com/>
