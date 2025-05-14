CREATE TABLE IF NOT EXISTS warehouse.dim_mission
(
    mission_id integer NOT NULL,
    mission_name character varying(100),
    mission_type character varying(100),
    mission_desc character varying,
    mission_orbit_id integer,
    load_ts timestamp without time zone,
    PRIMARY KEY (mission_id)
);
