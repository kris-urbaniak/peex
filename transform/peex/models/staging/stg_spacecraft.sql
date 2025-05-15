{{ config(materialized='view') }}

with source as (
    select 
        *
    from {{ source('staging', 'spacecraft') }}
    where (message->>'url') like '%spacecraft%'
),

flattened as (
    select
        (message->>'id')::int as spacecraft_id,
        message->>'name' as spacecraft_name,
        message->>'serial_number' as spacecraft_serial_number,
        message->'spacecraft_config'->>'name' as spacecraft_config_name,
        (message->'spacecraft_config'->'agency'->>'id')::int as agency_id,
        message->>'description' as spacecraft_desc,
        message->>'wiki_link' as spacecraft_wiki_url
    from source
)

select * from flattened
