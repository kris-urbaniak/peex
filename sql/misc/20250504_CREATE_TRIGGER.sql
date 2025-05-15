CREATE TRIGGER trg_audit_fact_launches_update
AFTER UPDATE ON warehouse.fact_launches
FOR EACH ROW
EXECUTE FUNCTION audit_fact_launches_update();
