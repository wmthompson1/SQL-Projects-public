

/**********************************************************************************************
Description:    
Sample:            

Date        Modified By         Change Description
----------  ------------------  ------------------------------------------------------------
4/21/2020    Ed    - based on
4/21/2020    William                updated - outer join for part, outside services


**********************************************************************************************/

------    declare @ReceiverIDVar nvarchar(255) = '100000'
------    Declare @p1 nvarchar(255) = '74922'  --'137075' 
------        , @p2 nvarchar(255) = '1'
                     
SELECT 
   O.ID AS [OrderID_PO],
   O.VENDOR_ID,
   O.ORDER_DATE,
   R.ID AS ReceiverID,
   R.RECEIVED_DATE,
   O.BUYER,
   L.LINE_NO,
   L.SITE_ID,
   L.PART_ID,
   L.VENDOR_PART_ID,
   L.ORDER_QTY,
   L.USER_ORDER_QTY,
   RL.RECEIVED_QTY,
   RL.USER_RECEIVED_QTY,
   RL.TRANSACTION_ID,
   RL.INSPECT_QTY,
   L.PURCHASE_UM,
   V.NAME AS Vendor_Name,
   R.RECEIVED_DATE AS RCV_RECEIVED_DATE,
   RL.WAREHOUSE_ID,
   RL.LOCATION_ID,
   L.GL_EXPENSE_ACCT_ID,
   L.USER_1 AS Item_Description,
   RL.LINE_NO AS RL_LINE_NO,
   R.PURC_ORDER_ID,
   RL.RECEIVER_ID AS RL_RECEIVER_ID,
   RL.PURC_ORDER_LINE_NO,
   OPP.WORKORDER_BASE_ID,
   OPP.WORKORDER_LOT_ID,
   OPP.SEQUENCE_NO,
   OPP.SERVICE_ID,
   IIF(PART.ID IS NOT NULL,PART.DESCRIPTION,L.VENDOR_PART_ID) AS [DESCRIPTION]
FROM RECEIVER_LINE AS RL 
INNER JOIN
RECEIVER AS R 
ON RL.RECEIVER_ID = R.ID 
INNER JOIN PURC_ORDER_LINE AS L 
ON R.PURC_ORDER_ID = L.PURC_ORDER_ID 
AND RL.PURC_ORDER_LINE_NO = L.LINE_NO 
INNER JOIN PURCHASE_ORDER AS O 
ON L.PURC_ORDER_ID = O.ID 
INNER JOIN
VENDOR AS V 
ON O.VENDOR_ID = V.ID 
--Don't equi-join part - use data in query
--INNER JOIN PART 
LEFT JOIN PART
ON PART.ID = L.PART_ID

-- join is not restricted to service, so use outer
OUTER APPLY(
    SELECT 
         Opp2.WORKORDER_TYPE
       , Opp2.WORKORDER_BASE_ID, Opp2.WORKORDER_LOT_ID, Opp2.WORKORDER_SPLIT_ID, Opp2.WORKORDER_SUB_ID
       , Opp2.SEQUENCE_NO, Opp2.SERVICE_ID
       , L2.ID 
    FROM DEMAND_SUPPLY_LINK L2
    JOIN OPERATION Opp2
    ON
     L2.SUPPLY_TYPE = N'PO' 
    AND L2.SUPPLY_BASE_ID =  O.ID --  @P1
    AND L2.SUPPLY_SEQ_NO =  L.LINE_NO -- @P2
    AND Opp2.WORKORDER_TYPE = N'W' 
    AND L2.DEMAND_TYPE = N'OP' 
    AND L2.DEMAND_BASE_ID = Opp2.WORKORDER_BASE_ID 
    AND L2.DEMAND_LOT_ID = Opp2.WORKORDER_LOT_ID 
    AND L2.DEMAND_SPLIT_ID = Opp2.WORKORDER_SPLIT_ID 
    AND L2.DEMAND_SUB_ID = Opp2.WORKORDER_SUB_ID 
    AND L2.DEMAND_SEQ_NO = Opp2.SEQUENCE_NO 
    AND Opp2.SERVICE_ID IS NOT NULL
) OPP
WHERE        (L.SITE_ID = 'SK01') 
AND (R.ID = @ReceiverIDVar)

