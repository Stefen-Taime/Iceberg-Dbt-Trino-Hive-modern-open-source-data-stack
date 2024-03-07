
{{ config(materialized='view') }}

WITH combined_activities AS (
  SELECT
    city,
    state,
    'auth_event' AS event_type,
    ts,
    userid
 FROM {{ ref('src_auth_events') }}
  UNION ALL
  SELECT
    city,
    state,
    'listen_event' AS event_type,
    ts,
    userid
  FROM {{ ref('src_listen_events') }}
  UNION ALL
  SELECT
    city,
    state,
    'page_view_event' AS event_type,
    ts,
    userid
  FROM {{ ref('src_page_view_events') }}
)

SELECT
  state,
  city,
  COUNT(*) AS activity_count
FROM combined_activities
GROUP BY state, city
