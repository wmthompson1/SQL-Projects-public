MODEL (
    name inventory_transactions,
    kind FULL,
    description 'Test/source model that loads Utilities/SQLMesh/seeds/inventory_transactions.csv for local testing.'
);

SELECT
    CAST(transaction_id AS INTEGER) AS transaction_id,
    CAST(item_id AS INTEGER) AS item_id,
    transaction_type,
    CAST(quantity AS DOUBLE) AS quantity,
    CAST(transaction_date AS TIMESTAMP) AS transaction_date,
    warehouse_id
FROM read_csv_auto('seeds/inventory_transactions.csv', header=true);