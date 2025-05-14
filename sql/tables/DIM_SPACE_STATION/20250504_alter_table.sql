ALTER TABLE IF EXISTS warehouse.dim_space_station
    ADD CONSTRAINT agency_fk FOREIGN KEY (space_station_agency_id)
    REFERENCES warehouse.dim_agency (agency_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
