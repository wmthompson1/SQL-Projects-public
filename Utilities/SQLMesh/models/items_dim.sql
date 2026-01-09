MODEL (
    name items_dim,
    kind FULL,
    description 'Dimension model for items built from items_model.'
);

SELECT
    id AS item_id,
    name AS item_name
FROM items_model;