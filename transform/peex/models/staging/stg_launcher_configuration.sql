{{ config(materialized='view') }}

with source as (
    select 
        *
    from {{ source('staging', 'launcher_configurations') }}
    where (message->>'url') like '%launcher_configurations%'
),

flattened as (
    select
        (message->>'id')::int as launcher_configuration_id,
        message->>'name'::varchar(50) as launcher_configuration_name,
        message->>'variant'::varchar(30) as launcher_configuration_variant,
        message->>'wiki_url'::varchar(100) as launcher_configuration_wiki_url,
        (message->>'active' = 'true')::boolean as launcher_configuration_is_active,
        (message->>'reusable' = 'true')::boolean as launcher_configuration_is_reusable,
        (message->'manufacturer'->'struct'->>'id')::int as agency_id
    from source
)

select * from flattened
