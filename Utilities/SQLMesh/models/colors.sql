MODEL (
    name colors, -- The name of the model
    kind FULL    -- The materialization strategy (e.g., VIEW, INCREMENTAL_BY_TIME_RANGE, FULL)
);

SELECT
    'Yellow' AS color,
    CURRENT_TIMESTAMP AS created_at;
