CREATE MATERIALIZED VIEW staging.locations AS
SELECT message::jsonb AS message,
       load_ts,
       record_arrival_ts,
       source_path
FROM staging.locations_staging
WHERE load_ts = (
    SELECT MAX(load_ts)
    FROM staging.locations_staging
    WHERE jsonb_typeof(message::jsonb) IS NOT NULL
)
AND jsonb_typeof(message::jsonb) IS NOT NULL;
