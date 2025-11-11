# Purchase Order Notes (20210318)

```sql
/*
What are the legitimate values that are used in in the DOCUMENT_REF_TABLE for workorder_types?
Resolution:
The valid workorder_type values for use in the DOCUMENT_REF_WO table (ie the Sub 0 header card) are: 
W - Work Order
M - Engineering Master
Q - Quote

those records that are related to Leg Headers, (cards with a Sub ID != 0):  
J - Work Order
K - Engineering Master
L - Quote

Reference type refers where the document might be best used, or where it should be made available.  
There are quite a few areas in Visual where a Document Reference can be attached:
	AP Invoice, AR Invoice, Customer, Customer Order, Engineering Change Notice, Estimating, General Journal, 
	Operation, Part, Purchase Order, RFQ, Requisition, Shipper, Shop Resource, Trace, Vendor, WorkFlow, and Work Order.

These are all available from the dropdown box for a Reference type, including General.  If General is selected as 
the Reference Type for a document, then the document will be available in all areas that Document Reference exists.  
If Customer is selected as a reference type, then the document 	will only be available to be selected in Customer Maintenance.

**Reference Types are hard coded into the software and the list of available Reference Types cannot be added to or maintained.
*/

USE CRUNCH0221
GO

SELECT TOP 25 * 
FROM OPERATION
WHERE CLOSE_DATE IS NOT NULL 
AND RESOURCE_ID = 'CONTRACTOR' 
AND WORKORDER_SUB_ID != '0'
AND WORKORDER_SPLIT_ID = '0'
ORDER BY CLOSE_DATE DESC

USE LIVE
GO

SELECT * FROM DEMAND_SUPPLY_LINK DSL
WHERE DSL.DEMAND_BASE_ID = '1641442'
AND DSL.DEMAND_TYPE = 'OP'

SELECT * FROM DEMAND_SUPPLY_LINK DSL
WHERE DSL.SUPPLY_BASE_ID = '144717'
AND DSL.SUPPLY_TYPE = 'PO'

SELECT *
FROM PURC_ORDER_LINE POL
INNER JOIN PURCHASE_ORDER PO
ON PO.ID = POL.PURC_ORDER_ID
WHERE PO.ID = '144717'

SELECT * FROM DOCUMENT_REF_WO WHERE WORKORDER_BASE_ID = '1641442' ORDER BY WORKORDER_SUB_ID, SEQUENCE_NO
--1; 30; BAC 1505
--1; 70; BAC5300-2
--2; 90; BAC5300-1


SELECT DISTINCT DRW.WORKORDER_BASE_ID
, DRW.WORKORDER_SUB_ID
, DRW.WORKORDER_TYPE
, DRW.SEQUENCE_NO
, DRW.WORKORDER_BASE_ID PART_ID
, (SELECT D.ID + CASE
	WHEN D.REVISION_ID IS NULL THEN ' / REV: '
	ELSE ' / REV: ' + D.REVISION_ID
END + CASE
	WHEN U1.STRING_VAL IS NULL THEN ' / ADCN: '
	ELSE ' / ADCN: ' + U1.STRING_VAL
END + CHAR(10)
) AS DOCUMENT
FROM DOCUMENT_REF_WO DRW
INNER JOIN DOCUMENT D
ON DRW.DOCUMENT_ID = D.ID
LEFT JOIN USER_DEF_FIELDS U1
ON D.ID = U1.DOCUMENT_ID
AND U1.PROGRAM_ID = 'VMDOCMNT'
AND U1.ID = 'UDF-0000032'
LEFT JOIN USER_DEF_FIELDS U2
ON D.ID = U2.DOCUMENT_ID
AND U2.PROGRAM_ID = 'VMDOCMNT'
AND U2.ID = 'UDF-0000031'
WHERE DRW.WORKORDER_BASE_ID = PL.PART_ID
--WHERE DRW.WORKORDER_BASE_ID = '1648499'

SELECT * FROM DOCUMENT_REFERENCE DR


SELECT DISTINCT DRW.WORKORDER_BASE_ID
				, DRW.WORKORDER_LOT_ID
				, DRW.WORKORDER_SPLIT_ID
				, DRW.WORKORDER_SUB_ID
				, DRW.SEQUENCE_NO
				, DRW.WORKORDER_TYPE
				, DRW.WORKORDER_BASE_ID PART_ID
				, (SELECT D.ID + CASE
						WHEN D.REVISION_ID IS NULL THEN ' / REV: '
						ELSE ' / REV: ' + D.REVISION_ID
					--END + CASE
					--	WHEN U1.STRING_VAL IS NULL THEN ' / ADCN: '
					--	ELSE ' / ADCN: ' + U1.STRING_VAL
				END + CHAR(10)
				) AS DOCUMENT
SELECT *
			FROM DOCUMENT_REF_WO DRW
			INNER JOIN DOCUMENT D
				ON DRW.DOCUMENT_ID = D.ID
WHERE WORKORDER_TYPE IN ('W', 'J')


```