
-- parts 
-- 

---- Q: is it okay to update part_site for part with null engineering_mstr
---- is correct, renders zero:
--select wo.lot_id from dbo.WORK_ORDER wo where type = 'M' and base_ID = '151W7573-7'

---- is incorrect, renders null
--select  ps.engineering_mstr
--from part p join part_site ps ON p.id = ps.PART_ID
--where p.id = '151W7573-7'

--1. Parts
 --Part ID
 --Part Description
 --Stock UM
 --Shipping Weight
 --Weight UM
 --Eng Master Eng ID
 --Product Code
 --Commodity Code

 /**********************************************************************************************
Description: Code Base 2.1.0 - Work Order
Sample:        
 
Date        Modified By         Change Description
----------  ------------------  ------------------------------------------------------------
6/30/2020                       Created.
 
 
**********************************************************************************************/
--~
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET DEADLOCK_PRIORITY LOW
  
if object_id('tempdb..#results') is not null drop table #results
 
if object_id('tempdb..#work_order') is not null drop table #work_order
if object_id('tempdb..#user_def_fields') is not null drop table #user_def_fields
if object_id('tempdb..#parts') is not null drop table #parts
 
SELECT *
  INTO #WORK_ORDER
FROM dbo.WORK_ORDER wo (NOLOCK)
WHERE EXISTS(
        SELECT 1 FROM dbo.WORK_ORDER wo2 (NOLOCK)
        WHERE (
            wo2.[TYPE] = wo.[TYPE]
            AND wo2.[BASE_ID] = wo.[BASE_ID]
            AND wo2.[LOT_ID] = wo.[LOT_ID]
            AND wo2.[SPLIT_ID] = wo.[SPLIT_ID]
            AND wo2.[SUB_ID] = wo.[SUB_ID]
      
 
        ----AND wo2.[STATUS] IN (N'R', N'F', N'U')
        ----AND wo2.[TYPE] = N'W'
        AND wo2.[TYPE] = N'M'
        AND wo2.SUB_ID = '0'
        ))
 
CREATE CLUSTERED INDEX CIDX_WO2 ON #WORK_ORDER
(
         [BASE_ID]
        ,[LOT_ID]
        ,[SPLIT_ID]
        ,[SUB_ID]
        ,[TYPE]
 
)

CREATE nonCLUSTERED INDEX NCIDX_WO2 ON #WORK_ORDER
(
  [DESIRED_WANT_DATE]
 
) include (  [CLOSE_DATE], PART_ID )

SELECT *
   INTO #USER_DEF_FIELDS
FROM dbo.USER_DEF_FIELDS pud
WHERE (1=1)
AND ( --
 
        pUD.PROGRAM_ID  IN (N'VMPRTMNT', N'VMMFGWIN_WO', N'VMMFGWIN_OP')
    )
 
CREATE CLUSTERED INDEX CIDX_PUD ON #USER_DEF_FIELDS (
             DOCUMENT_ID
            ,ID
            ,PROGRAM_ID
            )
 
select
 --Part ID
 --Part Description
 --Stock UM
 
 --Eng Master Eng ID
 --Product Code
 --Commodity Code
 --Material Type
 --Alloy

      ps.STATUS  --  part status
    , ps.part_id Part_ID
    , p.DESCRIPTION Part_Description
    , p.STOCK_UM Stock_UM
 
    , ps.ENGINEERING_MSTR Part_Eng_Master_ID
    , mstr.LOT_ID Master_Eng_ID
    , p.PRODUCT_CODE Product_Code
    , p.COMMODITY_CODE Commodity_Code
    , material.material Material_Type
    , alloy.alloy Alloy

    , p.buyer_user_id Buyer_User_ID
    , rtrim(p.planner_user_id) Planner_User_ID

    , b.Salesperson_ID
    , p.ORDER_POLICY

--from #work_order w
  into #parts
from part_site ps
--left join #work_order enditem
--    on enditem.[type] = ps.[type]
--    and enditem.[base_id] = ps.[base_id]
--    and enditem.[lot_id] = ps.[lot_id]
--    and enditem.[split_id] = ps.[split_id]
--    and enditem.[sub_id] = '0'
inner join part p
on ps.part_id = p.id
-- 138947/138821
LEFT JOIN #WORK_ORDER mstr
ON p.id = mstr.base_id
and mstr.SUB_ID = '0'
and ps.ENGINEERING_MSTR = mstr.LOT_ID

left outer join [sql-lab-2].livesupplemental.dbo.buyer_assn b
on left(p.buyer_user_id, 2) = b.account_id
outer APPLY
    (
    -- material
    select top 1
         pud2.document_id
        ,pud2.id
        ,pud2.label
        ,nullif(pud2.string_val,'') material
        ,pud2.program_id
        ,p2.id part_id
    from #user_def_fields pud2
    join part p2
    on pud2.document_id = p2.id
    where (1=1)
    and pud2.id in ('udf-0000035') -- material
    and pud2.program_id = 'vmprtmnt'
    and pud2.document_id is not null
    and ps.part_id = pud2.document_id
    ) material
 
    outer APPLY (
    -- alloy
        select top 1
                pud3.document_id
            ,pud3.id
            ,pud3.label
            ,nullif(pud3.string_val,'') alloy
            ,pud3.program_id
            ,p3.id part_id
        from #user_def_fields pud3
        join part p3
        on pud3.document_id = p3.id
        where (1=1)
        and pUD3.ID in ('UDF-0000036')  -- prtMnt Alloy
        AND pUD3.PROGRAM_ID = 'VMPRTMNT'
        and pUD3.DOCUMENT_ID is not null
        AND ps.PART_ID = pUD3.DOCUMENT_ID
    ) alloy
 
where (1=1)
and ps.SITE_ID = 'SK01'

-- drop table #parts
select * from #parts t
where (Part_ID = @Part_ID
or @Part_ID IS NULL ) 
