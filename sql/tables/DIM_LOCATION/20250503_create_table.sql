CREATE TABLE IF NOT EXISTS warehouse.dim_location
(
    location_id integer NOT NULL,
    location_name character varying(100),
    location_desc character varying,
    location_country_cd character(2),
    location_latitude double precision,
    location_longitude double precision,
    location_is_active boolean,
    location_map_image_url character varying(100),
    load_ts timestamp without time zone,
    PRIMARY KEY (location_id)
);
