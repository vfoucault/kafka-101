#!/bin/bash

id=$1

if [ -z "$id" ]; 
then
   echo "You must specify the brokerid to bring down eg: 1"
   exit 1
fi
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASE_DIR=$SCRIPT_DIR/../
SRC_DIR=$BASE_DIR/sources

echo "Starting kafka server $id..."
LOG_DIR=$BASE_DIR/logs/kafka$id $SRC_DIR/confluent-3.3.0/bin/kafka-server-start -daemon $SRC_DIR/confluent-3.3.0/etc/kafka/server$id.properties
echo "Done"
