#!/bin/bash

set -e

echo "Waiting for Elasticsearch to be ready..."
until curl -k -u "elastic:${ELASTIC_PASSWORD}" https://es01:9200 -s -f > /dev/null; do
  sleep 5
done

echo "Generating enrollment token..."
ENROLLMENT_TOKEN=$(docker exec es01 /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana)

echo "Starting Kibana with enrollment token..."
/usr/share/kibana/bin/kibana --enrollment-token "${ENROLLMENT_TOKEN}"