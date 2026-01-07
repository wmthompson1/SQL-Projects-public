-- Labor Ticket Batch Processing Model
-- Purpose: Tracks labor tickets requiring batch burden cost updates
-- Uses POSTING_CANDIDATE flag for restart-safe ETL operations

MODEL (
    name labor_ticket_batch_processing,  -- The name of the model
    kind FULL                             -- Complete refresh on each run
);

-- Sample data for DuckDB testing
SELECT 
    1 AS transaction_id,
    'SITE001' AS site_id,
    'EMP001' AS employee_id,
    'WC001' AS resource_id,
    'WO12345' AS workorder_base_id,
    CAST('2024-01-15 08:00:00' AS TIMESTAMP) AS transaction_date,
    'R' AS type,
    8.0 AS hours_worked,
    25.00 AS hourly_cost,
    200.00 AS act_labor_cost,
    50.00 AS act_burden_cost,
    NULL AS posting_candidate,
    'Direct' AS ticket_type

UNION ALL

SELECT 
    2, 'SITE001', 'EMP002', 'WC002',
    NULL,
    CAST('2024-01-15 09:00:00' AS TIMESTAMP),
    'S',
    2.0, 30.00, 60.00, 15.00,
    NULL,
    'Indirect'

UNION ALL

SELECT 
    3, 'SITE002', 'EMP003', 'WC001',
    'WO12346',
    CAST('2024-01-15 10:00:00' AS TIMESTAMP),
    'R',
    6.5, 28.00, 182.00, 45.50,
    'Y',
    'Direct';