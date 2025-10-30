USE CRUNCH0221
GO

/*
What are the legitimate values that are used in in the DOCUMENT_REF_TABLE for workorder_types?
Resolution:
The valid workorder_type values for use in the DOCUMENT_REF_WO table are M (for Engineering Master), 
W (for Work Order) and 
Q (for Quote) if the record is for the header card of the Engineering Master, Work Order or Quote - i.e. the Sub 0 header card.  

However, a different value is needed to identify those records that are related to Leg Headers, or those cards with a Sub ID greater than 0.  
If the order type is an Engineering Master - K will be used as the work order type for the leg header card.
If the order type is a Work Order - J will be used as the work order type for the leg header card.
If the order type is a Quote - L will be used as the work order type for the leg header card.

In summary, the valid values to populate workorder_type in DOCUMENT_REF_WO are M or K, W or J, Q or L.

Reference type refers where the document might be best used, or where it should be made available.  
There are quite a few areas in Visual where a Document Reference can be attached:
AP Invoice, AR Invoice, Customer, Customer Order, Engineering Change Notice, Estimating, General Journal, Operation, Part, Purchase Order, 
	RFQ, Requisition, Shipper, Shop Resource, Trace, Vendor, WorkFlow, and Work Order.

These are all available from the dropdown box for a Reference type, including General.  If General is selected as the Reference Type for a document, 
	then the document will be available in all areas that Document Reference exists.  If Customer is selected as a reference type, then the document 
	will only be available to be selected in Customer Maintenance.

**Reference Types are hard coded into the software and the list of available Reference Types cannot be added to or maintained.
*/

DROP TABLE #CTE_WOLINK
DROP TABLE #CTE_WORKORDERS

DECLARE @BASE_ID NVARCHAR(30) = '1648499'-- '1584829'--'1584826' --1562491
DECLARE @LOT_ID NVARCHAR(3) = '1'
DECLARE @SPLIT_ID NVARCHAR(3)= '0'
--DECLARE @SUB_ID NVARCHAR(3) = '0'

DECLARE @PART_ID NVARCHAR(30) -- = '411T3484-66B'
SELECT @PART_ID = PART_ID 
FROM WORK_ORDER WO
WHERE WO.BASE_ID = @BASE_ID
    AND WO.LOT_ID = @LOT_ID
    AND WO.SUB_ID = '0'
    AND WO.SPLIT_ID = @SPLIT_ID
    AND WO.[TYPE] = 'W'

SELECT WO.* 
	, CONVERT(NVARCHAR(MAX), CONVERT(VARBINARY(MAX), WB.BITS)) AS WO_SPECS
	, P.[DESCRIPTION]
	, SA.SURFACE_AREA
	, SA.Alloy
	, SA.Material_Type
	, SA.material_type + ' ' + SA.alloy + ' ' + CONVERT(VARCHAR(15), CONVERT(DECIMAL(5,2), SA.Thickness_val)) + ' x '
		+ CONVERT(VARCHAR(15), CONVERT(DECIMAL(5,2), SA.width_val)) + ' x ' + CONVERT(VARCHAR(15), CONVERT(DECIMAL(5,2), SA.length_val)) AS sa_description2
--, w.TYPE + N'~'+w.BASE_ID + N'~' + w.LOT_ID + N'~' + w.SPLIT_ID + '~' + w.SUB_ID AS DOCUMENT_ID
INTO #CTE_WORKORDERS
FROM WORK_ORDER WO
LEFT OUTER JOIN WORKORDER_BINARY AS WB
	ON WB.WORKORDER_TYPE = WO.[TYPE]
	AND WB.WORKORDER_BASE_ID = WO.BASE_ID
	AND WB.WORKORDER_LOT_ID = WO.LOT_ID
	AND WB.WORKORDER_SPLIT_ID = WO.SPLIT_ID
	AND WB.WORKORDER_SUB_ID = WO.SUB_ID
INNER JOIN PART P
	ON P.ID = WO.PART_ID
LEFT OUTER JOIN DBO.SKILLS_WO_INC_LEG_SURFACE_AREA AS SA
	ON WO.BASE_ID = SA.BASE_ID
	AND WO.LOT_ID = SA.LOT_ID
	AND WO.SPLIT_ID = SA.SPLIT_ID
	AND WO.PART_ID = SA.PART_ID
	--AND W.SUB_ID = SA.SUB_ID
WHERE WO.BASE_ID = @BASE_ID
	AND WO.LOT_ID = @LOT_ID
	AND WO.SPLIT_ID = @SPLIT_ID
	--AND WO.SUB_ID IN (@SUB_ID)
	AND WO.[TYPE] = 'W'

--> Get documents from Master
; WITH CTE_DOCS AS
(SELECT DRW.* 
	, D.REVISION_ID
	, D.ECN_REVISION
	, U1.STRING_VAL AS ADCN
	, U2.STRING_VAL AS LOC
	, D.ID AS PART_ID
FROM DOCUMENT_REF_WO DRW
JOIN DOCUMENT D
	ON DRW.DOCUMENT_ID = D.ID
LEFT OUTER JOIN USER_DEF_FIELDS U1
	ON DRW.DOCUMENT_ID = U1.DOCUMENT_ID
	AND U1.PROGRAM_ID = N'VMDOCMNT'
	AND U1.ID = N'UDF-0000032'
	AND U1.[LABEL] IS NULL
LEFT OUTER JOIN USER_DEF_FIELDS U2
	ON DRW.DOCUMENT_ID = U2.DOCUMENT_ID
	AND U2.PROGRAM_ID = N'VMDOCMNT'
	AND U2.ID = N'UDF-0000031'
	AND U2.[LABEL] IS NULL
WHERE EXISTS (SELECT 1 FROM #CTE_WORKORDERS W
	WHERE W.PART_ID = DRW.WORKORDER_BASE_ID -- LINKS TO MASTER
	AND W.SUB_ID = N'0'  -- LINKS TO MASTER
	) 
)
--> SELECT * FROM cte_docs

SELECT DISTINCT DD.WORKORDER_BASE_ID
	, N'0' AS WORKORDER_SUB_ID
	, (SELECT ISNULL(D.DOCUMENT_ID, N'') + N' / REV: ' + ISNULL(D.REVISION_ID, N'') + N' / ADCN: ' + ISNULL(D.ADCN, N'') + N' / LOC: ' 
		+ ISNULL(D.LOC, N'') + CHAR(10)
		FROM CTE_DOCS D
		FOR XML PATH('')
	) AS VALS
INTO #CTE_WOLINK
FROM CTE_DOCS DD

UNION ALL 

SELECT DISTINCT DD.WORKORDER_BASE_ID
	, DD.WORKORDER_SUB_ID
	, (SELECT ISNULL(D.DOCUMENT_ID, N'') + N' / REV: ' + ISNULL(D.REVISION_ID, N'') + N' / ADCN: ' + ISNULL(D.ADCN, N'') + N' / LOC: ' 
		+ ISNULL(D.LOC, N'') + CHAR(10)
		FROM CTE_DOCS D
		WHERE (D.WORKORDER_BASE_ID= DD.WORKORDER_BASE_ID 
			AND D.WORKORDER_SUB_ID = DD.WORKORDER_SUB_ID)                                              
			FOR XML PATH('')
	) AS VALS
FROM CTE_DOCS DD
WHERE DD.WORKORDER_SUB_ID <> N'0'
GROUP BY DD.WORKORDER_BASE_ID
	, DD.WORKORDER_SUB_ID

SELECT * FROM #CTE_WOLINK




SELECT * FROM DOCUMENT_REF_WO DRW WHERE WORKORDER_BASE_ID = '1648499'