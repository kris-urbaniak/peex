ALTER TABLE IF EXISTS warehouse.fact_pad_usage
    ADD CONSTRAINT fk_pad FOREIGN KEY (pad_id)
    REFERENCES warehouse.dim_pad (pad_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
