BEGIN;

CREATE TABLE IF NOT EXISTS warehouse.dim_rocket
(
    rocket_id integer NOT NULL,
    rocket_launcher_configuration_id integer,
    load_ts timestamp without time zone,
    PRIMARY KEY (rocket_id)
);

ALTER TABLE IF EXISTS warehouse.dim_rocket
    ADD CONSTRAINT fk_launcher_configuration FOREIGN KEY (rocket_launcher_configuration_id)
    REFERENCES warehouse.dim_launcher_configuration (launcher_configuration_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

COMMIT;
