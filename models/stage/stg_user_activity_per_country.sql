
{{ config(materialized='view') }}

WITH combined_activities AS (
  SELECT
    country,
    'listen_event' AS event_type,
    ts,
    userid
  FROM {{ ref('src_listen_events') }}
  WHERE country IS NOT NULL
  UNION ALL
  SELECT
    'Unknown' AS country, 
    ts,
    userid
  FROM {{ ref('src_auth_events') }}
  UNION ALL
  SELECT
    'Unknown' AS country, 
    'page_view_event' AS event_type,
    ts,
    userid
  FROM {{ ref('src_page_view_events') }}
)

SELECT
  country,
  COUNT(*) AS activity_count
FROM combined_activities
GROUP BY country
