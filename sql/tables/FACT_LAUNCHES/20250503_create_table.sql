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
