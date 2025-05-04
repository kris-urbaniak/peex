CREATE TABLE IF NOT EXISTS warehouse.dim_missions
(
    mission_id integer NOT NULL,
    name character varying(255),
    type character varying(100),
    description text,
    orbit character varying(100),
    PRIMARY KEY (mission_id)
);
