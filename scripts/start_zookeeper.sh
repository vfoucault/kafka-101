#!/bin/bash

id=$1

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASE_DIR=$SCRIPT_DIR/../
SRC_DIR=$BASE_DIR/sources

echo "Starting zookeeper server..."
LOG_DIR=$BASE_DIR/logs $SRC_DIR/confluent-3.3.0/bin/zookeeper-server-start -daemon $SRC_DIR/confluent-3.3.0/etc/kafka/zookeeper.properties
echo "Done."
