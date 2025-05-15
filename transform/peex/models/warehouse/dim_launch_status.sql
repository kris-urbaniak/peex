{{ config(materialized='table') }}

with source as (
    select 
        launch_status_id,
        launch_status_name,
        launch_status_desc,
        current_timestamp as load_ts
    from {{ ref('stg_launch_status') }}
    where launch_status_id is not null
),

final as (
    select distinct * from source
)
select * from final
