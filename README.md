
# Iceberg + Dbt + Trino + Hive: Modern, Open-Source Data Stack

The repository showcases a demo of integrating Iceberg, Dbt, Trino, and Hive, forming a modern and open-source data stack suitable for various analytical needs. This guide provides a structured approach to setting up and utilizing this stack effectively, ensuring a seamless workflow from data ingestion to analysis.

## Run the Local Trino Server

Before diving into the specifics of data transformation and analysis with Dbt, it's essential to have the Trino server up and running. Trino serves as a distributed SQL query engine that allows you to query your data across different sources seamlessly. Here's how to start the Trino server locally using Docker:

\```sh
cd docker
docker-compose up --build -d
\```

This command navigates to the Docker directory within your project and initiates the Docker Compose process, which builds and starts the containers defined in your `docker-compose.yml` file in detached mode.

## Integration with Kafka for Data Streaming

To simulate real-time data streaming in a music event context, follow the instructions from the GitHub repository [Stefen-Taime/eventmusic](https://github.com/Stefen-Taime/eventmusic.git). This repository contains scripts and configurations necessary for producing messages to Kafka, which acts as the backbone for real-time data handling in this stack.

### Preparing Kafka Connectors

After setting up the Docker containers and running the local Trino server, proceed with the Kafka connectors setup:

1. **Clone the Repository**: Clone the repository to access the necessary scripts and configuration files.
   \```sh
   git clone https://github.com/Stefen-Taime/eventmusic.git
   \```
   
2. **Set Permissions for `install_connectors.sh`**: This script installs the necessary Kafka connectors for integrating with PostgreSQL and MongoDB. Adjust the file permissions to make it executable.
   \```sh
   chmod +x install_connectors.sh
   \```
   
3. **Execute `install_connectors.sh`**: Run the script to install the Kafka connectors.
   \```sh
   ./install_connectors.sh
   \```

### Configuring Connectors and Producing Data

With the connectors installed, proceed to produce data to Kafka and configure the connections:

1. **Set Permissions for `postConnect.sh`**: This script configures the connectors and starts the data production to Kafka. Modify the permissions to ensure executability.
   \```sh
   chmod +x postConnect.sh
   \```
   
2. **Execute `postConnect.sh`**: Run the script to configure the connectors and initiate data streaming.
   \```sh
   ./postConnect.sh
   \```


## Run the Dbt Commands

With the Trino server running, the next step is to execute the necessary Dbt commands to manage your data transformations:

\```sh
dbt deps
dbt run
\```

`dbt deps` fetches the project's dependencies, ensuring that all required packages and modules are available. `dbt run` then executes the transformations defined in your dbt project, building your data models according to the specifications in your dbt files.   
