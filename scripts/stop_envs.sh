#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASE_DIR=$SCRIPT_DIR/../
SRC_DIR=$BASE_DIR/sources


echo "Stopping kafka brokers..."
for id in 1 2 3
do
  $SRC_DIR/confluent-3.3.0/bin/kafka-server-stop $SRC_DIR/confluent-3.3.0/etc/kafka/server$id.properties
done
echo "Done."

echo "Stopping Zookeeper..."
$SRC_DIR/confluent-3.3.0/bin/zookeeper-server-stop $SRC_DIR/confluent-3.3.0/etc/kafka/zookeeper.properties
echo "Done."
