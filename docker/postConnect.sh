#!/bin/bash

KAFKA_CONNECT_URL="http://localhost:8083/connectors"

curl -X POST -H "Content-Type: application/json" --data @listen_eventsSink.json $KAFKA_CONNECT_URL

sleep 2

curl -X POST -H "Content-Type: application/json" --data @page_view_eventsSink.json $KAFKA_CONNECT_URL

sleep 2

curl -X POST -H "Content-Type: application/json" --data @PostgresSink.json $KAFKA_CONNECT_URL

echo "Configuration des connecteurs envoyée à Kafka Connect."
