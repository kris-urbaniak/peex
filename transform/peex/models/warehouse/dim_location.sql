{{ config(materialized='table') }}

with source as (
    select
        location_id,
        location_name,
        location_desc,
        country_cd as location_country_cd,
        location_latitude,
        location_longitude,
        location_is_active,
        location_map_image_url,
        current_timestamp as load_ts
    from {{ ref('stg_location') }}
),

final as (
    select distinct * from source
)
select * from final
