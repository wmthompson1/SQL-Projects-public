

-- Good Code 
-- we need to verify the last two columns 


WIth CTE_LC AS
(

Select 
WO.BASE_ID
,WO.LOT_ID
,Wo.SUB_ID
,WO.SPLIT_ID
,Max(O.SEQUENCE_NO) as 'Last_Operation'
,Max(LT.ACT_CLOCK_OUT) as 'Last_Clock_Date'
,WO.DESIRED_WANT_DATE
,LT.ACT_CLOCK_IN 

--,  WO.[TYPE]

From WORK_ORDER WO
    Left Outer Join LABOR_TICKET LT
        On LT.WORKORDER_BASE_ID = WO.BASE_ID 
        and LT.WORKORDER_LOT_ID = WO.LOT_ID
        and LT.WORKORDER_SUB_ID = WO.SUB_ID
        and LT.WORKORDER_SPLIT_ID = WO.SPLIT_ID
        and LT.WORKORDER_TYPE = WO.[TYPE]
        
    Left Outer Join OPERATION O
        on O.WORKORDER_BASE_ID = WO.BASE_ID 
        and O.WORKORDER_LOT_ID = WO.LOT_ID
        and O.WORKORDER_SUB_ID = WO.SUB_ID
        and O.WORKORDER_SPLIT_ID = WO.SPLIT_ID
        and O.WORKORDER_TYPE = WO.[Type]
        

WHere 
O.RESOURCE_ID in ('P1F1-OVEN-PRIME', 'P1F2-Oven-Prime')
and LT.RESOURCE_ID in ('P1F1-OVEN-Prime', 'P1F2-Oven-Prime')
and LT.ACT_CLOCK_IN > '12/31/2021'
and LT.ACT_CLOCK_IN is not null

 
 Group by 
 WO.BASE_ID
 ,WO.LOT_ID
 ,WO.SUB_ID
 ,WO.SPLIT_ID
 ,WO.DESIRED_WANT_DATE
 ,O.RESOURCE_ID,LT.ACT_CLOCK_IN 
 )
 
 
 
 ,CTE_FC AS

 (

 Select
 Distinct WO.BASE_ID
 ,WO.LOT_ID
 ,WO.SUB_ID
 ,WO.SPLIT_ID
 ,Min(O.Sequence_no) as 'First_Operation'
 ,Min(LT.Act_Clock_in) as 'First_Clock_Date'
,WO.Desired_Want_Date
,LT.ACT_CLOCK_IN 
,WO.[TYPE]

 , Case
    When LT.Act_Clock_in > WO.DESIRED_WANT_DATE
    Then 'Yes'
    Else 'No'
  End as 'LastewhenArriving'

,Case
    When LT.ACT_CLOCK_OUT > WO.DESIRED_WANT_DATE 
    Then 'Yes'
    Else 'No'
 End as 'LastewhenLeaving'

From WORK_ORDER WO
    Left Outer Join LABOR_TICKET LT
        On LT.WORKORDER_BASE_ID = WO.BASE_ID 
        and LT.WORKORDER_LOT_ID = WO.LOT_ID
        and LT.WORKORDER_SUB_ID = WO.SUB_ID
        and LT.WORKORDER_SPLIT_ID = WO.SPLIT_ID
        and LT.WORKORDER_TYPE = WO.[TYPE]
        
        
    Left Outer Join OPERATION O
        on O.WORKORDER_BASE_ID = WO.BASE_ID 
        and O.WORKORDER_LOT_ID = WO.LOT_ID
        and O.WORKORDER_SUB_ID = WO.SUB_ID
        and O.WORKORDER_SPLIT_ID = WO.SPLIT_ID
        and O.WORKORDER_TYPE = WO.[Type]
        

WHere 
O.RESOURCE_ID in ('P1F1-PNT-Prime', 'P1F2-PNT-Prime')
and LT.RESOURCE_ID in ('P1F1-PNT-Prime', 'P1F2-PNT-Prime')
and LT.ACT_CLOCK_IN > '12/31/2021'
and LT.ACT_CLOCK_IN is not null


 Group by 
 WO.BASE_ID
 ,WO.LOT_ID
 ,WO.SUB_ID
 ,WO.SPLIT_ID
 ,WO.DESIRED_WANT_DATE
 ,O.RESOURCE_ID,LT.ACT_CLOCK_IN ,  WO.[TYPE]
  ,  LT.Act_Clock_in , WO.DESIRED_WANT_DATE, LT.ACT_CLOCK_OUT

 )


,CTE_WO AS

 (

Select


 Day(LT.Act_Clock_in) AS Days, WO.[TYPE]

,count(LT.Act_Clock_in) AS total_count


From WORK_ORDER WO
    Left Outer Join LABOR_TICKET LT
        On LT.WORKORDER_BASE_ID = WO.BASE_ID 
        and LT.WORKORDER_LOT_ID = WO.LOT_ID
        and LT.WORKORDER_SUB_ID = WO.SUB_ID
        and LT.WORKORDER_SPLIT_ID = WO.SPLIT_ID
        and LT.WORKORDER_TYPE = WO.[TYPE]
        
        
    Left Outer Join OPERATION O
        on O.WORKORDER_BASE_ID = WO.BASE_ID 
        and O.WORKORDER_LOT_ID = WO.LOT_ID
        and O.WORKORDER_SUB_ID = WO.SUB_ID
        and O.WORKORDER_SPLIT_ID = WO.SPLIT_ID
        and O.WORKORDER_TYPE = WO.[Type]
        

WHere O.RESOURCE_ID in ('P1F1-PNT-Prime', 'P1F2-PNT-Prime')
  and LT.RESOURCE_ID in ('P1F1-PNT-Prime', 'P1F2-PNT-Prime')
  and LT.ACT_CLOCK_IN > '12/31/2021'
  and LT.ACT_CLOCK_IN is not null

  AND MONTH(LT.ACT_CLOCK_IN) = MONTH(GetDate())


  Group by  Day(LT.Act_Clock_in), WO.[TYPE]


  )
 Select 

  Distinct WOR.Days

 ,WOR.total_count, FC.LastewhenArriving, FC.LastewhenLeaving


 From CTE_LC LC
    Left Outer JOin CTE_FC FC
        on LC.BASE_ID = FC.BASE_ID
        and LC.LOT_ID = FC.LOT_ID
        and LC.SUB_ID = FC.SUB_ID
        and LC.SPLIT_ID = FC.SPLIT_ID

Left Outer JOIN CTE_WO WOR
   on FC.[TYPE] = WOR.[TYPE]

  where MONTH(FC.ACT_CLOCK_IN ) = MONTH(GetDate())

  AND FC.LastewhenArriving    <> 'No'
  AND FC.LastewhenLeaving     <> 'No'

  Group by  WOR.Days , WOR.total_count, FC.LastewhenArriving, FC.LastewhenLeaving



