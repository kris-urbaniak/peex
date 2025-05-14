ALTER TABLE IF EXISTS warehouse.fact_location_usage
    ADD CONSTRAINT fk_location FOREIGN KEY (location_id)
    REFERENCES warehouse.dim_location (location_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
