#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASE_DIR=$SCRIPT_DIR/../
SRC_DIR=$BASE_DIR/sources

echo "Starting Zookeeper..."
LOG_DIR=$BASE_DIR/logs $SRC_DIR/confluent-3.3.0/bin/zookeeper-server-start -daemon $SRC_DIR/confluent-3.3.0/etc/kafka/zookeeper.properties 
echo "Done."

echo "Starting kafka brokers..."
for id in 1 2 3
do
  LOG_DIR=$BASE_DIR/logs/kafka$id $SRC_DIR/confluent-3.3.0/bin/kafka-server-start -daemon $SRC_DIR/confluent-3.3.0/etc/kafka/server$id.properties
done
echo "Done."
