CREATE TABLE public.fact_launches_log (
    log_id SERIAL PRIMARY KEY,
    launch_id VARCHAR(128),
    old_net_ts TIMESTAMP,
    new_net_ts TIMESTAMP,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    changed_by TEXT
);
