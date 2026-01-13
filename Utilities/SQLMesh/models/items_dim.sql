MODEL (
    name items_dim,
    kind SEED (
        path '../seeds/src/menu_items.csv'
    ),
    columns (
        id VARCHAR,
        name VARCHAR
    ),
    grain (id)
);