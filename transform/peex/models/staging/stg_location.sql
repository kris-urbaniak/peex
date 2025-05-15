{{ config(materialized='view') }}

with source as (
    select 
        *
    from {{ source('staging', 'locations') }}
    where (message->>'url') like '%locations%'
),

flattened as (
    select
        (message->>'id')::int as location_id,
        (message->>'name')::varchar(100) as location_name,
        message->>'description'::varchar as location_desc,
        coalesce(message->'country'->>'alpha_2_code', 'XX')::char(2) as country_cd,
        (message->>'latitude')::double precision as location_latitude,
        (message->>'longitude')::double precision as location_longitude,
        (message->>'active' = 'true')::boolean as location_is_active,
        message->>'map_image'::varchar(100) as location_map_image_url,

        (message->>'total_launch_count')::int as total_launches,
        (message->>'total_landing_count')::int as total_landings
    from source
)

select * from flattened
