CREATE INDEX IF NOT EXISTS idx_fact_launches_agency_id
    ON warehouse.fact_launches (launch_agency_id);

CREATE INDEX IF NOT EXISTS idx_fact_launches_status_id
    ON warehouse.fact_launches (launch_status_id);

CREATE INDEX IF NOT EXISTS idx_fact_launches_pad_id
    ON warehouse.fact_launches (launch_pad_id);

CREATE INDEX IF NOT EXISTS idx_fact_launches_mission_id
    ON warehouse.fact_launches (launch_mission_id);

CREATE INDEX IF NOT EXISTS idx_fact_launches_rocket_id
    ON warehouse.fact_launches (launch_rocket_id);

-- Index on launch_net_ts for faster range queries on date/time
CREATE INDEX IF NOT EXISTS idx_fact_launches_net_ts
    ON warehouse.fact_launches (launch_net_ts);
