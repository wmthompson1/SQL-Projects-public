MODEL (
  name inventory_summary,
  kind INCREMENTAL_BY_TIME_RANGE (
    time_column transaction_date
  ),
  start '2026-01-01',
  cron '@daily',
  grain (item_id, ds)
);

SELECT 
  item_id,
  DATE_TRUNC('day', transaction_date) AS ds,
  SUM(CASE WHEN transaction_type = 'INBOUND' THEN quantity ELSE 0 END) AS total_inbound,
  SUM(CASE WHEN transaction_type = 'OUTBOUND' THEN quantity ELSE 0 END) AS total_outbound,
  SUM(CASE WHEN transaction_type = 'INBOUND' THEN quantity ELSE -quantity END) AS net_quantity,
  COUNT(*) AS transaction_count
FROM inventory_transactions
WHERE 
  transaction_date BETWEEN @start_date AND @end_date
GROUP BY 
  item_id,
  DATE_TRUNC('day', transaction_date)