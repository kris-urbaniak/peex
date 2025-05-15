{{ config(materialized='view') }}

with source as (
    select * from {{ source('staging', 'launch_statuses') }}
),
flattened as (
    select
        (message->>'id')::int as launch_status_id,
        message->>'name'::varchar(30) as launch_status_name,
        message->>'description'::varchar as launch_status_desc
    from source
)
select * from flattened
