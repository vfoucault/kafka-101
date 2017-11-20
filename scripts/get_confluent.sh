#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASE_DIR=$SCRIPT_DIR/../
SRC_DIR=$BASE_DIR/sources
mkdir $SRC_DIR 2>/dev/null
echo "Downloading confluent OSS 3.3.0..."
curl --silent -o $SRC_DIR/confluent-oss-3.3.0-2.11.tar.gz http://packages.confluent.io/archive/3.3/confluent-oss-3.3.0-2.11.tar.gz
cd $SRC_DIR
tar xzpf confluent-oss-3.3.0-2.11.tar.gz
echo "Done. CP Oss 3.3.0 available in $SRC_DIR/sources/confluent-3.3.0"
