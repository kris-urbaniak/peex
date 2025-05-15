{{ config(materialized='view') }}

with source as (
    select * from {{ source('staging', 'astronauts') }}
    where (message->>'url') like '%astronauts%'
),
flattened as (
    select
        (message->>'id')::int as astronaut_id,
        message->>'name'::varchar(100) as astronaut_name,
        message->'status'->>'name'::varchar(30) as astronaut_status,
        coalesce(message->'nationality'->0->>'name', 'Unknown')::varchar(50) as astronaut_nationality,
        coalesce(message->>'date_of_birth', '9999-12-31') as astronaut_birth_dt,
        coalesce(message->>'date_of_death', '9999-12-31') as astronaut_death_dt,
        (message->'agency'->>'id')::int as agency_id,
        message->>'bio'::varchar as astronaut_bio,
        message->>'wiki'::varchar(100) as astronaut_wiki_url
    from source
)
select * from flattened
