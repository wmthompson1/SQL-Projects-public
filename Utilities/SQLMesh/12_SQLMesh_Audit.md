# SQLMesh Audits & Query Validation

**File Location:** `Utilities\SQLMesh\12_SQLMesh_Audit.md`

## Official Documentation
- [SQLMesh Audits](https://sqlmesh.readthedocs.io/en/latest/concepts/audits/)
- [YouTube Tutorial](https://www.youtube.com/watch?v=lk12xpKk28Q)

## Overview

SQLMesh Audits are data quality checks that validate model outputs. They can be used to:
- Ensure data integrity constraints
- Validate business logic
- Check for anomalies or outliers
- Enforce schema requirements

## Audit Types

### 1. Built-in Audits
SQLMesh provides several pre-built audits:
- `not_null` - Ensures column has no NULL values
- `unique` - Ensures column values are unique
- `accepted_values` - Column contains only specified values
- `relationship` - Foreign key validation
- `number_of_rows` - Row count validation

### 2. Custom Audits
Create custom SQL-based audits for specific business rules.

## Implementing Audits in Models

### Example 1: Basic Audit in Model Definition
```sql
MODEL (
  name inventory_summary,
  kind FULL,
  audits (
    not_null(columns := (item_id, ds)),
    unique(columns := (item_id, ds))
  )
);
```

### Example 2: Custom Audit
```sql
-- audits/assert_positive_quantities.sql
AUDIT (
  name assert_positive_quantities,
  dialect DuckDB
);

SELECT * FROM @this_model
WHERE total_quantity < 0;
```

Apply to model:
```sql
MODEL (
  name inventory_summary,
  kind FULL,
  audits (
    assert_positive_quantities
  )
);
```

## Ground Truth Query Validation

For our ground truth SQL queries, we use a different validation approach focused on:

1. **Syntax Validation** - sqlglot parsing
2. **Query Execution** - Run against test data
3. **Result Verification** - Check output correctness
4. **Documentation** - Log executions and results

### Validation Process
See [QUERY_EXECUTION_LOG.md](QUERY_EXECUTION_LOG.md) for detailed execution tracking.

#### Validation Checklist:
- [ ] sqlglot parses without errors
- [ ] Query executes successfully
- [ ] Returns expected number of rows
- [ ] Aggregations produce correct results
- [ ] CTE vs table references correctly identified
- [ ] Window functions work as expected
- [ ] Date functions handle edge cases

## Integration with Ground Truth Queries

Our ground truth queries complement SQLMesh audits by:
- Providing reference SQL patterns
- Demonstrating best practices
- Serving as validation baselines
- Training data for SQL generation

### Current Ground Truth Queries
See [ground_truth_queries.sql](ground_truth_queries.sql) for all 6 queries.

## Running Audits

### Test All Models with Audits
```bash
sqlmesh --paths Utilities/SQLMesh test
```

### Plan with Audit Validation
```bash
sqlmesh --paths Utilities/SQLMesh plan dev --auto-apply
```

Audits run automatically during plan execution. Failed audits prevent deployment.

## Best Practices

1. **Audit Early** - Define audits when creating models
2. **Test Audits** - Include audit scenarios in tests
3. **Document Rules** - Explain business logic in audit comments
4. **Monitor Performance** - Complex audits can slow deployment
5. **Use Built-ins First** - Leverage pre-built audits before custom

## Example: Full Model with Audits

```sql
MODEL (
  name inventory_summary,
  kind FULL,
  grain (item_id, ds),
  audits (
    not_null(columns := (item_id, ds)),
    unique(columns := (item_id, ds)),
    assert_positive_quantities
  )
);

SELECT
    item_id,
    CAST(transaction_date AS DATE) AS ds,
    SUM(CASE WHEN transaction_type = 'INBOUND' THEN quantity ELSE 0 END) AS total_inbound,
    SUM(CASE WHEN transaction_type = 'OUTBOUND' THEN quantity ELSE 0 END) AS total_outbound,
    SUM(CASE WHEN transaction_type = 'INBOUND' THEN quantity ELSE -quantity END) AS net_quantity,
    COUNT(*) AS transaction_count
FROM inventory_transactions
GROUP BY item_id, CAST(transaction_date AS DATE);
```

## Related Documentation
- [Ground Truth Query Execution Log](QUERY_EXECUTION_LOG.md)
- [Ground Truth Project Plan](GROUND_TRUTH_PROJECT_PLAN.md)
- [SQLMesh Testing Guide](05_Testing_and_Audits.md)

