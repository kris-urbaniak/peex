{{ config(materialized='table') }}

with source as (
    select 
        launcher_configuration_id,
        launcher_configuration_name,
        launcher_configuration_variant,
        launcher_configuration_wiki_url,
        launcher_configuration_is_active,
        launcher_configuration_is_reusable,
        agency_id as launcher_configuration_agency_id,
        current_timestamp as load_ts
    from {{ ref('stg_launcher_configuration') }}
    where launcher_configuration_id is not null
),

final as (
    select distinct * from source
)
select * from final
