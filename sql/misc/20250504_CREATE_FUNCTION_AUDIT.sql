CREATE OR REPLACE FUNCTION audit_fact_launches_update()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.launch_net_ts IS DISTINCT FROM NEW.launch_net_ts THEN
        INSERT INTO public.fact_launches_log (
            launch_id, old_net_ts, new_net_ts, changed_by
        )
        VALUES (
            OLD.launch_id, OLD.launch_net_ts, NEW.launch_net_ts, current_user
        );
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
