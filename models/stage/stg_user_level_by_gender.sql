
{{ config(materialized='view') }}

WITH user_subscriptions AS (
    SELECT
        gender,
        level, 
        COUNT(DISTINCT userId) AS user_count
    FROM {{ ref('src_auth_events') }}
    WHERE gender IS NOT NULL AND level IS NOT NULL
    GROUP BY gender, level
)

SELECT
    gender,
    level,
    user_count
FROM user_subscriptions
