
{{ config(materialized='table', unique_key='song') }}

WITH top_songs AS (
    SELECT
        artist,
        song,
        play_count
    FROM {{ ref('stg_top_songs_artists') }}
)

SELECT
    artist,
    song,
    play_count
FROM top_songs
