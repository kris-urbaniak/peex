BEGIN;

CREATE TABLE IF NOT EXISTS warehouse.dim_astronaut
(
    astronaut_id integer NOT NULL,
    astronaut_name character varying(100),
    astronaut_status character varying(30),
    astronaut_nationality character varying(50),
    astronaut_birth_dt date,
    astronaut_death_dt date,
    astronaut_agency_id integer,
    astronaut_bio character varying,
    astronaut_wiki_url character varying(100),
    PRIMARY KEY (astronaut_id)
);

ALTER TABLE IF EXISTS warehouse.dim_astronaut
    ADD CONSTRAINT agency_fk FOREIGN KEY (astronaut_agency_id)
    REFERENCES warehouse.dim_agency (agency_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

COMMIT;
