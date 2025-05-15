{{ config(materialized='view') }}

with source as (
    select 
        *
    from {{ source('staging', 'pads') }}
    where (message->>'url') like '%pads%'
),

flattened as (
    select
        (message->>'id')::int as pad_id,
        message->>'name'::varchar(80) as pad_name,
        -- Country info
        coalesce(message->'country'->'struct'->>'alpha_2_code', 'XX')::char(2) as pad_country_cd,
        -- Location info
        (message->'location'->>'id')::int as pad_location_id,
        (message->>'active')::boolean as pad_is_active,
        (message->>'latitude')::double precision as pad_latitude,
        (message->>'longitude')::double precision  as pad_longitude,

        (message->>'total_launch_count')::int as total_launch_count,
        (message->>'orbital_launch_attempt_count')::int as orbital_launch_attempt_count
        
    from source
)

select * from flattened
