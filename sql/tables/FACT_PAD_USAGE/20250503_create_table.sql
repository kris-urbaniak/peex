CREATE TABLE IF NOT EXISTS warehouse.fact_pad_usage
(
    pad_id integer,
    pad_total_launches integer,
    pad_orbital_attempts integer,
    load_ts timestamp without time zone,
    PRIMARY KEY (pad_id)
);
