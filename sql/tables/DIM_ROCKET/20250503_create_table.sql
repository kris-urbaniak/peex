CREATE TABLE IF NOT EXISTS warehouse.dim_rocket
(
    rocket_id integer NOT NULL,
    rocket_launcher_configuration_id integer,
    load_ts timestamp without time zone,
    PRIMARY KEY (rocket_id)
);
