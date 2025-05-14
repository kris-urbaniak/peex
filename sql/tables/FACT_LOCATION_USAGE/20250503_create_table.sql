CREATE TABLE IF NOT EXISTS warehouse.fact_location_usage
(
    location_id integer,
    location_total_launches integer,
    location_total_landings integer,
    load_ts timestamp without time zone,
    PRIMARY KEY (location_id)
);
