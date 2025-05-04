CREATE TABLE IF NOT EXISTS warehouse.dim_astronauts
(
    astronaut_id integer NOT NULL,
    name character varying(255),
    date_of_birth date,
    nationality character varying(100),
    agency_id integer,
    status character varying(50),
    PRIMARY KEY (astronaut_id)
);
