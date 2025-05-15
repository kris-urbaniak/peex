{{ config(materialized='view') }}

with source as (
  select 
    *,
    row_number() over (
      partition by (message->'id'->>'string') 
      order by record_arrival_ts desc
    ) as rn
  from {{ source('staging', 'previous_launches') }}
  where (message->>'url') like '%launches%'
),

flattened as (
    select
        (message->'id'->>'string')::varchar(128) as launch_id,
        message->>'name'::varchar(100) as launch_name,

        -- Status info
        (message->'status'->>'id')::int as launch_status_id,

        -- Timing info
        (message->>'net')::timestamp as launch_net_ts,
        (message->>'window_start')::timestamp as launch_window_start_ts,
        (message->>'window_end')::timestamp as launch_window_end_ts,

        -- Mission info
        coalesce((message->'mission'->>'id')::int, 99999)::int as mission_id,
        coalesce(message->'mission'->>'name', 'Empty')::varchar(100) as mission_name,
        coalesce(message->'mission'->>'type', 'Empty')::varchar(100) as mission_type,
        coalesce(message->'mission'->>'description', 'Empty')::varchar as mission_desc,

        -- Orbit info
        (message->'mission'->'orbit'->>'id')::int as orbit_id,

        -- Pad info
        (message->'pad'->>'id')::int as pad_id,

        -- Rocket info
        (message->'rocket'->>'id')::int as rocket_id,

        -- Launcher configuration info
        (message->'rocket'->'configuration'->>'id')::int as launcher_configuration_id,

        -- Agencies info
        (message->'launch_service_provider'->>'id')::int as agency_id,

        load_ts as load_stage_ts

    from source
    where rn = 1
)

select * from flattened
