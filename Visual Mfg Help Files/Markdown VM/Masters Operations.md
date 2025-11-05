Search for SQL queries that reference both SHOP_RESOURCE and operation type. 

Searched text for `SHOP_RESOURCE.*OPERATION_TYPE|OPERATION_TYPE.*SHOP_RESOURCE`, no results

Searched text for `SHOP_RESOURCE` (`**/*.sql`), 20 results

Read [](file:///c%3A/Users/williamt/source/skillsinc/skills-inc-org/IT_TeamProject/SQL_Reports/Work%20Order%20Reports/Masters_Resource_ID_and_Op_Type_check.sql)

Read [](file:///c%3A/Users/williamt/source/skillsinc/skills-inc-org/IT_TeamProject/SQL_Reports/Work%20Order%20Reports/Operation%20Type%20List.sql)

Read [](file:///c%3A/Users/williamt/source/skillsinc/skills-inc-org/IT_TeamProject/SQL_Reports/Work%20Order%20Reports/OpType%20and%20ResourceID%20Masters%20Listing.sql)

Found several SQL queries that work with SHOP_RESOURCE and OPERATION_TYPE! Here's a summary:

## **Key SQL Files Found:**

### **1. Masters_Resource_ID_and_Op_Type_check.sql**
- Joins OPERATION → SHOP_RESOURCE to get resource metadata
- Uses `SR.USER_1` (skills_type), `SR.USER_5` (plant)
- Compares current operation with next operation in sequence
- Shows operation specs from OPERATION_BINARY table
- Filters by specific operation types: `'rec-p1','aubrec', 'PANEL'`

### **2. Operation Type List.sql**
- Queries OPERATION_TYPE → SHOP_RESOURCE relationship
- Provides rich filtering by:
  - **Business Unit** (USER_1): FIN, MFG, OUTREACH, BALLARD
  - **Facility** (USER_5)
  - **Department** (USER_6)
  - **Process** (USER_7)
  - **Groups** (USER_8)
  - **Resource Status**: ACTIVE, OBSOLETE
- Shows operation type specs from OPER_TYPE_BINARY
- Parameterized search by: @TYPE, @FACILITY, @DEPARTMENT, @PROCESS, @GROUPS, @STATUS, @RESOURCEIDS, @OPTYPE, @DESCRIPTION, @SPECS

### **3. OpType and ResourceID Masters Listing.sql**
- Searches masters (TYPE='M') by operation type and/or resource ID
- Three search modes via @SEARCH parameter:
  - `'Both'`: Match both OpType AND ResourceID
  - `'OpType'`: Match only operation type
  - `'ResourceID'`: Match only resource ID
- Joins to PART table for part status
- Uses Datamart view for operation specs

## **SHOP_RESOURCE User-Defined Fields:**
Based on these queries, the SHOP_RESOURCE table uses these custom fields:
- **USER_1**: Business Unit (A=FIN, M=MFG, O=OUTREACH, B=BALLARD, C=CLOSED)
- **USER_4**: Supervisor
- **USER_5**: Facility (e.g., AP1, AP2, AP3)
- **USER_6**: Department
- **USER_7**: Process
- **USER_8**: Department/Groups

Your paint.sql file uses `SHOP_RESOURCE_SITE` (line 144) and has a standalone query `select * from SHOP_RESOURCE` (line 187) that appears to be for reference/debugging.

Would you like me to help you modify your paint.sql query to leverage these SHOP_RESOURCE fields more effectively?