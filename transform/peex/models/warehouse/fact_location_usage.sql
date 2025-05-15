{{ config(
    materialized='incremental',
    unique_key='location_id',
    incremental_strategy='merge'
) }}

with source as (
    select 
        location_id,
        total_launches as location_total_launches,
        total_landings as location_total_landings,
        current_timestamp as load_ts
    from {{ ref('stg_location') }}
    where location_id is not null
),
final as (
    select distinct * from source
)

select * from final
