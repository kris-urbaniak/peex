CREATE TABLE IF NOT EXISTS warehouse.dim_space_stations
(
    station_id integer NOT NULL,
    name character varying(255),
    country_cd character(2),
    status character varying(100),
    crew_capacity smallint,
    PRIMARY KEY (station_id)
);
