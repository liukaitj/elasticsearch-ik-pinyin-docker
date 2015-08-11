#!/bin/sh

OPTS="-Des.path.data=/data \
  -Des.path.logs=/logs \
  -Des.transport.tcp.port=9300 \
  -Des.http.port=9200"

if [ -n "$CLUSTER_NAME" ]; then
  OPTS="$OPTS -Des.cluster.name=$CLUSTER_NAME"
fi

if [ -n "$NODE_NAME" ]; then
  OPTS="$OPTS -Des.node.name=$NODE_NAME"
fi

if [ -n "$NODE_MASTER" ]; then
  OPTS="$OPTS -Des.node.master=$NODE_MASTER"
fi

if [ -n "$NODE_DATA" ]; then
  OPTS="$OPTS -Des.node.data=$NODE_DATA"
fi

if [ -n "$INDEX_NUMBER_SHARDS" ]; then
  OPTS="$OPTS -Des.index.number_of_shards=$INDEX_NUMBER_SHARDS"
fi

if [ -n "$INDEX_NUMBER_REPLICAS" ]; then
  OPTS="$OPTS -Des.index.number_of_replicas=$INDEX_NUMBER_REPLICAS"
fi

if [ -n "$UNICAST_HOSTS" ]; then
  OPTS="$OPTS -Des.discovery.zen.ping.unicast.hosts=$UNICAST_HOSTS"
fi

if [ -n "$PUBLISH_AS" ]; then
  OPTS="$OPTS -Des.transport.publish_host=$(echo $PUBLISH_AS | awk -F: '{print $1}')"
  OPTS="$OPTS -Des.transport.publish_port=$(echo $PUBLISH_AS | awk -F: '{if ($2) print $2; else print 9300}')"
fi

echo "Starting Elasticsearch with the options $OPTS"
$ES_HOME/bin/elasticsearch $OPTS
