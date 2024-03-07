
{{ config(materialized='view') }}

SELECT
    DATE_FORMAT(FROM_UNIXTIME(ts), '%Y-%m-%d') AS stream_date, 
    DATE_FORMAT(FROM_UNIXTIME(ts), '%H') AS stream_hour,
    COUNT(*) AS total_streams
FROM {{ ref('src_listen_events') }}
GROUP BY
    DATE_FORMAT(FROM_UNIXTIME(ts), '%Y-%m-%d'),
    DATE_FORMAT(FROM_UNIXTIME(ts), '%H')
