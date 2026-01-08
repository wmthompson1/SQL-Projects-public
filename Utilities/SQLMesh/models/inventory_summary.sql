MODEL (
    name inventory_summary,
    kind FULL,
    description 'Daily inventory summary by item (aggregates inventory_transactions).'
);

SELECT
    item_id,
    CAST(transaction_date AS DATE) AS ds,
    SUM(CASE WHEN transaction_type = 'INBOUND' THEN quantity ELSE 0 END) AS total_inbound,
    SUM(CASE WHEN transaction_type = 'OUTBOUND' THEN quantity ELSE 0 END) AS total_outbound,
    SUM(CASE WHEN transaction_type = 'INBOUND' THEN quantity ELSE -quantity END) AS net_quantity,
    COUNT(*) AS transaction_count
FROM inventory_transactions
GROUP BY 1, 2;