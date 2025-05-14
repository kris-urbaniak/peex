ALTER TABLE IF EXISTS warehouse.dim_pad
    ADD CONSTRAINT fk_locations FOREIGN KEY (location_id)
    REFERENCES warehouse.dim_location (location_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
