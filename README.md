# Docker HBase Pseudo Mode
This repository contains Dockerfile of HBase 0.98.6 in pseudo distributed mode for Docker's [automated build](https://hub.docker.com/r/nidozhao/hbase-pseudo/).

### Base Docker Image
- [openjdk](https://store.docker.com/images/openjdk?tab=description)

### Installation
1. install docker
2. pull image
```shell
docker pull nidozhao/hbase-pseudo
```
3. add `127.0.0.1 hbasedocker` to `/etc/hosts`

### Usage
#### launch
```shell
docker run -t -i --hostname=hbasedocker -p 2181:2181 -p 60000:60000 -p 60010:60010 -p 60020:60020 -p 60030:60030 nidozhao/hbase-pseudo
```

#### verify
open `http://127.0.0.1:60010/master-status` at browser

#### use hbase shell
```shell
$HBASE_HOME/bin/hbase shell
```

#### check master log
```
tail -f $HBASE_HOME/logs/hbase--master-hbasedocker.log
```
