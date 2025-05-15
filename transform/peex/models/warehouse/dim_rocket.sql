{{ config(materialized='table') }}

with source as (
    select 
        rocket_id,
        launcher_configuration_id as rocket_launcher_configuration_id,
        current_timestamp as load_ts
    from {{ ref('stg_launch') }}
    where rocket_id is not null
),

final as (
    select distinct * from source
)
select * from final
