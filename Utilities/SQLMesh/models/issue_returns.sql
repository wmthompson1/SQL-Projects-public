MODEL (
    name issue_returns,
    kind FULL,
    cron '@daily',
    description 'Issue Return transactions (CLASS=I, TYPE=I) - DuckDB test data'
);

-- Sample data for DuckDB testing (replace with SQL Server query when ready)
SELECT 
    1 AS TRANSACTION_ID,
    'SITE001' AS SITE_ID,
    'PART001' AS PART_ID,
    100.00 AS QTY,
    CURRENT_TIMESTAMP AS TRANSACTION_DATE,
    'I' AS CLASS,
    'I' AS TYPE
UNION ALL
SELECT 
    2, 'SITE001', 'PART002', 50.00, CURRENT_TIMESTAMP, 'I', 'I';

-- When switching to SQL Server, replace above with:
-- SELECT t.TRANSACTION_ID, t.SITE_ID, t.PART_ID, t.QTY, t.TRANSACTION_DATE
-- FROM Live.dbo.INVENTORY_TRANS t
-- WHERE t.CLASS = 'I' AND t.TYPE = 'I'