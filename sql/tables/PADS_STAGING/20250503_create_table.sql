CREATE TABLE IF NOT EXISTS staging.pads_staging
(
    message text COLLATE pg_catalog."default",
    load_ts timestamp without time zone,
    record_arrival_ts timestamp without time zone,
    source_path text COLLATE pg_catalog."default"
);
