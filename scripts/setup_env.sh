

# start zookeeper

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASE_DIR=$SCRIPT_DIR/../
SRC_DIR=$BASE_DIR/sources
mkdir -p $BASE_DIR/logs
mkdir -p $BASE_DIR/data/zookeeper

cat > $SRC_DIR/confluent-3.3.0/etc/kafka/zookeeper.properties << EOF
dataDir=$BASE_DIR/data/zookeeper
clientPort=2181
maxClientCnxns=0
EOF

mkdir -p $BASE_DIR/data/kafka1
mkdir -p $BASE_DIR/data/kafka2
mkdir -p $BASE_DIR/data/kafka3

echo "Setting up brokers..."
BROKER_PORTS=(empty 9092 9093 9094)
for id in 1 2 3
do
  cat > $SRC_DIR/confluent-3.3.0/etc/kafka/server$id.properties << EOF
# The id of the broker. This must be set to a unique integer for each broker.
broker.id=$id
delete.topic.enable=true
listeners=PLAINTEXT://:${BROKER_PORTS[$id]}
num.network.threads=3
num.io.threads=8
socket.send.buffer.bytes=102400
socket.receive.buffer.bytes=102400
socket.request.max.bytes=104857600
log.dirs=$BASE_DIR/data/kafka$id
num.partitions=16
num.recovery.threads.per.data.dir=1
auto.leader.rebalance.enable=true
offsets.topic.replication.factor=1
transaction.state.log.replication.factor=1
transaction.state.log.min.isr=1
log.retention.hours=168
#log.retention.bytes=1073741824
log.segment.bytes=1073741824
log.retention.check.interval.ms=300000
zookeeper.connect=localhost:2181
zookeeper.connection.timeout.ms=6000
#
group.initial.rebalance.delay.ms=0
confluent.support.customer.id=anonymous
EOF
done

#echo "Starting brokers..."
#for id in 1 2 3
#do
#  LOG_DIR=$BASE_DIR/logs/kafka$id $SRC_DIR/confluent-3.3.0/bin/kafka-server-start -daemon $SRC_DIR/confluent-3.3.0/etc/kafka/server$id.properties
#done
#echo "Done."


# Create Consumer group Configuration File
for var in 1 2
do 
  echo "group.id=console_app_$var" > $SRC_DIR/confluent-3.3.0/etc/kafka/consumer_app_$var.properties
done
