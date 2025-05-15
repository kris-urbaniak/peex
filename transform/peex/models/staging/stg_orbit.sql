{{ config(materialized='view') }}

with source as (
    select * from {{ source('staging', 'orbits') }}
),
flattened as (
    select
        (message->>'id')::int as orbit_id,
        message->>'name'::varchar(50) as orbit_name,
        message->>'abbrev'::varchar(20) as orbit_abbreviation
    from source
)
select * from flattened
