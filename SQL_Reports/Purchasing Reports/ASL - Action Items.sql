/**********************************************************************************************
Description:    Approved Supplier List
Sample:            

Date        Modified By         Change Description
----------  ------------------  ------------------------------------------------------------
8/28/2020                        Existing - Part I
8/28/2020    William Thompson    Added part2 to ASL
9/14/2020    William Thompson    Created ASL - Action Items report based on ASL
9/16/2020    William Thompson    Added year filter on 11 expiration columns
03/12/2025    JC                    Add Filter to apply date range only for 
                    (Approval Expiration on, ITAR Expiration on, DPD Expiration on)
**********************************************************************************************/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET DEADLOCK_PRIORITY LOW

-- Test Header --------------------------------
Declare @Cyear INT
SET @Cyear = year(getdate())
--DECLARE @StartDATE date = '2025-01-01', @ENDDATE date = '2025-12-31'

IF OBJECT_ID('tempdb..#Results') IS NOT NULL DROP TABLE #Results
IF OBJECT_ID('tempdb..#Results2') IS NOT NULL DROP TABLE #Results2
IF OBJECT_ID('tempdb..#USER_DEF_FIELDS') IS NOT NULL DROP TABLE #USER_DEF_FIELDS
IF OBJECT_ID('tempdb..#USER_DEF_FIELDS_Vendor_Cert') IS NOT NULL DROP TABLE #USER_DEF_FIELDS_Vendor_Cert
IF OBJECT_ID('tempdb..#UDF_STRUCTURES') IS NOT NULL DROP TABLE #UDF_STRUCTURES
IF OBJECT_ID('tempdb..#VND_CERTS_KVPAIR_1') IS NOT NULL DROP TABLE #VND_CERTS_KVPAIR_1
IF OBJECT_ID('tempdb..#VND_CERTS_KVPAIR_2') IS NOT NULL DROP TABLE #VND_CERTS_KVPAIR_2
IF OBJECT_ID('tempdb..#VND_CERTS_KVPAIR_3') IS NOT NULL DROP TABLE #VND_CERTS_KVPAIR_3
IF OBJECT_ID('tempdb..#VND_CERTS_SCHEMA') IS NOT NULL DROP TABLE #VND_CERTS_SCHEMA
IF OBJECT_ID('tempdb..#VND_CERTS_DATA_FLAT') IS NOT NULL DROP TABLE #VND_CERTS_DATA_FLAT

SELECT V.ID               AS Vendor_ID,
    V.NAME               AS Vendor_Name,
    V.OPEN_DATE           AS Account_Opened,
    V.LAST_ORDER_DATE       AS Last_PO_Date,
    V.USER_1           AS Controlled_Product,
    V.USER_2           AS Approval_Status,
    V.USER_3           AS Approval_Expiration_on,
    ISDATE(V.USER_3) AS USER_3_IS_DATE,
    V.USER_4       AS ITAR_Expiration_on,
    V.USER_5    AS DPD_Expiration_on,
    V.USER_6    AS Supplier_type,
    V.USER_7    AS Product_type,
    V.USER_8    AS Limitations,
    VS.TEXT                AS QCNotes,
    V.CONTACT_FIRST_NAME 
    +' '+
    V.CONTACT_LAST_NAME  AS Contact_Name, 
    V.CONTACT_EMAIL       AS Email,
    V.CONTACT_PHONE       AS Desk_Phone,
    V.CONTACT_MOBILE       AS Cell,
    V.ADDR_1            AS Address1,
    V.ADDR_2           AS Address2,
    V.CITY               AS City,
    V.STATE               AS State,
    V.ZIPCODE           AS Zip,
    V.BUYER,
    V.CONTACT_FIRST_NAME,
    V.CONTACT_LAST_NAME,
    V.ACTIVE_FLAG
    into #results
FROM  [SQL-Lab-2].[LIVE].dbo.VENDOR V
LEFT OUTER JOIN VENDOR_SPEC VS
  ON V.ID = VS.VENDOR_ID
WHERE  V.ACTIVE_FLAG = 'Y'
      AND V.USER_1 = 'Y'
      

/* ADD VENDORS WITH SK-Purchasing TAB CHECKED  */

-- II ---------------------------------------- ~~


/**********************************************************************************************
Description:    Vendor_Certs_Load_Report
Sample:        in-line sql select
Data by vendor:            

Date        Modified By         Change Description
----------  ------------------  ------------------------------------------------------------
8/27/2020    William Thompson    VMVNDMNT, key value pairs to flat set: vendor cert, expiration by vendor
1/2/2025    Ed Hammond        Commented out one WHERE line that was causing errors after re-implement of Visual

RESOURCES
-- https://social.technet.microsoft.com/wiki/contents/articles/17351.sql-server-pivot.aspx
**********************************************************************************************/

Create Table #VND_CERTS_SCHEMA(
    PROGRAM_ID NVARCHAR(30),   -- FK
    ID NVARCHAR(30),            -- NULL
    DOCUMENT_ID NVARCHAR(254), -- FK
    [COMP EXP]    DATETIME,    
    [CP EXP]    DATETIME,    
    [HT EXP]    DATETIME,    
    [MTL EXP]    DATETIME,    
    [NDT EXP]    DATETIME,
    [SE EXP]    DATETIME,    
    [SLT EXP]    DATETIME,    
    [WLD EXP]    DATETIME
    )

Create Table #VND_CERTS_DATA_FLAT(

    PROGRAM_ID NVARCHAR(30),   -- FK
    ID NVARCHAR(30),            -- NULL
    DOCUMENT_ID NVARCHAR(254), -- FK
    [COMP EXP]    DATETIME,    
    [CP EXP]    DATETIME,    
    [HT EXP]    DATETIME,    
    [MTL EXP]    DATETIME,    
    [NDT EXP]    DATETIME,
    [SE EXP]    DATETIME,    
    [SLT EXP]    DATETIME,    
    [WLD EXP]    DATETIME
    )

select pUD0.* INTO #USER_DEF_FIELDS
from USER_DEF_FIELDS pUD0 (NOLOCK)
where (1=1)
AND (  pUD0.PROGRAM_ID    IN (N'VMVNDMNT') )
AND pUD0.DOCUMENT_ID is not null
AND pUD0.ID IS NOT NULL

CREATE CLUSTERED INDEX CIDX_PUD 
    ON #USER_DEF_FIELDS ( DOCUMENT_ID, ID, PROGRAM_ID )

    

select pUD0.* INTO #VND_CERTS_KVPAIR_1
from #USER_DEF_FIELDS pUD0
where (1=1)
AND (  pUD0.PROGRAM_ID    IN (N'VMVNDMNT') )
AND pUD0.ID IN ( 'UDF-0000093','UDF-0000094' )

select pUD0.* INTO #VND_CERTS_KVPAIR_2
from #USER_DEF_FIELDS pUD0
where (1=1)
AND ( pUD0.PROGRAM_ID IN (N'VMVNDMNT') )
AND pUD0.ID IN ('UDF-0000095','UDF-0000096')

select pUD0.* INTO #VND_CERTS_KVPAIR_3
from #USER_DEF_FIELDS pUD0
where (1=1)
AND ( pUD0.PROGRAM_ID    IN (N'VMVNDMNT') )
AND pUD0.ID IN ( 'UDF-0000097','UDF-0000098');

--select * from USER_DEF_FIELDS where PROGRAM_ID = 'VMVNDMNT' and DOCUMENT_ID = 'STECON'
--    and ID in ('UDF-0000093','UDF-0000094', 'UDF-0000095','UDF-0000096', 'UDF-0000097','UDF-0000098')

-- Pivot Tables three sets of UDF's -----

-- Key Value Pair (Vendor Cert, Expirtion)
-- KV93_94
WITH CTE_KV_93_94 AS (
    SELECT kv1.PROGRAM_ID, 'x' AS ID, kv1.DOCUMENT_ID
      , kv1.STRING_VAL, kv2.DATE_VAL
    FROM #VND_CERTS_KVPAIR_1 kv1
    JOIN #VND_CERTS_KVPAIR_1 kv2 ON kv1.PROGRAM_ID = kv2.PROGRAM_ID
    AND kv1.DOCUMENT_ID = kv2.DOCUMENT_ID
    AND Kv1.ID = 'UDF-0000093' AND kv2.ID = 'UDF-0000094'
)

INSERT INTO #VND_CERTS_SCHEMA
SELECT pvt.* FROM CTE_KV_93_94
PIVOT ( MAX(DATE_VAL)
     FOR STRING_VAL
        IN ( [COMP EXP], [CP EXP], [HT EXP], [MTL EXP]
            , [NDT EXP], [SE EXP], [SLT EXP], [WLD EXP]
        )
 ) pvt;

-- Key Value Pair (Vendor Cert, Expirtion)
-- KV95_96
WITH CTE_KV_95_96 AS (
    SELECT kv1.PROGRAM_ID, 'x' AS ID, kv1.DOCUMENT_ID
        , kv1.STRING_VAL, kv2.DATE_VAL 
    FROM #VND_CERTS_KVPAIR_2 kv1
    JOIN #VND_CERTS_KVPAIR_2 kv2 ON kv1.PROGRAM_ID = kv2.PROGRAM_ID
    AND kv1.DOCUMENT_ID = kv2.DOCUMENT_ID
    AND Kv1.ID = 'UDF-0000095' AND kv2.ID = 'UDF-0000096'
)

INSERT INTO #VND_CERTS_SCHEMA
SELECT pvt.* FROM CTE_KV_95_96
PIVOT ( MAX(DATE_VAL)
    FOR STRING_VAL
        IN ( [COMP EXP], [CP EXP], [HT EXP], [MTL EXP]
            , [NDT EXP], [SE EXP], [SLT EXP], [WLD EXP]
        )
 ) pvt;

-- https://social.technet.microsoft.com/wiki/contents/articles/17351.sql-server-pivot.aspx

-- Key Value Pair (Vendor Cert, Expirtion)
-- KV_97_98
WITH CTE_KV_97_98 AS (
    SELECT kv1.PROGRAM_ID, 'x' AS ID, kv1.DOCUMENT_ID
        , kv1.STRING_VAL, kv2.DATE_VAL
    FROM #VND_CERTS_KVPAIR_3 kv1
    JOIN #VND_CERTS_KVPAIR_3 kv2 ON kv1.PROGRAM_ID = kv2.PROGRAM_ID
    AND kv1.DOCUMENT_ID = kv2.DOCUMENT_ID
    AND Kv1.ID = 'UDF-0000097' AND kv2.ID = 'UDF-0000098'
)
INSERT INTO #VND_CERTS_SCHEMA
SELECT pvt.* FROM CTE_KV_97_98
PIVOT ( MAX(DATE_VAL)
    FOR STRING_VAL
        IN ( [COMP EXP], [CP EXP], [HT EXP], [MTL EXP]
            , [NDT EXP], [SE EXP], [SLT EXP], [WLD EXP]
        )
 ) pvt

INSERT INTO #VND_CERTS_DATA_FLAT
SELECT [PROGRAM_ID], [ID], [DOCUMENT_ID]
    , [COMP EXP], [CP EXP], [HT EXP], [MTL EXP]        
    , [NDT EXP], [SE EXP], [SLT EXP], [WLD EXP]    
FROM (    
        SELECT [PROGRAM_ID], [ID], [DOCUMENT_ID]
            ,MAX([COMP EXP]) [COMP EXP]             
            ,MAX([CP EXP])     [CP EXP]        
            ,MAX([HT EXP])     [HT EXP]        
            ,MAX([MTL EXP])     [MTL EXP]        
            ,MAX([NDT EXP])     [NDT EXP]        
            ,MAX([SE EXP])     [SE EXP]        
            ,MAX([SLT EXP])     [SLT EXP]        
            ,MAX([WLD EXP])     [WLD EXP]    
        FROM #VND_CERTS_SCHEMA
        GROUP BY [PROGRAM_ID], [ID], [DOCUMENT_ID]
) X

SELECT
 r.Vendor_ID
,r.Vendor_Name
,r.Account_Opened
,r.Last_PO_Date
,r.Controlled_Product
,r.Approval_Status
,r.Approval_Expiration_on Approval_Expiration_on
,Approval_Expiration_onX = case ISDATE(r.Approval_Expiration_on) when 1 then year(r.Approval_Expiration_on) else convert(int,null) end
,Approval_Expiration_onZ = case ISDATE(r.Approval_Expiration_on) when 1 then 1 else 0 end
,r.ITAR_Expiration_on ITAR_Expiration_on
,ITAR_Expiration_onX = case ISDATE(r.ITAR_Expiration_on) when 1 then year(r.ITAR_Expiration_on) else convert(int,null) end
,ITAR_Expiration_onZ = case ISDATE(r.ITAR_Expiration_on) when 1 then 1 else 0 end
,r.DPD_Expiration_on DPD_Expiration_on
,DPD_Expiration_onX = case ISDATE(r.DPD_Expiration_on) when 1 then year(r.DPD_Expiration_on) else convert(int,null) end
,DPD_Expiration_onZ = case ISDATE(r.DPD_Expiration_on) when 1 then 1 else 0 end
,r.Supplier_type
,r.Product_type
,r.Limitations
,r.QCNotes
,r.Contact_Name
,r.Email
,r.Desk_Phone
,r.Cell
,r.Address1
,r.Address2
,r.City
,r.[State]
,r.Zip
,r.BUYER
,r.CONTACT_FIRST_NAME
,r.CONTACT_LAST_NAME
,r.ACTIVE_FLAG
,t.PROGRAM_ID
,t.[COMP EXP] 
,[COMP EXPX] = case ISDATE(t.[COMP EXP]) when 1 then YEAR(t.[COMP EXP]) else CONVERT(INT,NULL) end
,t.[CP EXP]
,[CP EXPX] = case ISDATE(t.[CP EXP]) when 1 then year(t.[CP EXP]) else convert(int,null) end
,t.[HT EXP]
,[HT EXPX] = case ISDATE(t.[HT EXP]) when 1 then year(t.[HT EXP]) else convert(int,null) end
,t.[MTL EXP]
,[MTL EXPX] = case ISDATE(t.[MTL EXP]) when 1 then year(t.[MTL EXP]) else convert(int,null) end
,t.[NDT EXP]
,[NDT EXPX] = case ISDATE(t.[NDT EXP]) when 1 then year(t.[NDT EXP]) else convert(int,null) end
,t.[SE EXP]
,[SE EXPX] = case ISDATE(t.[SE EXP]) when 1 then year(t.[SE EXP]) else convert(int,null) end
,t.[SLT EXP]
,[SLT EXPX] = case ISDATE(t.[SLT EXP]) when 1 then year(t.[SLT EXP]) else convert(int,null) end
,t.[WLD EXP]
,[WLD EXPX] = case ISDATE(t.[WLD EXP]) when 1 then year(t.[WLD EXP]) else convert(int,null) end
  into #Results2
FROM #results r
LEFT JOIN #VND_CERTS_DATA_FLAT t
ON r.Vendor_ID = t.DOCUMENT_ID

SELECT * FROM #Results2 t
WHERE 
    (Cast(Approval_Expiration_on as DATE) >= @StartDATE AND Cast(Approval_Expiration_on as DATE) <= @ENDDATE )
    or 
    (Cast(ITAR_Expiration_on as DATE) >= @StartDATE AND Cast(ITAR_Expiration_on as DATE) <= @ENDDATE )
    or
    (Cast(DPD_Expiration_on as DATE) >= @StartDATE AND Cast(DPD_Expiration_on as DATE) <= @ENDDATE )
    or
    (Cast([COMP EXP] as DATE) >= @StartDATE AND Cast([COMP EXP] as DATE) <= @ENDDATE )
    or
    (Cast([CP EXP] as DATE) >= @StartDATE AND Cast([CP EXP] as DATE) <= @ENDDATE )
    or
    (Cast([HT EXP] as DATE) >= @StartDATE AND Cast([HT EXP] as DATE) <= @ENDDATE )
    or
    (Cast([MTL EXP] as DATE) >= @StartDATE AND Cast([MTL EXP] as DATE) <= @ENDDATE )
    or
    (Cast([NDT EXP] as DATE) >= @StartDATE AND Cast([NDT EXP] as DATE) <= @ENDDATE )
    or
    (Cast([SE EXP] as DATE) >= @StartDATE AND Cast([SE EXP] as DATE) <= @ENDDATE )
    or
    (Cast([SLT EXP] as DATE) >= @StartDATE AND Cast([SLT EXP] as DATE) <= @ENDDATE )
    or
    (Cast([WLD EXP] as DATE) >= @StartDATE AND Cast([WLD EXP] as DATE) <= @ENDDATE )
        
UNION

SELECT V.ID                AS Vendor_ID,
    V.NAME                AS Vendor_Name,
    V.OPEN_DATE            AS Account_Opened,
    V.LAST_ORDER_DATE    AS Last_PO_Date,
    V.USER_1            AS Controlled_Product,
    V.USER_2            AS Approval_Status,
    V.USER_3            AS Approval_Expiration_on,
    DATEPART(YEAR, V.USER_3)    AS Approval_Expiration_onX,
    ISDATE(V.USER_3)            AS Appruval_Expiration_onZ,
    V.USER_4            AS ITAR_Expiration_on,
    DATEPART(YEAR, V.USER_4)    AS ITAR_Expiration_onX,
    IIF(V.USER_4 IS NULL, 0, 1)    AS ITAR_Expiration_onZ,
    V.USER_5            AS DPD_Expiration_on,
    DATEPART(YEAR, V.USER_5)    AS DPD_Expiration_onX,
    IIF(V.USER_5 IS NULL, 0, 1)    AS DPD_Expiration_onZ,
    V.USER_6            AS Supplier_type,
    V.USER_7            AS Product_type,
    V.USER_8            AS Limitations,
    VS.TEXT                AS QCNotes,
    V.CONTACT_FIRST_NAME +' '+ V.CONTACT_LAST_NAME  AS Contact_Name, 
    V.CONTACT_EMAIL    AS Email, V.CONTACT_PHONE AS Desk_Phone, V.CONTACT_MOBILE AS Cell,
    V.ADDR_1 AS Address1, V.ADDR_2 AS Address2, V.CITY AS City, V.STATE AS State,
    V.ZIPCODE AS Zip, V.BUYER, V.CONTACT_FIRST_NAME, V.CONTACT_LAST_NAME, V.ACTIVE_FLAG,
    UDF.PROGRAM_ID, NULL AS 'COMP_EXP', NULL AS 'COMP_EXPX', NULL AS 'CP_EXP', NULL AS 'CP_EXPX',
    NULL AS 'HP_EXP', NULL AS 'H_EXPX', NULL AS 'MTL_EXP', NULL AS 'MTL_EXPX', NULL AS 'NDT_EXP',
    NULL AS 'NPD_EXPX', NULL AS 'SE_EXP', NULL AS 'SE_EXPX', NULL AS 'SLT_EXP', NULL AS 'SLT_EXPX', 
    NULL AS 'WLD_EXP', NULL AS 'WLD_EXPX'
FROM  [SQL-Lab-2].[LIVE].dbo.VENDOR V
LEFT OUTER JOIN VENDOR_SPEC VS ON V.ID = VS.VENDOR_ID
INNER JOIN [SQL-Lab-2].[LIVE].[dbo].[USER_DEF_FIELDS] UDF ON V.ID = UDF.DOCUMENT_ID
WHERE  V.ACTIVE_FLAG = 'Y' AND V.USER_1 = 'Y' AND UDF.PROGRAM_ID = 'VMVNDMNT' and UDF.ID = 'UDF-0000090'
