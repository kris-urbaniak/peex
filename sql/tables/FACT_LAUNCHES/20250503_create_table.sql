BEGIN;

CREATE TABLE IF NOT EXISTS warehouse.fact_launches
(
    launch_id character varying(128) NOT NULL,
    launch_name character varying(100),
    launch_status_id integer,
    launch_net_ts timestamp without time zone,
    launch_window_start_dt date,
    launch_window_end_dt date,
    launch_mission_id integer,
    launch_pad_id integer,
    launch_rocket_id integer,
    launch_agency_id integer,
    load_stage_ts timestamp without time zone,
    load_ts timestamp without time zone,
    PRIMARY KEY (launch_id)
);

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

COMMIT;
