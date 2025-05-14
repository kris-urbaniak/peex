CREATE TABLE IF NOT EXISTS warehouse.dim_orbit
(
    orbit_id integer,
    orbit_name character varying(50),
    orbit_abbreviation character varying(20),
    load_ts timestamp without time zone
);
