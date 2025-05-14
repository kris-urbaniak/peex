BEGIN;

CREATE TABLE IF NOT EXISTS warehouse.fact_location_usage
(
    location_id integer,
    location_total_launches integer,
    location_total_landings integer,
    load_ts timestamp without time zone,
    PRIMARY KEY (location_id)
);

ALTER TABLE IF EXISTS warehouse.fact_location_usage
    ADD CONSTRAINT fk_location FOREIGN KEY (location_id)
    REFERENCES warehouse.dim_location (location_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

COMMIT;
