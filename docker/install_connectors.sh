#!/bin/bash

# Define the name of the Kafka Connect container
CONNECT_CONTAINER_NAME="connect"

# Function to install Kafka Connect connectors
install_connector() {
    local connector=$1
    local version=$2

    echo "Installing $connector connector..."
    docker exec $CONNECT_CONTAINER_NAME confluent-hub install --no-prompt $connector:$version
    if [ $? -ne 0 ]; then
        echo "Error installing $connector connector. Exiting."
        exit 1
    fi
}

# Install the connectors
echo "Installing Kafka Connect connectors..."

install_connector "confluentinc/kafka-connect-s3" "10.5.0"
install_connector "confluentinc/kafka-connect-jdbc" "10.7.4"
install_connector  "debezium/debezium-connector-mongodb:2.0.1"
install_connector  "mongodb/kafka-connect-mongodb:1.9.1"

echo "Connectors have been successfully installed."

# Restart the Kafka Connect container
echo "Restarting Kafka Connect container..."
docker restart $CONNECT_CONTAINER_NAME
if [ $? -ne 0 ]; then
    echo "Error restarting Kafka Connect container. Exiting."
    exit 1
fi

echo "Kafka Connect container restarted successfully."
