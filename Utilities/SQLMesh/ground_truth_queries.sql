-- ============================================================================
-- Ground Truth SQL Queries for SQLMesh DuckDB Database
-- Purpose: Reference examples for Gradio SQL generation endpoint
-- Database: Utilities/SQLMesh/local.db
-- ============================================================================

-- QUERY 1: Simple SELECT with filtering
-- Category: Basic filtering
-- Natural Language: "Show me all labor tickets with more than 7 hours"
-- Tables: labor_ticket_batch_processing
SELECT 
    ticket_id,
    batch_id,
    labor_hours,
    created_at
FROM labor_ticket_batch_processing
WHERE labor_hours > 7.0
ORDER BY labor_hours DESC;

-- ============================================================================

-- QUERY 2: Aggregation by batch
-- Category: Aggregation
-- Natural Language: "What is the total labor hours per batch?"
-- Tables: labor_ticket_batch_processing
SELECT 
    batch_id,
    COUNT(*) as ticket_count,
    SUM(labor_hours) as total_hours,
    AVG(labor_hours) as avg_hours_per_ticket,
    MIN(labor_hours) as min_hours,
    MAX(labor_hours) as max_hours
FROM labor_ticket_batch_processing
GROUP BY batch_id
ORDER BY total_hours DESC;

-- ============================================================================

-- QUERY 3: Date range filtering with aggregation
-- Category: Date filtering + Aggregation
-- Natural Language: "Show daily labor statistics for January 2026"
-- Tables: labor_ticket_batch_processing
SELECT 
    DATE_TRUNC('day', created_at) as work_date,
    COUNT(*) as tickets_processed,
    SUM(labor_hours) as total_hours,
    ROUND(AVG(labor_hours), 2) as avg_hours
FROM labor_ticket_batch_processing
WHERE created_at >= '2026-01-01' 
  AND created_at < '2026-02-01'
GROUP BY DATE_TRUNC('day', created_at)
ORDER BY work_date;

-- ============================================================================

-- QUERY 4: CTE with ranking
-- Category: Window functions
-- Natural Language: "Rank batches by total hours and show top 3"
-- Tables: labor_ticket_batch_processing
WITH batch_totals AS (
    SELECT 
        batch_id,
        COUNT(*) as ticket_count,
        SUM(labor_hours) as total_hours
    FROM labor_ticket_batch_processing
    GROUP BY batch_id
)
SELECT 
    batch_id,
    ticket_count,
    total_hours,
    RANK() OVER (ORDER BY total_hours DESC) as rank
FROM batch_totals
ORDER BY rank
LIMIT 3;

-- ============================================================================

-- QUERY 5: Inventory transactions analysis
-- Category: Basic filtering + Aggregation
-- Natural Language: "Show inventory movement summary by warehouse"
-- Tables: default__dev.inventory_transactions
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

-- ============================================================================

-- QUERY 6: Complex date filtering with CASE
-- Category: Conditional aggregation
-- Natural Language: "Categorize labor tickets by workload (light/medium/heavy) and count them"
-- Tables: labor_ticket_batch_processing
SELECT 
    CASE 
        WHEN labor_hours < 5.0 THEN 'Light'
        WHEN labor_hours >= 5.0 AND labor_hours < 8.0 THEN 'Medium'
        ELSE 'Heavy'
    END as workload_category,
    COUNT(*) as ticket_count,
    AVG(labor_hours) as avg_hours,
    SUM(labor_hours) as total_hours
FROM labor_ticket_batch_processing
GROUP BY 
    CASE 
        WHEN labor_hours < 5.0 THEN 'Light'
        WHEN labor_hours >= 5.0 AND labor_hours < 8.0 THEN 'Medium'
        ELSE 'Heavy'
    END
ORDER BY 
    CASE workload_category
        WHEN 'Light' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'Heavy' THEN 3
    END;

-- ============================================================================
-- SCHEMA REFERENCE
-- ============================================================================

-- Table: labor_ticket_batch_processing
-- Columns:
--   - ticket_id: INTEGER (primary identifier)
--   - batch_id: INTEGER (batch grouping)
--   - labor_hours: DOUBLE (hours worked)
--   - created_at: TIMESTAMP (when ticket was created)

-- Table: default__dev.inventory_transactions (SEED model)
-- Columns:
--   - transaction_id: INTEGER
--   - item_id: INTEGER
--   - transaction_type: VARCHAR (INBOUND/OUTBOUND)
--   - quantity: DOUBLE
--   - transaction_date: TIMESTAMP
--   - warehouse_id: VARCHAR

-- Table: default__dev.colors (SEED model)
-- Table: default__dev.issue_returns
-- Table: default__dev.items_dim (SEED from menu_items.csv)
-- Columns:
--   - id: VARCHAR (UUID)
--   - name: VARCHAR (item name)

-- ============================================================================
-- NOTES FOR SQL GENERATION ENDPOINT
-- ============================================================================
-- 
-- 1. Common Patterns:
--    - Use DATE_TRUNC for date grouping
--    - ROUND() for decimal precision
--    - CTEs for complex logic
--    - Window functions for ranking
--
-- 2. Schema Conventions:
--    - Dev environment tables: default__dev.<table_name>
--    - Main tables: <table_name> (implicitly main schema)
--    - Always check table availability in current environment
--
-- 3. DuckDB-specific features:
--    - SHOW ALL TABLES (to discover available tables)
--    - DESCRIBE <table> (to get schema)
--    - Strong date/time support with DATE_TRUNC
--    - Window functions fully supported
--
-- 4. Best Practices:
--    - Always include ORDER BY for predictable results
--    - Use explicit table aliases for joins
--    - Prefer explicit column names over SELECT *
--    - Use appropriate data types in comparisons
