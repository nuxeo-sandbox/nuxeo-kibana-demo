# About Nuxeo Kibana For Demos

This repository contains configuration files and installation scripts to set up a Kibana server on an AWS Nuxeo demo instance

# Install

* Clone this GitHub repository

```
cd /home/ubuntu
git clone https://github.com/nuxeo-sandbox/nuxeo-kibana4-demo
```

* Create a kibana user for apache

```
sudo apt-get install apache2-utils
sudo htpasswd -c /etc/apache2/passwords kibana
```

* Use the sript to Download Kibana (change the version in the script if necessary)

```
cd nuxeo-kibana4-demo
chmod 777 download.sh
./download.sh
```

* Run install script as root
  * You must pass the host name to `install.sh` (e.g. if the demo is `cool.cloud.nuxeo.com` pass `cool` as a param)

*IMPORTANT* if using HTTPS, pass the option `https` to `install.sh`

```
chmod 777 install.sh
sudo ./install.sh <myhost>
# --or--
sudo ./install.sh <myhost> https
```

* If your Nuxeo instance already had some data, you must now [rebuild the Elasticsearch index](https://doc.nuxeo.com/display/ADMINDOC/Elasticsearch+Setup#ElasticsearchSetup-RebuildingtheIndexRebuildingtheIndex).

* Update Route53 (on AWS), if relevant, so to add kibana-somename.cloud.nuxeo.com (with the exact same TNAME as somename.cloud.nuxeo.com)

* To access kibana:  go to kibana-somename.cloud.nuxeo.com, use `kibana` as user, enter the password you set for this user.

# (Optional) Standalone Elasticsearch Setup

**IMPORTANT:** these steps are optional, standalone ES is not required, embedded ES may be used.

* Install the correct version of ES (see https://doc.nuxeo.com/nxdoc/compatibility-matrix/)
* Start ES is needed

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


# Troubleshooting

* If using standalone Elasticsearch with less than three nodes, the Nuxeo server log will contain a warning about cluster health not being "GREEN". This is normal, an Elasticsearch cluster requires a minimum of 3 nodes to be GREEN.

* On some configuration, we noticed that after the installation process, nuxeo server displays the Welcome Wizard again. If this is the case for you, then edit `nuxeo.conf` and set `nuxeo.wizard.done` to `true`.

# Upgrade

To upgrade the kibana version, first delete or remove the existing folder

```
cd
mv kibana kibana.old
```

Modify the version in download.sh, run the script and finally restart supervisor

```
sudo service supervisor restart
```


# Support

**These features are not part of the Nuxeo Production platform.**

These solutions are provided for inspiration and we encourage customers to use them as code samples and learning resources.

This is a moving project (no API maintenance, no deprecation process, etc.) If any of these solutions are found to be useful for the Nuxeo Platform in general, they will be integrated directly into platform, not maintained here.


# Licensing

[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)


# About Nuxeo

Nuxeo dramatically improves how content-based applications are built, managed and deployed, making customers more agile, innovative and successful. Nuxeo provides a next generation, enterprise ready platform for building traditional and cutting-edge content oriented applications. Combining a powerful application development environment with SaaS-based tools and a modular architecture, the Nuxeo Platform and Products provide clear business value to some of the most recognizable brands including Verizon, Electronic Arts, Sharp, FICO, the U.S. Navy, and Boeing. Nuxeo is headquartered in New York and Paris.

More information is available at [www.nuxeo.com](http://www.nuxeo.com).
