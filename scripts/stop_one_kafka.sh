#!/bin/bash

id=$1

if [ -z "$id" ]; 
then
   echo "You must specify the brokerid to bring down eg: 1"
   exit 1
fi

echo "Stopping kafka server $id..."
PIDS=$(ps -ef | grep server$id.properties | grep java | grep -v grep | awk '{print $2}')
if [ -z "$PIDS" ]; then
  # Normal Kafka is not running, but maybe we are running the support wrapper?
  if [ -z "${PIDS_SUPPORT}" ]; then
    echo "No kafka server to stop"
    exit 1
  else
    kill -s TERM $PIDS_SUPPORT
  fi
else
  kill -s TERM $PIDS
fi

#SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#BASE_DIR=$SCRIPT_DIR/../
#SRC_DIR=$BASE_DIR/sources

#$SRC_DIR/confluent-3.3.0/bin/kafka-server-stop $SRC_DIR/confluent-3.3.0/etc/kafka/server$id.properties
echo "Done"
