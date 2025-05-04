CREATE TABLE IF NOT EXISTS warehouse.dim_rockets
(
    rocket_id integer NOT NULL,
    configuration_name character varying(255),
    family character varying(100),
    manufacturer_id integer,
    launch_mass_kg numeric(10, 2),
    leo_capacity_kg numeric(10, 2),
    gto_capacity_kg numeric(10, 2),
    PRIMARY KEY (rocket_id)
);
