CREATE TABLE IF NOT EXISTS warehouse.dim_locations
(
    location_id integer NOT NULL,
    name character varying(255),
    country_cd character(2),
    latitude numeric(9, 6),
    longtitude numeric(9, 6),
    PRIMARY KEY (location_id)
);
