# Iceberg + Dbt + Trino + Hive : pile de données moderne et open source

The repository contains demo assets of Iceberg + Dbt + Trino + Hive : pile de données moderne et open source

## Run the local Trino server

```
cd docker
docker compose up -build -d
```

## Run the dbt commands

```
dbt deps
dbt run
```
