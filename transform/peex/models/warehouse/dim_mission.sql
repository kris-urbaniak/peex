{{ config(materialized='table') }}

with source as (
    select 
        mission_id,
        mission_name,
        mission_desc,
        orbit_id as mission_orbit_id,
        current_timestamp as load_ts
    from {{ ref('stg_launch') }}
    where mission_id is not null
),

final as (
    select distinct * from source
)
select * from final

