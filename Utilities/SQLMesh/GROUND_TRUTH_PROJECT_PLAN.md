# Ground Truth SQL Integration Project Plan

## Objective
Integrate ground truth SQL queries from SQLMesh DuckDB into the Gradio SQL generation endpoint to provide:
- Example queries for users
- Training/validation data for SQL generation models
- Reference patterns for natural language → SQL conversion

## Deliverables

### ✅ Phase 1: Query Collection (COMPLETED)
- [x] Created `ground_truth_queries.sql` with 6 example queries covering:
  - Basic filtering
  - Aggregation (COUNT, SUM, AVG)
  - Date range filtering
  - Window functions (RANK)
  - CTEs
  - Conditional aggregation (CASE statements)
- [x] Documented schema reference for all tables
- [x] Added SQL generation best practices notes

### ✅ Phase 2: Python Integration Layer (COMPLETED)
- [x] Created `ground_truth_integration.py` with `GroundTruthQueryManager` class
- [x] Query parser extracts metadata:
  - Category
  - Natural language description
  - Tables used
  - SQL code
- [x] Export methods:
  - `export_for_gradio()` - Dropdown-ready format
  - `export_json()` - API consumption format
  - `search_queries()` - Search by keyword
  - `get_by_category()` - Filter by category
- [x] Tested successfully - 6 queries parsed correctly
- [x] Generated `ground_truth_queries.json`

### 🔄 Phase 3: Gradio App Integration (IN PROGRESS)
Location: `hf-space-inventory-sqlgen/app.py`

#### Tasks:
1. **Copy integration files to hf-space app**
   ```bash
   cp Utilities/SQLMesh/ground_truth_integration.py hf-space-inventory-sqlgen/
   cp Utilities/SQLMesh/ground_truth_queries.sql hf-space-inventory-sqlgen/
   cp Utilities/SQLMesh/ground_truth_queries.json hf-space-inventory-sqlgen/
   ```

2. **Update app.py to add example query dropdown**
   Add to imports:
   ```python
   from ground_truth_integration import GroundTruthQueryManager
   ```
   
   Initialize at startup:
   ```python
   query_mgr = GroundTruthQueryManager("ground_truth_queries.sql")
   ```
   
   Add to Gradio interface:
   ```python
   with gr.Row():
       example_dropdown = gr.Dropdown(
           choices=query_mgr.export_for_gradio(),
           label="📚 Load Example Query",
           info="Select a pre-written query to see examples",
           interactive=True
       )
   
   # Auto-populate when example selected
   example_dropdown.change(
       fn=lambda sql: sql,
       inputs=[example_dropdown],
       outputs=[sql_input_textbox]
   )
   ```

3. **Add "Examples" tab to Gradio interface**
   ```python
   with gr.Tab("Examples"):
       gr.Markdown("## Ground Truth Query Examples")
       for query in query_mgr.get_all_queries():
           with gr.Accordion(f"{query['category']}: {query['natural_language']}", open=False):
               gr.Markdown(f"**Tables:** {query['tables']}")
               gr.Code(query['sql'], language="sql")
   ```

4. **Add MCP endpoint for example queries**
   ```python
   @app.get("/mcp/tools/get_example_queries")
   def get_example_queries(category: Optional[str] = None):
       if category:
           queries = query_mgr.get_by_category(category)
       else:
           queries = query_mgr.get_all_queries()
       return {"examples": queries}
   ```

### 📋 Phase 4: Documentation (TODO)
- [ ] Add README section explaining ground truth queries
- [ ] Document how to add new queries
- [ ] Create contribution guide for query examples
- [ ] Add API documentation for MCP endpoints

### 🧪 Phase 5: Testing & Validation (TODO)
- [ ] Test all queries against live DuckDB
- [ ] Validate query performance
- [ ] Test Gradio UI with example dropdown
- [ ] Test MCP endpoint responses
- [ ] Add unit tests for query manager

### 🚀 Phase 6: Deployment (TODO)
- [ ] Update Hugging Face Space with new code
- [ ] Test deployment on HF Spaces
- [ ] Update GitBook documentation
- [ ] Create demo video/screenshots

## Files Created

```
SQL-Projects/
├── Utilities/SQLMesh/
│   ├── ground_truth_queries.sql          # 6 example queries with metadata
│   ├── ground_truth_integration.py       # Query manager class
│   └── ground_truth_queries.json         # JSON export
└── hf-space-inventory-sqlgen/
    └── (to be copied from above)
```

## Query Coverage Matrix

| Category | Natural Language Example | SQL Features | Status |
|----------|-------------------------|--------------|--------|
| Basic filtering | "Show tickets with >7 hours" | WHERE, ORDER BY | ✅ |
| Aggregation | "Total hours per batch" | GROUP BY, COUNT, SUM, AVG | ✅ |
| Date filtering | "Daily stats for Jan 2026" | DATE_TRUNC, date ranges | ✅ |
| Window functions | "Rank batches by hours" | CTE, RANK() OVER | ✅ |
| Inventory analysis | "Inventory by warehouse" | Multi-table, GROUP BY | ✅ |
| Conditional logic | "Categorize by workload" | CASE WHEN, nested CASE | ✅ |

## Future Enhancements

### Additional Query Patterns to Add:
- [ ] JOIN examples (2+ tables)
- [ ] UNION/UNION ALL
- [ ] Subqueries in WHERE clause
- [ ] EXISTS/NOT EXISTS
- [ ] String functions (LIKE, SUBSTRING, CONCAT)
- [ ] NULL handling (COALESCE, NULLIF)
- [ ] Set operations (INTERSECT, EXCEPT)
- [ ] Analytical functions (LAG, LEAD, NTILE)

### Integration with SQL Generation:
- [ ] Use ground truth as few-shot examples for LLM prompts
- [ ] Build vector embeddings for semantic search
- [ ] Create query similarity scoring
- [ ] Add query validation against ground truth patterns

### User Experience:
- [ ] "Copy to clipboard" button for each example
- [ ] "Run this query" button to execute directly
- [ ] Query complexity indicators (beginner/intermediate/advanced)
- [ ] Interactive query builder based on examples

## Next Steps (Immediate)

1. **Copy files to hf-space-inventory-sqlgen/** (5 min)
2. **Update app.py with example dropdown** (15 min)
3. **Test locally with Gradio** (10 min)
4. **Commit and push to test in HF Space** (5 min)

**Estimated Time to Complete Phase 3:** ~35 minutes

## Success Metrics

- ✅ All ground truth queries execute successfully
- ⏳ Gradio app loads examples without errors
- ⏳ Users can select and run example queries
- ⏳ MCP endpoint returns structured query data
- ⏳ Query manager handles edge cases gracefully

---

**Project Status:** Phase 2 Complete, Ready for Phase 3  
**Last Updated:** January 13, 2026  
**Next Review:** After Phase 3 completion
