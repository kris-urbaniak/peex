CREATE MATERIALIZED VIEW staging.launcher_configurations AS
SELECT message::jsonb AS message,
       load_ts,
       record_arrival_ts,
       source_path
FROM staging.launcher_configurations_staging
WHERE load_ts = (
    SELECT MAX(load_ts)
    FROM staging.launcher_configurations_staging
    WHERE jsonb_typeof(message::jsonb) IS NOT NULL
)
AND jsonb_typeof(message::jsonb) IS NOT NULL;
