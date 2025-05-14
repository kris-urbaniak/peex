BEGIN;

CREATE TABLE IF NOT EXISTS warehouse.dim_spacecraft
(
    spacecraft_id integer NOT NULL,
    name character varying(255),
    type character varying(100),
    manufacturer_id integer,
    crew_capacity smallint,
    description text,
    PRIMARY KEY (spacecraft_id)
);

ALTER TABLE IF EXISTS warehouse.dim_spacecraft
    ADD CONSTRAINT fk_agency FOREIGN KEY (manufacturer_id)
    REFERENCES warehouse.dim_agency (agency_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

COMMIT;
