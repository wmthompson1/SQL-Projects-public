---
applyTo: "**/Data Models/Inventory_Transactions/*"
---

# Inventory Transaction Query Guidelines

## Critical Rules

Any request for SQL or metadata related to inventory, inventory levels, materials requirements, inventory on hand, or inventory trace will apply to **multiple related tables**, not a single table.

## Key Principles

1. **Multi-Table Queries**: Inventory data spans multiple related tables in the Visual Manufacturing ERP system
2. **Document Hierarchy**: Always refer to [Document_Hierarchy_Map.md](../../Documentation/Data Models/Inventory_Transactions/Document_Hierarchy_Map.md) for transaction flow relationships
3. **Table Relationships**: Understand dependencies between:
   - Inventory master tables
   - Transaction history tables  
   - Document reference tables
   - Location and lot tracking tables

## When Working with Inventory Data

- **DO**: Query across related tables using proper joins
- **DO**: Use fully-qualified table names: `Live.dbo.TABLE_NAME`
- **DO**: Consider transaction types and document hierarchies
- **DO NOT**: Assume inventory data exists in a single table
- **DO NOT**: Query inventory tables in isolation without considering related data

## Examples

```sql
-- Inventory with transactions (multi-table)
SELECT i.PART_ID, i.DESCRIPTION, it.TRANSACTION_TYPE, it.QUANTITY
FROM Live.dbo.INVENTORY i
JOIN Live.dbo.INVENTORY_TRANS it ON i.PART_ID = it.PART_ID
WHERE it.TRANS_DATE >= '2024-01-01'

-- Inventory on hand by location (multi-table)
SELECT i.PART_ID, l.LOCATION_ID, iol.QUANTITY_ON_HAND
FROM Live.dbo.INVENTORY i
JOIN Live.dbo.INV_ON_HAND_LOCATION iol ON i.PART_ID = iol.PART_ID
JOIN Live.dbo.LOCATION l ON iol.LOCATION_ID = l.LOCATION_ID
```