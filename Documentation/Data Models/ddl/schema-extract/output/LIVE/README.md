# Schema Files Moved

⚠️ **This location is deprecated.**

Schema DDL files have been moved to a more prominent location for better discoverability.

## New Location

**All DDL files are now at:** `Documentation/Schema/Tables/`

- **Main index:** [Documentation/Schema/README.md](../../../../../Schema/README.md)
- **Table index:** [Documentation/Schema/TABLE_INDEX.md](../../../../../Schema/TABLE_INDEX.md)
- **Payables reference:** [Documentation/Schema/PAYABLES_TABLES.md](../../../../../Schema/PAYABLES_TABLES.md)
- **Receivables reference:** [Documentation/Schema/RECEIVABLES_TABLES.md](../../../../../Schema/RECEIVABLES_TABLES.md)

## Why the Move?

The schema DDL files are foundational reference material that deserve prominent placement. The new location:
- Is easier to discover (top-level sibling to Data Models)
- Has better organization with domain-specific documentation
- Includes comprehensive ER diagrams and join patterns
- Provides cross-links to related data model queries

## Quick Links

[Go to new schema location →](../../../../../Schema/)

## Migration Path

If you have bookmarks or scripts referencing files in this location:

**Old path pattern:**
```
Documentation/Data Models/ddl/schema-extract/output/LIVE/dbo.PAYABLE.sql
```

**New path pattern:**
```
Documentation/Schema/Tables/dbo.PAYABLE.sql
```

Update your references to use the new path structure.