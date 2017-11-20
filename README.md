# kafka-101

This git repo intends to setup a demo environment with 1 zookeeper, and three kafka Clusters

## Get Confluent Platform

`./scripts/get_confluent.sh`

This will download into sources the confluent oss 3.3.0

## Setup environment

`./scripts/setup_envs.sh`

## Start Environment

`./scripts/start_envs.sh`

## Single ops

`./scripts/start_one_kafka.sh KAFKA_ID`, with 1, 2 or 3 as agrument to start only one broker

`./scripts/stop_one_kafka.sh KAFKA_ID`, with 1, 2 or 3 as agrument to stop only one broker

## Cleanup !

`./scripts/cleanup.sh`, this will remove downloaded files, data and logs



