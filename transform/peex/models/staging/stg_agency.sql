

{{ config(materialized='view') }}

with source as (
    select * from {{ source('staging', 'agencies') }}
    where (message->>'url') like '%agencies%'
),
flattened as (
    select
        (message->>'id')::int as agency_id,
        message->>'name'::varchar(150) as agency_name,
        message->'type'->>'name'::varchar(15) as agency_type,
        coalesce(message->'country'->0->>'alpha_2_code', 'XX')::char(2) as agency_country_cd,
        message->>'abbrev'::varchar(15) as agency_abbreviation,
        message->>'description'::varchar as agency_desc,
        message->>'administrator'::varchar(70) as agency_administrator,
        (message->>'founding_year')::int as agency_founding_year,
        coalesce(
            message->'logo'->>'image_url',
            message->'social_logo'->>'image_url'
        )::varchar as agency_logo_url
    from source
)
select * from flattened
