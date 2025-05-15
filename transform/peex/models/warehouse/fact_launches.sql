{{ config(
    materialized='incremental',
    unique_key='launch_id',
    incremental_strategy='merge'
) }}

with source as (
    select 
        launch_id,
        launch_name,
        launch_status_id,
        launch_net_ts,
        launch_window_start_ts,
        launch_window_end_ts,
        mission_id as launch_mission_id,
        pad_id as launch_pad_id,
        rocket_id as launch_rocket_id,
        agency_id as launch_agency_id,
        load_stage_ts,
        current_timestamp as load_ts
    from {{ ref('stg_launch') }}
    where launch_id is not null
    and load_stage_ts > coalesce((
    select max(load_stage_ts)::timestamp 
    from {{ this }}
    ), to_timestamp('1900-01-01', 'YYYY-MM-DD'))
),

final as (
    select distinct * from source
)

select * from final
