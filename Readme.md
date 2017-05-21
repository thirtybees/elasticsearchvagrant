# Vagrantfile for ElasticSearch
This Vagrantfile will help you get a local instance of ElasticSearch up and running within no-time. 
The includes shell scripts will quickly launch an ElasticSearch 5 instance for you.

## Instructions

First you need to clone this repository

```shell
$ git clone https://github.com/thirtybees/elasticsearchvagrant
```

then build Vagrant:

```
$ cd vagrant
$ vagrant up
```

This will launch an instance at 10.0.0.31, but it'll listen to the hostname `elasticsearch.bees`. Therefore it is wise to add the following to your hosts file (`/etc/hosts` on Linux/OS X):
```
# ElasticSearch vagrant
10.0.0.31 elasticsearch.bees
```

### Login

Once the instance is up and running, you can configure your ElasticSearch client to connect with `elasticsearch.bees:9200`  

### Fine-tuning

#### IP Address

The IP address that the VM uses can be changed in the `Vagrantfile`
