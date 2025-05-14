CREATE TABLE IF NOT EXISTS warehouse.dim_launch_status
(
    launch_status_id integer NOT NULL,
    launch_status_name character varying(30),
    launch_status_desc character varying,
    load_ts timestamp without time zone,
    PRIMARY KEY (launch_status_id)
);
