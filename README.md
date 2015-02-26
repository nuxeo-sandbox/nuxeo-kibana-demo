# Nuxeo Kibana 4 Demo
===

This repository contains configuration files and installation scripts to set up a Kibana 4 server on an AWS Nuxeo demo instance

## Build

Install the latest version of ES (see http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/setup-repositories.html)

Clone this repository 

```
git clone https://github.com/michaelva/nuxeo-demo-kibana4
```

Edit the apache configuration files (set ServerName with your actual domain name)

Download Kibana 4 (change the version in the script if necessary)

```
cd nuxeo-demo-kibana4
chmod 777 download.sh
./download.sh
```

Install

```
chmod 777 install.sh
./install.sh
```


## Important Note

**These features are not part of the Nuxeo Production platform.**

These solutions are provided for inspiration and we encourage customers to use them as code samples and learning resources.

## About Nuxeo

Nuxeo provides a modular, extensible Java-based [open source software platform for enterprise content management](http://www.nuxeo.com/en/products/ep) and packaged applications for [document management](http://www.nuxeo.com/en/products/document-management), [digital asset management](http://www.nuxeo.com/en/products/dam) and [case management](http://www.nuxeo.com/en/products/case-management). Designed by developers for developers, the Nuxeo platform offers a modern architecture, a powerful plug-in model and extensive packaging capabilities for building content applications.

More information at <http://www.nuxeo.com/>
