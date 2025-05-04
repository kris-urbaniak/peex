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
