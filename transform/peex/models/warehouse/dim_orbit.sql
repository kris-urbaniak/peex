{{ config(materialized='table') }}

with source as (
    select 
        orbit_id,
        orbit_name,
        orbit_abbreviation,
        current_timestamp as load_ts
    from {{ ref('stg_orbit') }}
    where orbit_id is not null
),
final as (
    select distinct * from source
)
select * from final
