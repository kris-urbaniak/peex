{{ config(materialized='table') }}

with source as (
    select 
        astronaut_id,
        astronaut_name,
        astronaut_status,
        astronaut_nationality,
        astronaut_birth_dt,
        astronaut_death_dt,
        agency_id as astronaut_agency_id,
        astronaut_bio,
        astronaut_wiki_url,
        current_timestamp as load_ts
    from {{ ref('stg_astronaut') }}
    where astronaut_id is not null
),
final as (
    select distinct * from source
)
select * from final
