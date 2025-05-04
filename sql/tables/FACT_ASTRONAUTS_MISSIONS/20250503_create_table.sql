CREATE TABLE IF NOT EXISTS warehouse.fact_astronauts_missions
(
    astronaut_id integer NOT NULL,
    mission_id integer NOT NULL,
    role character varying(100),
    PRIMARY KEY (astronaut_id, mission_id)
);
