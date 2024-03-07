
{{ config(materialized='view') }}

SELECT
    COUNT(DISTINCT userid) AS total_unique_users
FROM {{ ref('src_listen_events') }}
WHERE userid IS NOT NULL
