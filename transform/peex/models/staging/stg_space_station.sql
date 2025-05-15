{{ config(materialized='view') }}

with source as (
    select 
        *
    from {{ source('staging', 'space_stations') }}
    where (message->>'url') like '%space_stations%'
),

flattened as (
    select
        (message->>'id')::int as space_station_id,
        message->>'name'::varchar(40) as space_station_name,
        message->'status'->>'name'::varchar(20) as space_station_status,
        message->'type'->>'name'::varchar(15) as space_station_type,
        (message->>'founded')::date as space_station_founded_dt,
        coalesce(message->>'deorbited', '9999-12-31')::date as space_station_deorbited_dt,
        (message->>'orbit')::varchar(20) as space_station_orbit_name,
        message->>'description'::varchar as space_station_desc,
        (message->'owners'->0->>'id')::int as agency_id
    from source
)

select * from flattened
