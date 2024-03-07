
{{ config(materialized='view') }}

WITH song_plays AS (
    SELECT
        artist,
        song,
        COUNT(*) AS play_count
    FROM {{ ref('src_listen_events') }}
    GROUP BY artist, song
)

SELECT
    artist,
    song,
    play_count
FROM song_plays
ORDER BY play_count DESC
