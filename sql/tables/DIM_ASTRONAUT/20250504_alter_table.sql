ALTER TABLE IF EXISTS warehouse.dim_astronaut
    ADD CONSTRAINT agency_fk FOREIGN KEY (astronaut_agency_id)
    REFERENCES warehouse.dim_agency (agency_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
