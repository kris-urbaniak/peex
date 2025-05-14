CREATE TABLE IF NOT EXISTS warehouse.dim_launcher_configuration
(
    launcher_configuration_id integer NOT NULL,
    launcher_configuration_name character varying(50),
    launcher_configuration_variant character varying(30),
    launcher_configuration_wiki_url character varying(100),
    launcher_configuration_is_active boolean,
    launcher_configuration_is_reusable boolean,
    launcher_configuration_agency_id integer,
    load_ts timestamp without time zone,
    PRIMARY KEY (launcher_configuration_id)
);
