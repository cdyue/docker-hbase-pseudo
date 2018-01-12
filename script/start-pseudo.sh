#!/bin/sh

${HBASE_HOME}/bin/hbase-daemon.sh start zookeeper
${HBASE_HOME}/bin/hbase-daemon.sh start regionserver
${HBASE_HOME}/bin/hbase-daemon.sh start master
tail -f /hbase-1.2.0/logs/*.out