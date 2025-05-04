CREATE TABLE IF NOT EXISTS warehouse.dim_launch_status
(
    status_id integer NOT NULL,
    name character varying(100),
    description text,
    PRIMARY KEY (status_id)
);
