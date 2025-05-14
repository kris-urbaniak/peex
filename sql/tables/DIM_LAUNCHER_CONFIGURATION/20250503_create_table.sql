BEGIN;

CREATE TABLE IF NOT EXISTS warehouse.dim_launcher_configuration
(
    launcher_configuration_id integer,
    launcher_configuration_name character varying(50),
    launcher_configuration_variant character varying(30),
    launcher_configuration_wiki_url character varying(100),
    launcher_configuration_is_active boolean,
    launcher_configuration_is_reusable boolean,
    launcher_configuration_agency_id integer,
    load_ts timestamp without time zone
);

ALTER TABLE IF EXISTS warehouse.dim_launcher_configuration
    ADD CONSTRAINT fk_agency FOREIGN KEY (launcher_configuration_agency_id)
    REFERENCES warehouse.dim_agency (agency_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

COMMIT;
