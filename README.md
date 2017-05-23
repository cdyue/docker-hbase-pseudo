# Docker HBase Pseudo Mode
This repository contains Dockerfile of HBase 0.98.12 in pseudo distributed mode for Docker's [automated build](https://hub.docker.com/r/nidozhao/hbase-pseudo/).

### Base Docker Image
- [openjdk](https://store.docker.com/images/openjdk?tab=description)

### Support HBase Version
- [0.98.12](https://github.com/zhao-y/docker-hbase-pseudo/tree/0.98.12)
- [1.2.0](https://github.com/zhao-y/docker-hbase-pseudo/tree/1.2.0)

### Installation
1. install docker
2. pull image
```shell
docker pull nidozhao/hbase-pseudo:{tag}
```
3. add `127.0.0.1 hbasedocker` to `/etc/hosts`

### Usage
#### launch

##### 0.98.12
```shell
docker run -it --hostname=hbasedocker -p 2181:2181 -p 60000:60000 -p 60010:60010 -p 60020:60020 -p 60030:60030 nidozhao/hbase-pseudo:0.98.12
```

##### 1.2.0
```shell
docker run -it --hostname=hbasedocker -p 2181:2181 -p 16000:16000 -p 16010:16010 -p 16020:16020 -p 16030:16030 nidozhao/hbase-pseudo:1.2.0
```

#### verify master status

##### 0.98.12
open `http://127.0.0.1:60010/master-status` at browser

##### 1.2.0
open `http://127.0.0.1:16010/master-status` at browser

#### use hbase shell
```shell
$HBASE_HOME/bin/hbase shell
```

#### check master log
```
tail -f $HBASE_HOME/logs/hbase--master-hbasedocker.log
```
