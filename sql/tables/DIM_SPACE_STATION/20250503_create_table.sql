CREATE TABLE IF NOT EXISTS warehouse.dim_space_station
(
    station_id integer NOT NULL,
    space_station_name character varying(40),
    space_station_status character varying(20),
    space_station_type character varying(15),
    space_station_founded_dt date,
    space_station_deorbited_dt date,
    space_station_orbit_name character varying(20),
    space_station_desc character varying,
    space_station_agency_id integer,
    load_ts timestamp without time zone,
    PRIMARY KEY (station_id)
);

ALTER TABLE IF EXISTS warehouse.dim_space_station
    ADD CONSTRAINT agency_fk FOREIGN KEY (space_station_agency_id)
    REFERENCES warehouse.dim_agency (agency_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
