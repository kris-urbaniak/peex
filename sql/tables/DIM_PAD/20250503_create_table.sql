CREATE TABLE IF NOT EXISTS warehouse.dim_pad
(
    pad_id integer NOT NULL,
    pad_name character varying(80),
    pad_country_cd character(2),
    pad_location_id integer,
    pad_is_active boolean,
    pad_latitude double precision,
    pad_longitude double precision,
    load_ts timestamp without time zone,
    PRIMARY KEY (pad_id)
);
