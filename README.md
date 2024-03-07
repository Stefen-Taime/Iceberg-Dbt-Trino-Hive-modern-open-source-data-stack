# dbt-trino Starburst blog demo

The repository contains demo assets of dbt + Trino

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
