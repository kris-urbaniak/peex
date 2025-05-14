ALTER TABLE IF EXISTS warehouse.dim_rocket
    ADD CONSTRAINT fk_launcher_configuration FOREIGN KEY (rocket_launcher_configuration_id)
    REFERENCES warehouse.dim_launcher_configuration (launcher_configuration_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
