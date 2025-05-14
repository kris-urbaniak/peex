CREATE EXTENSION IF NOT EXISTS tablefunc;

CREATE VIEW WAREHOUSE.LAUNCH_CROSSTAB AS (
SELECT *
FROM crosstab(
    $$
    SELECT
        EXTRACT(YEAR FROM launch_net_ts)::INT AS launch_year,
        ls.launch_status_name,
        COUNT(*)::INT AS launch_count
    FROM warehouse.fact_launches f
    JOIN warehouse.dim_launch_status ls ON f.launch_status_id = ls.launch_status_id
    GROUP BY launch_year, ls.launch_status_name
    ORDER BY launch_year, ls.launch_status_name
    $$,
    $$ SELECT DISTINCT launch_status_name FROM warehouse.dim_launch_status ORDER BY 1 $$
) AS ct (
    launch_year INT,
    "Go for Launch" INT,
    "Launch Failure" INT,
    "Launch Successful" INT,
    "Launch was a Partial Failure" INT,
    "On Hold" INT,
    "Payload Deployed" INT,
    "To Be Confirmed" INT,
    "To Be Determined" INT
));
