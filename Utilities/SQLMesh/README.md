note: .github\workflows\sqlmesh.yml  -- I may have versioned this file using multiple commits

sqlmesh --paths . plan dev --auto-apply --include-unmodified

======================================================================
Successfully Ran 1 tests against duckdb in 0.13 seconds.
----------------------------------------------------------------------

New environment `dev` will be created from `prod`

# See all schemas
sqlmesh --paths . fetchdf "SELECT schema_name FROM information_schema.schemata"

# See all tables including dev environment
sqlmesh --paths . fetchdf "SELECT table_schema, table_name FROM information_schema.tables WHERE table_schema LIKE 'sqlmesh%' OR table_name = 'labor_ticket_batch_processing'"

# Query the dev version of your model
sqlmesh --paths . fetchdf "SELECT * FROM sqlmesh__dev.labor_ticket_batch_processing"

## Environments
## Query production source
sqlmesh --paths . fetchdf "SELECT * FROM main.labor_ticket_batch_processing"

## Query default environment
sqlmesh --paths .  fetchdf "SELECT * FROM sqlmesh__default.labor_ticket_batch_processing__85582759"

## Query dev environment  
sqlmesh --paths . fetchdf "SELECT * FROM default__dev.labor_ticket_batch_processing"

# Get table name
## See all tables in sqlmesh__default schema
sqlmesh --paths . fetchdf "SELECT table_name FROM information_schema.tables WHERE table_schema = 'sqlmesh__default'"

**should be**
# Query default environment (note: 85582959 not 85582759)
sqlmesh --paths .  fetchdf "SELECT * FROM sqlmesh__default.labor_ticket_batch_processing__85582959"

sqlmesh --paths . --gateway local fetchdf "SELECT schema_name FROM information_schema.schemata"
sqlmesh --paths . --gateway local fetchdf "SELECT table_schema, table_name FROM information_schema.tables WHERE table_schema LIKE 'sqlmesh%' OR table_name = 'labor_ticket_batch_processing'"
sqlmesh --paths . --gateway local fetchdf "SELECT * FROM default__dev.labor_ticket_batch_processing LIMIT 50;"