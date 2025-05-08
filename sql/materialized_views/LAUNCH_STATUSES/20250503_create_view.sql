CREATE MATERIALIZED VIEW staging.launch_statuses AS
SELECT message::jsonb AS message,
       load_ts,
       record_arrival_ts,
       source_path
FROM staging.launch_statuses_staging
WHERE load_ts = (
    SELECT MAX(load_ts)
    FROM staging.launch_statuses_staging
    WHERE jsonb_typeof(message::jsonb) IS NOT NULL
)
AND jsonb_typeof(message::jsonb) IS NOT NULL;
