CREATE TABLE IF NOT EXISTS warehouse.fact_launches
(
    launch_id character varying(255) NOT NULL,
    mission_id integer,
    rocket_id integer,
    pad_id integer,
    agency_id integer,
    status_id integer,
    date_id date,
    window_start_dt date,
    window_end_dt date,
    duration_mn numeric(6, 2),
    PRIMARY KEY (launch_id)
);
