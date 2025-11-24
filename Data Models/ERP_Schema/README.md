# ERP Schema Documentation

## Purpose
Comprehensive schema metadata for the Visual Manufacturing ERP system. This serves as:
- **Source of truth** for database structure
- **Semantic layer foundation** for Copilot Spaces
- **Input format** for ERD/visualization tools (LucidChart, dbdiagram.io, etc.)
- **Reference documentation** for developers and analysts

## Files

### `extract_schema.sql`
INFORMATION_SCHEMA query that extracts complete schema metadata including:
- Tables, columns, data types
- Primary keys, foreign keys, constraints
- Column descriptions (from extended properties)
- Relationship mappings

**Usage:**
```sql
-- Run against your ERP database
-- Export results as CSV or use Export-SchemaDocumentation.ps1
```

### `Export-SchemaDocumentation.ps1`
PowerShell utility that:
1. Executes `extract_schema.sql` against ERP database
2. Exports to multiple formats (CSV, Markdown, JSON)
3. Generates human-readable documentation

### Output Files

- **`schema_export.csv`** - LucidChart/ERD tool import format
- **`schema_export.md`** - Human-readable Markdown tables
- **`schema_export.json`** - Structured data for Copilot/MCP consumption

## For Copilot Spaces

### Recommended Approach
Point your Copilot Space at **`schema_export.md`** or **`schema_export.json`**:
- ✅ Structured, queryable schema information
- ✅ Includes relationships and constraints
- ✅ Lightweight (no actual data, just metadata)
- ✅ Updated via automated extraction

### Usage in Space Instructions
```markdown
This Space provides semantic layer access to ERP schema.
Reference schema_export.md for table/column definitions.
Use business-friendly terminology when generating queries.
Always include relevant JOINs based on FK relationships.
```

## Maintenance

**Frequency:** Update schema exports when:
- New tables/columns added to ERP
- Relationships change
- Extended properties (descriptions) updated

**Process:**
1. Run `Export-SchemaDocumentation.ps1`
2. Review generated files
3. Commit to repository
4. Copilot Space automatically picks up changes

## Integration with Visualization Tools

### LucidChart
1. File → Import Data → Entity Relationship (ERD)
2. Upload `schema_export.csv`
3. Auto-generates diagram with relationships

### dbdiagram.io
Convert CSV to DBML format or manually create from schema_export.md

### SQL Server Management Studio (SSMS)
Database Diagrams feature can import/export schema, but INFORMATION_SCHEMA query provides more control

## Notes

- Excludes system tables/schemas by default
- Captures `MS_Description` extended properties as documentation
- Compatible with SQL Server 2012+
- Query can be adapted for other RDBMS (adjust INFORMATION_SCHEMA dialect)
