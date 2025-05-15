{{ config(materialized='table') }}

with source as (
    select 
        agency_id,
        agency_name,
        agency_type,
        agency_country_cd,
        agency_abbreviation,
        agency_desc,
        agency_administrator,
        agency_founding_year,
        agency_logo_url,
        current_timestamp as load_ts
    from {{ ref('stg_agency') }}
    where agency_id is not null
),
final as (
    select distinct * from source
)
select * from final
