# Ground Truth Query Execution Log

This document tracks executions of ground truth queries for validation and testing purposes.

---

## Query 5: Inventory Transactions Summary
**Query ID:** 5  
**Category:** Basic filtering + Aggregation  
**Natural Language:** "Show inventory movement summary by warehouse"

### Execution: 2026-01-13 14:30:00
- **Executed By:** williamt
- **Database:** SQLMesh DuckDB (local.db)
- **Environment:** default__dev
- **Status:** ✅ SUCCESS

#### SQL Query:
```sql
SELECT 
    warehouse_id,
    transaction_type,
    COUNT(*) as transaction_count,
    SUM(quantity) as total_quantity,
    MIN(transaction_date) as first_transaction,
    MAX(transaction_date) as last_transaction
FROM default__dev.inventory_transactions
GROUP BY warehouse_id, transaction_type
ORDER BY warehouse_id, transaction_type;
```

#### Results Summary:
- **Rows Returned:** 4
- **Execution Time:** ~0.23s
- **Tables Accessed:** `default__dev.inventory_transactions`

#### Sample Output:
| warehouse_id | transaction_type | transaction_count | total_quantity | first_transaction    | last_transaction     |
|--------------|------------------|-------------------|----------------|----------------------|----------------------|
| WH01         | INBOUND          | 2                 | 80.0           | 2026-01-01 08:00:00  | 2026-01-01 09:00:00  |
| WH01         | OUTBOUND         | 2                 | 15.0           | 2026-01-02 10:00:00  | 2026-01-03 14:00:00  |
| WH02         | INBOUND          | 1                 | 25.0           | 2026-01-02 11:00:00  | 2026-01-02 11:00:00  |

#### Validation Notes:
- ✅ **sqlglot parsing** - Successfully validated SQL syntax
- ✅ **CTE vs Table Detection** - Correctly identified table reference (not CTE)
- ✅ **GROUP BY** - Properly aggregates by warehouse_id and transaction_type
- ✅ **Aggregation Functions** - COUNT, SUM, MIN, MAX all working correctly
- ✅ **ORDER BY** - Produces predictable, sorted results
- ✅ **Gradio Integration** - Query loads and displays correctly in UI

#### Use Cases Validated:
- Inventory movement tracking across multiple warehouses
- Transaction type analysis (INBOUND vs OUTBOUND)
- Time-based activity tracking (first/last transaction dates)
- Multi-column aggregation patterns

#### Integration Tests:
- ✅ Loaded in Gradio "Ground Truth Examples" tab
- ✅ Parsed by GroundTruthQueryManager
- ✅ Metadata extracted correctly (category, natural language, tables)
- ✅ Syntax highlighting displays properly

---

## Query Execution Template

Use this template for future query validations:

```markdown
## Query N: [Query Name]
**Query ID:** N  
**Category:** [Category]  
**Natural Language:** "[Description]"

### Execution: YYYY-MM-DD HH:MM:SS
- **Executed By:** [username]
- **Database:** [database name]
- **Environment:** [environment name]
- **Status:** ✅ SUCCESS / ❌ FAILED

#### SQL Query:
\`\`\`sql
[SQL code here]
\`\`\`

#### Results Summary:
- **Rows Returned:** N
- **Execution Time:** Xs
- **Tables Accessed:** [list]

#### Sample Output:
[table or sample data]

#### Validation Notes:
- ✅/❌ [validation point 1]
- ✅/❌ [validation point 2]

#### Use Cases Validated:
- [use case 1]
- [use case 2]
```

---

## Execution History Summary

| Date       | Query ID | Query Name                  | Status | Rows | Time   | Validated By |
|------------|----------|----------------------------|--------|------|--------|--------------|
| 2026-01-13 | 5        | Inventory Transactions     | ✅     | 4    | 0.23s  | williamt     |

---

## Related Documentation
- [Ground Truth Queries](ground_truth_queries.sql)
- [SQLMesh Audits](12_SQLMesh_Audit.md)
- [Ground Truth Project Plan](GROUND_TRUTH_PROJECT_PLAN.md)
- [Query Integration Module](ground_truth_integration.py)
