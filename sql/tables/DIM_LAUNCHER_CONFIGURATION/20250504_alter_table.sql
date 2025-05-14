ALTER TABLE IF EXISTS warehouse.dim_launcher_configuration
    ADD CONSTRAINT fk_agency FOREIGN KEY (launcher_configuration_agency_id)
    REFERENCES warehouse.dim_agency (agency_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
