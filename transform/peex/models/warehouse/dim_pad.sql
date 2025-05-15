{{ config(materialized='table') }}

with source as (
    select 
        pad_id,
        pad_name,
        pad_country_cd,
        pad_location_id,
        pad_is_active,
        pad_latitude,
        pad_longitude,
        current_timestamp as load_ts
    from {{ ref('stg_pad') }}
    where pad_id is not null
),

final as (
    select distinct * from source
)
select * from final
