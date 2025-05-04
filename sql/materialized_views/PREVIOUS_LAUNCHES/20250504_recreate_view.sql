DROP MATERIALIZED VIEW staging.previous_launches;

CREATE MATERIALIZED VIEW staging.previous_launches AS
SELECT message::jsonb AS message,
       load_ts,
       record_arrival_ts,
       source_path
FROM staging.previous_launches_staging
WHERE jsonb_typeof(message::jsonb) IS NOT NULL;
