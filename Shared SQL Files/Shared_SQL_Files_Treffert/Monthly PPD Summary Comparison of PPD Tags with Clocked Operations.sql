use Live
go     

declare @startdate date = '11/30/2017',
              @enddate date = '12/31/2017'

SELECT 
       O.WORKORDER_BASE_ID,
       O.WORKORDER_LOT_ID,
       O.WORKORDER_SPLIT_ID,
       O.WORKORDER_SUB_ID,
       'W' AS [TYPE],
       LT.TRANSACTION_DATE,
       O.RESOURCE_ID, 
       LT.OPERATION_SEQ_NO,
       sr.SKILLS_TYPE,
	   ra.PPD_Process
FROM  OPERATION O
INNER JOIN
       (SELECT 
              WORKORDER_BASE_ID,
              WORKORDER_LOT_ID,
              WORKORDER_SPLIT_ID,
              WORKORDER_SUB_ID,
              OPERATION_SEQ_NO,
              MAX(TRANSACTION_DATE) AS TRANSACTION_DATE
       FROM
              LABOR_TICKET LT
       WHERE  
              LT.TRANSACTION_DATE >= @startdate
              AND LT.TRANSACTION_DATE < @enddate
       GROUP BY 
              WORKORDER_BASE_ID,
              WORKORDER_LOT_ID,
              WORKORDER_SPLIT_ID,
              WORKORDER_SUB_ID,
              OPERATION_SEQ_NO
       ) LT
       ON  O.WORKORDER_BASE_ID = LT.WORKORDER_BASE_ID
       AND O.WORKORDER_LOT_ID = LT.WORKORDER_LOT_ID
       AND O.WORKORDER_SPLIT_ID = LT.WORKORDER_SPLIT_ID
       AND O.WORKORDER_SUB_ID = LT.WORKORDER_SUB_ID
       AND O.SEQUENCE_NO = LT.OPERATION_SEQ_NO
LEFT OUTER JOIN 
       SHOP_RESOURCE SR
       ON O.RESOURCE_ID = SR.ID
Join LIVESupplemental.dbo.ResourceID_Assignments RA
		on o.RESOURCE_ID = ra.Resource_ID
WHERE  
       LT.TRANSACTION_DATE >= @startdate
       AND LT.TRANSACTION_DATE < @enddate
       and o.WORKORDER_TYPE = 'W'
order by  
       WORKORDER_BASE_ID,
       WORKORDER_LOT_ID,
       WORKORDER_SPLIT_ID,
       WORKORDER_SUB_ID,
       TRANSACTION_DATE
