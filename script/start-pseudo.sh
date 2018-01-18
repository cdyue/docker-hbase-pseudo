#!/bin/sh

${HBASE_HOME}/bin/hbase-daemon.sh start zookeeper
${HBASE_HOME}/bin/hbase-daemon.sh start regionserver
${HBASE_HOME}/bin/hbase-daemon.sh start master

if [[ ! -f /hbase/hbase/init-result ]]
then
  echo "sleep 30s and initialization..."
  sleep 30
  $HBASE_HOME/bin/hbase shell /hbase/hbase/init-hbase.txt > /hbase/hbase/init-result
fi
tail -f /hbase-1.2.0/logs/*.out