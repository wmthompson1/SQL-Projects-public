# paint2 op type

```sql
-- DESCRIPTION
    declare @description nvarchar(100) = null -- 'PAINT'
    declare @optype nvarchar(50) = '02GN089' -- '02GN089','5793', 'x'
    declare @specs nvarchar(100) = null -- 'SPRAY BOOTH'
    declare @type nvarchar(50) = null -- 'MFG','FIN','OUTREACH','BALLARD'
    declare @facility nvarchar(50) = null -- 'P1','P2','P3'
    declare @department nvarchar(50) = null -- 'DEPT1','DEPT2'
    declare @process nvarchar(50) = null -- 'PROCESS1','PROCESS2'
    declare @groups nvarchar(50) = null -- 'GROUP1','GROUP2'
    declare @status nvarchar(50) = 'ACTIVE' --,'OBSOLETE'
    declare @resourceids nvarchar(500) = '1001,1002,1003';   

    
    SELECT OT.ID AS OPTYPE
    , OT.[DESCRIPTION]
    , CAST(CAST(OTB.BITS AS VARBINARY(MAX)) AS NVARCHAR(MAX)) AS [SPECS]
    , OT.RESOURCE_ID
    , CASE
            WHEN SR.USER_1 = 'A' THEN 'FIN'
            WHEN SR.USER_1 = 'M' THEN 'MFG'
            WHEN SR.USER_1 = 'O' THEN 'OUTREACH'
            WHEN SR.USER_1 = 'B' THEN 'BALLARD'
            ELSE 'OTHER'
    END AS [BUSINESS_UNIT]
    , CASE
        WHEN ISNULL(SR.[STATUS], 'A') = 'A' THEN 'ACTIVE'
        WHEN SR.[STATUS] = 'O' THEN 'OBSOLETE' 
        ELSE ''
    END AS RESOURCE_STATUS
    , SR.USER_5 AS FACILITY
    , SR.USER_6 AS DEPARTMENT
    , SR.USER_7 AS PROCESS
    , SR.USER_8 AS GROUPS
FROM OPERATION_TYPE OT
-- williamt 10/31/2025 added join to get specs
-- luke:  Skill_OP_TYpe_Binary
-- INNER JOIN OPERATION_TYPE_BINARY OTB
--     ON OTB.OPERATION_TYPE_ID = OT.ID    
INNER JOIN OPER_TYPE_BINARY OTB
    ON OTB.OPERATION_TYPE_ID = OT.ID
LEFT OUTER JOIN SHOP_RESOURCE SR
    ON OT.RESOURCE_ID = SR.ID
WHERE 1=1
    -- AND CASE

    --         WHEN SR.USER_1 = 'A' THEN 'FIN'
    --         WHEN SR.USER_1 = 'M' THEN 'MFG'
    --         WHEN SR.USER_1 = 'O' THEN 'OUTREACH'
    --         WHEN SR.USER_1 = 'B' THEN 'BALLARD'
    --         ELSE 'OTHER'
    -- END IN (@TYPE)
    -- AND SR.USER_5 IN (@FACILITY)
    -- AND SR.USER_6 IN (@DEPARTMENT)
    -- AND SR.USER_7 IN (@PROCESS)
    -- AND SR.USER_8 IN (@GROUPS)
    -- AND CASE
    --     WHEN ISNULL(SR.[STATUS], 'A') = 'A' THEN 'ACTIVE'
    --     WHEN SR.[STATUS] = 'O' THEN 'OBSOLETE' 
    --     ELSE ''
    -- END IN (@STATUS)
    -- AND SR.ID IN (@RESOURCEIDS)
    AND (OT.ID LIKE @OPTYPE + '%' OR @OPTYPE IS NULL)
    -- AND ((OT.[DESCRIPTION] LIKE '%' + @DESCRIPTION + '%') or @DESCRIPTION IS NULL)
    -- AND ((CAST(CAST(OTB.BITS AS VARBINARY(MAX)) AS NVARCHAR(MAX)) LIKE '%'+ @SPECS + '%') OR @SPECS IS NULL)


```