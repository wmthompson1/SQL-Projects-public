MODEL (
    name inventory_transactions,
    kind SEED (
        path '../seeds/inventory_transactions.csv'
    ),
    columns (
        transaction_id INTEGER,
        item_id INTEGER,
        transaction_type VARCHAR,
        quantity DOUBLE,
        transaction_date TIMESTAMP,
        warehouse_id VARCHAR
    ),
    description 'Raw inventory transaction data loaded from CSV seed file.'
);