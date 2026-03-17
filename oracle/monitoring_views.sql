CREATE VIEW db_performance_metrics AS
SELECT
    metric_name,
    value
FROM v$sysmetric;
