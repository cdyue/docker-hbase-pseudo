#!/bin/sh

${HBASE_HOME}/bin/hbase-daemon.sh start zookeeper
${HBASE_HOME}/bin/hbase-daemon.sh start regionserver
${HBASE_HOME}/bin/hbase-daemon.sh start master
