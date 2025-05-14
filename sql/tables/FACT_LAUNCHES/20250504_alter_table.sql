
ALTER TABLE IF EXISTS warehouse.fact_launches
    ADD CONSTRAINT fk_agency FOREIGN KEY (launch_agency_id)
    REFERENCES warehouse.dim_agency (agency_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS warehouse.fact_launches
    ADD CONSTRAINT fk_status FOREIGN KEY (launch_status_id)
    REFERENCES warehouse.dim_launch_status (launch_status_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS warehouse.fact_launches
    ADD CONSTRAINT fk_pad FOREIGN KEY (launch_pad_id)
    REFERENCES warehouse.dim_pad (pad_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS warehouse.fact_launches
    ADD CONSTRAINT fk_mission FOREIGN KEY (launch_mission_id)
    REFERENCES warehouse.dim_mission (mission_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS warehouse.fact_launches
    ADD CONSTRAINT rocket_id FOREIGN KEY (launch_rocket_id)
    REFERENCES warehouse.dim_rocket (rocket_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
