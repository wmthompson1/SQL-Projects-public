# CNC Dashboard

```sql
/* CTE_1 Temporal table to upload requested data from query # 1 */
WITH CTE_1 AS ( 
    Select CONCAT(WO.PART_ID ,'_',LT.OPERATION_SEQ_NO) as 'Unique_Code'
        , Concat(LT.Workorder_Base_ID,'/',LT.WORKORDER_LOT_ID,'/', LT.WORKORDER_SPLIT_ID,'/', LT.WORKORDER_SUB_ID) as 'Work_Order'
        , Concat(LT.Workorder_Base_ID,'/',LT.WORKORDER_LOT_ID) as 'WO/LotID'
        , WO.PART_ID as 'Part_ID', Min(LT.RESOURCE_ID) as 'Current_Opp', WO.DESIRED_QTY as 'WO_Qty'

         , Case
            When LT2.Good_QTY >= 1 Then LT2.Hrs_Wked/LT2.Good_QTY
            When LT2.Good_QTY < 1 and LT2.Hrs_Wked is not null then LT2.Hrs_Wked
            WHen LT2.Good_QTY < 1 and LT2.Hrs_Wked is null then datepart(hh,(Getdate() - LT.ACT_CLOCK_IN))
         End as 'Total_Run_Hrs'
        , LT2.Good_QTY as 'Completed_Parts'
                                , E.First_Name+ ' '+ E.Last_Name as 'Employee'
        , convert(VARCHAR,LT.ACT_CLOCK_IN, 108) as 'Current_Run_Start'
        , Case
            When  LT2.Good_QTY < 1 and LT2.Hrs_Wked is not null then Sum(LT.Hours_Worked)
            WHen  LT2.Good_QTY < 1 and LT2.Hrs_Wked is null then datepart(hh,(Getdate() - LT.ACT_CLOCK_IN))
            When  LT2.Good_QTY >= 1 Then LT2.Good_QTY / LT2.Hrs_Wked
         End as 'Hrs_Part'
         , LT2.Hrs_Wked, LT2.Good_QTY
        , MIN(LT.OPERATION_SEQ_NO) AS 'SEQ_NO'
    From LABOR_TICKET LT WITH (NOLOCK)
        Left outer JOin WORK_ORDER WO 
            on WO.BASE_ID = LT.WORKORDER_BASE_ID
            and WO.LOT_ID = LT.WORKORDER_LOT_ID
            and WO.SPLIT_ID = LT.WORKORDER_SPLIT_ID
            and WO.SUB_ID = LT.WORKORDER_SUB_ID
            and WO.[TYPE] = LT.WORKORDER_TYPE
        Left Outer Join EMPLOYEE E
            on LT.EMPLOYEE_ID = E.ID
        INNER JOIN ( Select LT.Workorder_Base_ID, LT.WORKORDER_LOT_ID, LT.WORKORDER_SPLIT_ID, 
                        LT.WORKORDER_SUB_ID, WO.PART_ID, MIN(LT.OPERATION_SEQ_NO )AS 'SEQ_NO'
                    From LABOR_TICKET LT WITH (NOLOCK)
                    Left outer JOin WORK_ORDER WO on WO.BASE_ID = LT.WORKORDER_BASE_ID
                        and WO.LOT_ID = LT.WORKORDER_LOT_ID and WO.SPLIT_ID = LT.WORKORDER_SPLIT_ID
                        and WO.SUB_ID = LT.WORKORDER_SUB_ID and WO.[TYPE] = LT.WORKORDER_TYPE
                    Left Outer Join EMPLOYEE E on LT.EMPLOYEE_ID = E.ID
                    where LT.ACT_CLOCK_IN >= Cast(getdate() as Date) and LT.RESOURCE_ID like '%P2M1-CNC%' 
                        and LT.ACT_CLOCK_OUT is null Group by LT.Workorder_Base_ID, LT.WORKORDER_LOT_ID,
                        LT.WORKORDER_SPLIT_ID, LT.WORKORDER_SUB_ID, WO.PART_ID ) AS TEMP ON TEMP.WORKORDER_BASE_ID=LT.WORKORDER_BASE_ID AND 
            TEMP.PART_ID=WO.PART_ID AND TEMP.SEQ_NO=LT.OPERATION_SEQ_NO AND TEMP.WORKORDER_LOT_ID=LT.WORKORDER_LOT_ID
            AND TEMP.WORKORDER_SPLIT_ID=LT.WORKORDER_SPLIT_ID AND TEMP.WORKORDER_SUB_ID=LT.WORKORDER_SUB_ID
        /* Join to extract sum Hours worked and Good qty */
        INNER JOIN (SELECT WORKORDER_BASE_ID as WO, WORKORDER_LOT_ID as 'Lot_ID', WORKORDER_SPLIT_ID as 'Split_ID', WORKORDER_SUB_ID as 'Sub_ID', 
            OPERATION_SEQ_NO as 'Seq_NO', sum(HOURS_WORKED) as 'Hrs_Wked', SUM(GOOD_QTY) as 'Good_QTY' FROM LABOR_TICKET WITH (NOLOCK) group by WORKORDER_BASE_ID, 
            WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, WORKORDER_SUB_ID, OPERATION_SEQ_NO) LT2 on LT.WORKORDER_BASE_ID = LT2.WO and LT.WORKORDER_LOT_ID = LT2.Lot_ID
            and LT.WORKORDER_SPLIT_ID = LT2.Split_ID and LT.WORKORDER_SUB_ID = LT2.Sub_ID and LT.OPERATION_SEQ_NO = LT2.Seq_NO
    
    WHERE LT.ACT_CLOCK_IN >= Cast(getdate() as Date) 
    and LT.RESOURCE_ID like '%P2M1-CNC%' and LT.ACT_CLOCK_OUT is null 
    --and LT.WORKORDER_BASE_ID = '1748857'
 
    Group by CONCAT(LT.RESOURCE_ID,'_',WO.PART_ID), 
        Concat(LT.Workorder_Base_ID,'/',LT.WORKORDER_LOT_ID,'/',LT.WORKORDER_SPLIT_ID,'/',LT.WORKORDER_SUB_ID) 
        , WO.PART_ID, LT.RESOURCE_ID, WO.DESIRED_QTY, LT.ACT_CLOCK_IN, E.FIRST_NAME, E.LAST_NAME --,LT.ACT_CLOCK_OUT
        , LT.OPERATION_SEQ_NO, LT2.Hrs_Wked, LT2.Good_QTY, Concat(LT.Workorder_Base_ID,'/',LT.WORKORDER_LOT_ID)
    having LT.OPERATION_SEQ_NO= MIN(LT.OPERATION_SEQ_NO)
)
--select * from CTE_1



/* CTE_2 Temporal table to upload requested data from query # 2, remember use ( , ) after CTE_1 to proceed with the creation of CTE_2 */
, CET_2 as (
    Select CONCAT(WO.PART_ID ,'_',LT.OPERATION_SEQ_NO) as 'Unique_Code'
    ,Concat(LT.Workorder_Base_ID,'/',LT.WORKORDER_LOT_ID,'/', LT.WORKORDER_SPLIT_ID,'/', LT.WORKORDER_SUB_ID) as 'Work_Order'
    ,WO.PART_ID as 'Part_ID', LT.RESOURCE_ID, WO.BASE_ID
    ,Avg(WO.DESIRED_QTY) as 'AVG_WO_QTY'
    ,AVG(O.ACT_RUN_HRS) + AVG(O.ACT_SETUP_HRS) as 'AVG_Total_Run_Hrs'
    ,((Avg(O.ACT_RUN_HRS) + Avg(O.ACT_SETUP_HRS)) / Avg(WO.DESIRED_QTY)) as 'AVG_Run_Hrs_Part'
 
    From LABOR_TICKET LT WITH (NOLOCK)
    Left outer JOin WORK_ORDER WO on WO.BASE_ID = LT.WORKORDER_BASE_ID
            and WO.LOT_ID = LT.WORKORDER_LOT_ID and WO.SPLIT_ID = LT.WORKORDER_SPLIT_ID
            and WO.SUB_ID = LT.WORKORDER_SUB_ID and WO.[TYPE] = LT.WORKORDER_TYPE
    Left Outer Join Operation O on O.WORKORDER_BASE_ID = LT.WORKORDER_BASE_ID
            and O.WORKORDER_LOT_ID = LT.WORKORDER_LOT_ID and O.WORKORDER_SPLIT_ID = LT.WORKORDER_SPLIT_ID
            and O.WORKORDER_SUB_ID = LT.WORKORDER_SUB_ID and O.WORKORDER_TYPE = LT.WORKORDER_TYPE
    Left Outer Join EMPLOYEE E on LT.EMPLOYEE_ID = E.ID
 
    where CONCAT(WO.PART_ID ,'_',LT.OPERATION_SEQ_NO) 
            IN (Select Concat(WO.PART_ID,'_', MIN(LT.OPERATION_SEQ_NO)) AS 'Unique_Code'
                    From LABOR_TICKET LT WITH (NOLOCK)
                    Left outer JOin WORK_ORDER WO on WO.BASE_ID = LT.WORKORDER_BASE_ID
                        and WO.LOT_ID = LT.WORKORDER_LOT_ID and WO.SPLIT_ID = LT.WORKORDER_SPLIT_ID
                        and WO.SUB_ID = LT.WORKORDER_SUB_ID and WO.[TYPE] = LT.WORKORDER_TYPE
                    Left Outer Join EMPLOYEE E on LT.EMPLOYEE_ID = E.ID
                    where LT.ACT_CLOCK_IN >= Cast(getdate() as Date) 
                    and LT.RESOURCE_ID like '%P2M1-CNC%' and LT.ACT_CLOCK_OUT is null
                    Group by LT.Workorder_Base_ID, LT.WORKORDER_LOT_ID, LT.WORKORDER_SPLIT_ID,
                    LT.WORKORDER_SUB_ID, WO.PART_ID )
        and O.[STATUS] = 'C' and O.CLose_Date > Getdate()-200
    --and O.RESOURCE_ID = 'P2M1-CNC-3'
    --and WO.PART_ID = '112W3401-16'
    Group by CONCAT(LT.RESOURCE_ID,'_',WO.PART_ID), WO.PART_ID 
    , LT.RESOURCE_ID, LT.OPERATION_SEQ_NO, WO.BASE_ID, LT.Workorder_Base_ID, LT.WORKORDER_LOT_ID, LT.WORKORDER_SPLIT_ID
    , LT.WORKORDER_SUB_ID
)
 

 /* Final query, join CTE_1 and CTE_2 with the requested fields */
 SELECT C1.*, C2.AVG_Run_Hrs_Part, C2.AVG_Total_Run_Hrs, C2.AVG_WO_QTY 
 FROM CTE_1 as C1 WITH (NOLOCK) 
 LEFT JOIN CET_2 C2 on C1.Unique_Code = C2.Unique_Code and C1.Work_Order = C2.Work_Order

```