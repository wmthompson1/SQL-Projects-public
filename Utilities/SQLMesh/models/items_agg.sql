MODEL (
    name items_agg,
    kind FULL,
    description 'Aggregate quantities per item (uses items_dim).'
);

SELECT
    item_id,
    SUM(qty) AS total_qty
FROM local.main.items_dim
GROUP BY item_id;