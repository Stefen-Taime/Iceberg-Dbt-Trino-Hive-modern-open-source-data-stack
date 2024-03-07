
{{ config(materialized='table') }}

SELECT
    gender,
    level,
    SUM(user_count) AS total_users,
    ROUND(SUM(user_count) * 100.0 / SUM(SUM(user_count)) OVER (), 2) AS percentage_of_total_users
FROM {{ ref('stg_user_level_by_gender') }}
GROUP BY gender, level
