ALTER TABLE IF EXISTS warehouse.dim_mission
    ADD CONSTRAINT fk_orbit FOREIGN KEY (mission_orbit_id)
    REFERENCES warehouse.dim_orbit (orbit_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
