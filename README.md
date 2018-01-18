# Docker HBase Pseudo Mode
This repository contains Dockerfile of HBase 1.2.0 in pseudo distributed mode for Docker's [automated build](https://github.com/cdyue/docker-hbase-pseudo).

### Base Docker Image
- [openjdk](https://store.docker.com/images/openjdk?tab=description)

### Support HBase Version
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


##### 1.2.0
```shell
docker run -it --hostname=hbasedocker -p 2181:2181 -p 16000:16000 -p 16010:16010 -p 16020:16020 -p 16030:16030 nidozhao/hbase-pseudo:1.2.0
```
* initial
mount init-hbase.txt to `/hbase/hbase/init-hbase.txt`,it will be executed at the first time.

docker-compose
```
version: '2'
services:
  hbase-docker:
    hostname: hbase-docker
    image: libac/docker-hbase-pseudo:1.2.0
    ports:
      - "2181:2181"
      - "16000:16000"
      - "16010:16010"
      - "16020:16020"
      - "16030:16030"
    volumes:
      - ./data/hbase:/hbase/hbase
      - ./logs/hbase:/hbase-1.2.0/logs
    network_mode: "bridge"
    container_name: hbase-docker
```
#### verify master status

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
