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
