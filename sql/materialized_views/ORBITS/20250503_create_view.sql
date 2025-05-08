CREATE MATERIALIZED VIEW staging.orbits AS
SELECT message::jsonb AS message,
       load_ts,
       record_arrival_ts,
       source_path
FROM staging.orbits_staging
WHERE load_ts = (
    SELECT MAX(load_ts)
    FROM staging.orbits_staging
    WHERE jsonb_typeof(message::jsonb) IS NOT NULL
)
AND jsonb_typeof(message::jsonb) IS NOT NULL;
