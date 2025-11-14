# DOCUMENT_REF_WO Table Analysis & Documentation

## Table Overview
**DOCUMENT_REF_WO** is a critical junction table in Visual Manufacturing that links documents to work orders. It enables document attachments at various levels of work order operations and sequences.

## Table Schema (Based on SQL Analysis)

### Primary Columns
```sql
DOCUMENT_ID          -- Links to DOCUMENT.ID (the document being referenced)
WORKORDER_BASE_ID    -- Work Order Base ID (links to work order)
WORKORDER_LOT_ID     -- Work Order Lot ID 
WORKORDER_SPLIT_ID   -- Work Order Split ID
WORKORDER_SUB_ID     -- Work Order Sub ID (0 = master, >0 = leg/detail)
WORKORDER_TYPE       -- Type of work order (W, M, Q, J, K, L)
SEQUENCE_NO          -- Operation sequence number
PIECE_NO             -- Piece number for the operation
```

### Workorder Types (From SQL Documentation)
**For Sub ID = 0 (Header/Master records):**
- **W** = Work Order
- **M** = Engineering Master  
- **Q** = Quote

**For Sub ID ≠ 0 (Leg/Detail records):**
- **J** = Work Order
- **K** = Engineering Master
- **L** = Quote

## Key Relationships

### 1. Document Relationship
```sql
DOCUMENT_REF_WO.DOCUMENT_ID = DOCUMENT.ID
```
Links to the main document record containing file path, description, revision info.

### 2. Work Order Relationship
```sql
-- Links to Work Order Master (SUB_ID = 0)
DOCUMENT_REF_WO.WORKORDER_BASE_ID = WORK_ORDER.PART_ID
WHERE WORK_ORDER.SUB_ID = 0

-- Links to Work Order Operations
DOCUMENT_REF_WO.WORKORDER_BASE_ID = OPERATION.WORKORDER_BASE_ID
AND DOCUMENT_REF_WO.WORKORDER_LOT_ID = OPERATION.WORKORDER_LOT_ID
AND DOCUMENT_REF_WO.WORKORDER_SPLIT_ID = OPERATION.WORKORDER_SPLIT_ID
AND DOCUMENT_REF_WO.WORKORDER_SUB_ID = OPERATION.WORKORDER_SUB_ID
AND DOCUMENT_REF_WO.SEQUENCE_NO = OPERATION.SEQUENCE_NO
```

### 3. User-Defined Fields Integration
Documents can have additional custom fields stored in USER_DEF_FIELDS:
```sql
-- Location field
USER_DEF_FIELDS.ID = 'UDF-0000031' AND PROGRAM_ID = 'VMDOCMNT'

-- ADCN field  
USER_DEF_FIELDS.ID = 'UDF-0000032' AND PROGRAM_ID = 'VMDOCMNT'
```

## Usage Patterns from Doc_Ref Application

### Query Pattern from Form1.vb
```sql
SELECT W.BASE_ID AS 'WO', 
       ME.SUB_ID, 
       ME.SEQUENCE_NO AS 'SEQ_NO',
       ME.RESOURCE_ID, 
       DR.DOCUMENT_ID AS 'DOCUMENT ID', 
       D.DOC_FILE_PATH
FROM DOCUMENT_REF_WO DR WITH (NOLOCK) 
INNER JOIN DOCUMENT D WITH (NOLOCK) ON DR.DOCUMENT_ID = D.ID
INNER JOIN (
    SELECT WORKORDER_BASE_ID AS BASE_ID, WORKORDER_LOT_ID AS LOT_ID, 
           WORKORDER_SPLIT_ID AS SPLIT_ID, WORKORDER_SUB_ID AS SUB_ID, 
           SEQUENCE_NO, RESOURCE_ID 
    FROM OPERATION WHERE WORKORDER_TYPE = 'M'
) ME ON DR.WORKORDER_BASE_ID = ME.BASE_ID 
    AND DR.WORKORDER_LOT_ID = ME.LOT_ID 
    AND DR.WORKORDER_SPLIT_ID = ME.SPLIT_ID 
    AND DR.WORKORDER_SUB_ID = ME.SUB_ID 
    AND DR.SEQUENCE_NO = ME.SEQUENCE_NO
INNER JOIN (
    SELECT BASE_ID, LOT_ID, SPLIT_ID, PART_ID
    FROM WORK_ORDER WHERE SUB_ID = 0 AND TYPE = 'W' 
) W ON ME.BASE_ID = W.PART_ID 
WHERE W.BASE_ID = '[SELECTED_WO]'
ORDER BY ME.SUB_ID, ME.SEQUENCE_NO, ME.RESOURCE_ID ASC
```

## Document Attachment Levels

### 1. Work Order Header Level
- **SUB_ID = 0**: Documents attached to the main work order
- **Document Types**: General, Part, Work Order
- **Access**: Manufacturing Window - Header Card

### 2. Operation Level  
- **SUB_ID ≠ 0**: Documents attached to specific operations
- **Document Types**: General, Operation, Service, Shop Resource, Work Order
- **Access**: Manufacturing Window - Operation Card

### 3. Material Requirement Level
- **Document Types**: General, Part, Work Order  
- **Access**: Manufacturing Window - Material Requirement Card

## Visual Manufacturing Integration

### Accessing Document References

#### From Manufacturing Window:
1. **Header Card**: Click "Doc Ref" button
2. **Other Cards**: Select Edit → Document Reference

#### From Maintenance Windows:
- Select Maintain → Document Reference

#### From Inquiry Windows:  
- Select Info → Document Reference (or Document Line Reference)

### Reference Types Available
Based on the comprehensive table in `Referencing_Documents.htm`:

**Manufacturing Window - Header Card:**
- General
- Part  
- Work Order

**Manufacturing Window - Operation Card:**
- General
- Operation
- Service
- Shop Resource
- Work Order

## Common SQL Patterns

### 1. Get Documents for Work Order
```sql
SELECT D.ID, D.DESCRIPTION, D.DOC_FILE_PATH, DRW.SEQUENCE_NO
FROM DOCUMENT_REF_WO DRW
INNER JOIN DOCUMENT D ON DRW.DOCUMENT_ID = D.ID  
WHERE DRW.WORKORDER_BASE_ID = 'WO_NUMBER'
ORDER BY DRW.SEQUENCE_NO
```

### 2. Get Documents with Custom Fields
```sql
SELECT D.ID, D.DESCRIPTION, D.DOC_FILE_PATH,
       U1.STRING_VAL AS ADCN,
       U2.STRING_VAL AS LOCATION
FROM DOCUMENT_REF_WO DRW
INNER JOIN DOCUMENT D ON DRW.DOCUMENT_ID = D.ID
LEFT JOIN USER_DEF_FIELDS U1 ON DRW.DOCUMENT_ID = U1.DOCUMENT_ID 
    AND U1.PROGRAM_ID = 'VMDOCMNT' AND U1.ID = 'UDF-0000032'
LEFT JOIN USER_DEF_FIELDS U2 ON DRW.DOCUMENT_ID = U2.DOCUMENT_ID 
    AND U2.PROGRAM_ID = 'VMDOCMNT' AND U2.ID = 'UDF-0000031'  
WHERE DRW.WORKORDER_BASE_ID = 'WO_NUMBER'
```

### 3. Document Count by Work Order
```sql
SELECT WORKORDER_BASE_ID, COUNT(*) AS DOC_COUNT
FROM DOCUMENT_REF_WO
GROUP BY WORKORDER_BASE_ID
ORDER BY DOC_COUNT DESC
```

## Data Cleanup Considerations

### Orphan Records
From `Doc_Ref_orphan_update.sql`:
```sql
-- Check for orphaned records
SELECT * FROM DOCUMENT WHERE ID = 'DOCUMENT_ID'
SELECT * FROM DOCUMENT_REF_WO WHERE DOCUMENT_ID = 'DOCUMENT_ID'  
SELECT * FROM USER_DEF_FIELDS WHERE DOCUMENT_ID = 'DOCUMENT_ID'
SELECT * FROM REVISION_HISTORY WHERE HISTORY_ID = 'DOCUMENT_ID'

-- Clean up orphans (use with caution)
DELETE FROM REVISION_HISTORY 
WHERE HISTORY_ID = 'DOCUMENT_ID' 
AND REVISION_ID = 'REVISION' 
AND ROWID = [SPECIFIC_ROWID]
```

## Performance Notes

### Recommended Indexes
- WORKORDER_BASE_ID (primary lookup)
- DOCUMENT_ID (document joins)  
- Composite: (WORKORDER_BASE_ID, WORKORDER_SUB_ID, SEQUENCE_NO)

### Query Optimization
- Use WITH (NOLOCK) for reporting queries
- Filter by WORKORDER_TYPE early in WHERE clause
- Consider partitioning by WORKORDER_BASE_ID for large datasets

## Security & Access Control

### Table Permissions
- Read access required for document viewing
- Write access needed for document attachment/detachment
- Admin access for orphan cleanup operations

### Application Security
- Connection uses Windows Integrated Security
- Document file access depends on network path permissions
- User access controlled through Visual Manufacturing licensing