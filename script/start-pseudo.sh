#!/bin/sh

${HBASE_HOME}/bin/hbase-daemon.sh start zookeeper
${HBASE_HOME}/bin/hbase-daemon.sh start regionserver
${HBASE_HOME}/bin/hbase-daemon.sh start master

if [[ ! -f /data/init-result ]]
then
  echo "sleep 30s and initialization..."
  sleep 30
  $HBASE_HOME/bin/hbase shell /data/init-hbase.txt > /data/init-result
fi
tail -f /hbase-1.2.0/logs/*.out