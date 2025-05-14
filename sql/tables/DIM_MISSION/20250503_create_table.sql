BEGIN;

CREATE TABLE IF NOT EXISTS warehouse.dim_mission
(
    mission_id integer NOT NULL,
    mission_name character varying(100),
    mission_type character varying(100),
    mission_desc character varying,
    mission_orbit_id integer,
    load_ts timestamp without time zone,
    PRIMARY KEY (mission_id)
);

ALTER TABLE IF EXISTS warehouse.dim_mission
    ADD CONSTRAINT fk_orbit FOREIGN KEY (mission_orbit_id)
    REFERENCES warehouse.dim_orbit (orbit_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

COMMIT;
