MODEL (
    name items_agg,
    kind FULL,
    description 'Count of items per prefix (demonstrates aggregation on items_dim).'
);

SELECT
    SUBSTRING(id, 1, 1) AS id_prefix,
    COUNT(*) AS item_count
FROM items_dim
GROUP BY SUBSTRING(id, 1, 1);