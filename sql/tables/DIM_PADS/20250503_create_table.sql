CREATE TABLE IF NOT EXISTS warehouse.dim_pads
(
    pad_id integer NOT NULL,
    name character varying(255),
    location_id integer,
    PRIMARY KEY (pad_id)
);
