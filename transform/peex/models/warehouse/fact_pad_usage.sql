{{ config(
    materialized='incremental',
    unique_key='pad_id',
    incremental_strategy='merge'
) }}

with source as (
    select 
        pad_id,
        total_launch_count as pad_total_launches,
        orbital_launch_attempt_count as pad_orbital_attempts,
        current_timestamp as load_ts
    from {{ ref('stg_pad') }}
    where pad_id is not null
),
final as (
    select distinct * from source
)

select * from final
