#!/bin/bash


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASE_DIR=$SCRIPT_DIR/../
SRC_DIR=$BASE_DIR/sources

echo "Stopping ALL"
$BASE_DIR/scripts/stop_envs.sh

for var in logs data sources
do
  echo "removing $BASE_DIR/$var"
  /bin/rm -Rf $BASE_DIR/$var 2>&1 > /dev/null
done


