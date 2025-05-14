ALTER TABLE IF EXISTS warehouse.dim_spacecraft
    ADD CONSTRAINT fk_agency FOREIGN KEY (manufacturer_id)
    REFERENCES warehouse.dim_agency (agency_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
