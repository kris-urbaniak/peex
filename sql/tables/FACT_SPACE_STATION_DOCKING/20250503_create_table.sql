CREATE TABLE IF NOT EXISTS warehouse.fact_space_station_docking
(
    station_id integer NOT NULL,
    spacecraft_id integer NOT NULL,
    docked_dt date,
    undocked_dt date,
    PRIMARY KEY (station_id, spacecraft_id, docked_dt)
);
