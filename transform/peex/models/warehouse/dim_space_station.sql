{{ config(materialized='table') }}

with source as (
    select 
        space_station_id,
        space_station_name,
        space_station_status,
        space_station_type,
        space_station_founded_dt,
        space_station_deorbited_dt,
        space_station_orbit_name,
        space_station_desc,
        agency_id as space_station_agency_id,
        current_timestamp as load_ts
    from {{ ref('stg_space_station') }}
    where space_station_id is not null
),

final as (
    select distinct * from source
)

select * from final
