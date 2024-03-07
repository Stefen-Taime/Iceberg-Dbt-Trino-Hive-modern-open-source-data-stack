
{{ config(materialized='table') }}

SELECT
    total_unique_users
FROM {{ ref('stg_unique_users') }}
