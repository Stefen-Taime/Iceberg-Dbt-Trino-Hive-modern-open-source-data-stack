{{ config(materialized='incremental', unique_key='id') }}

with source as (
    select
        CAST(ts AS VARCHAR) as id, 
        ts,
        CAST(sessionId AS VARCHAR) as sessionId,
        level,
        itemInSession,
        city,
        zip,
        state,
        userAgent,
        CAST(NULLIF(lon, '') AS double) as lon,
        CAST(NULLIF(lat, '') AS double) as lat,
        CAST(FLOOR(CAST(NULLIF(userId, '') AS DOUBLE)) AS INT) as userId, 
        lastName,
        firstName,
        gender,
        CAST(FLOOR(CAST(NULLIF(registration, '') AS DOUBLE)) AS BIGINT) as registration,
        success
    from {{ source('oltp', 'auth_events') }}
)

select
    id,
    ts,
    sessionId,
    level,
    itemInSession,
    city,
    zip,
    state,
    userAgent,
    lon,
    lat,
    userId,
    lastName,
    firstName,
    gender,
    registration, 
    CASE 
        WHEN CAST(success AS VARCHAR) = 't' THEN true 
        WHEN CAST(success AS VARCHAR) = 'f' THEN false
        ELSE NULL 
    END AS success_boolean
from source

{% if is_incremental() %}
    where ts > (select max(ts) from {{ this }})
{% endif %}
