CREATE TABLE IF NOT EXISTS warehouse.dim_space_station
(
    space_station_id integer NOT NULL,
    space_station_name character varying(40),
    space_station_status character varying(20),
    space_station_type character varying(15),
    space_station_founded_dt date,
    space_station_deorbited_dt date,
    space_station_orbit_name character varying(20),
    space_station_desc character varying,
    space_station_agency_id integer,
    load_ts timestamp without time zone,
    PRIMARY KEY (space_station_id)
);
