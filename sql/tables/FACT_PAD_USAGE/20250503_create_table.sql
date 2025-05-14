BEGIN;

CREATE TABLE IF NOT EXISTS warehouse.fact_pad_usage
(
    pad_id integer,
    pad_total_launches integer,
    pad_orbital_attempts integer,
    load_ts timestamp without time zone,
    PRIMARY KEY (pad_id)
);

ALTER TABLE IF EXISTS warehouse.fact_pad_usage
    ADD CONSTRAINT fk_pad FOREIGN KEY (pad_id)
    REFERENCES warehouse.dim_pad (pad_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

COMMIT;
