#!/bin/sh


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASE_DIR=$SCRIPT_DIR/../
SRC_DIR=$BASE_DIR/sources
ETC_DIR=$SRC_DIR/confluent-3.3.0/etc


export PATH=$SRC_DIR/confluent-3.3.0/bin:$PATH
