
{{ config(materialized='table') }}

SELECT
  country,
  SUM(activity_count) AS total_activity
FROM {{ ref('stg_user_activity_per_country') }}
GROUP BY country
ORDER BY SUM(activity_count) DESC
