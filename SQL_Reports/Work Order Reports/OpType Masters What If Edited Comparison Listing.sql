/****************************report*****************************************************************
-- Description:
-- Sample:
-- Date      Modified By      Change Description
-- ---------- ------------------ ------------------------------------------------------------
-- 11/04/2025 William Thompson  Created script to compare OPERATION_TYPE_BINARY.BITS with OPERATION_BINARY.BITS
-- 12/-1/2024 William Thompson  removed join  AND o.RESOURCE_ID    = ot.RESOURCE_ID
-- note: within tail text, only the rightmost portion containing line breaks is relevant
-- note: requirements will be limited in scope to only this module to enable verification of binary comparison.
-- note: assume that two crlfs follow each spec line, do not validate those crlfs.
-- note: do not include any BCP rules in scope.
-- note: to the eyes of the user, the text in staging appears equal to the text in masters.
-- NOTE: engineering masters only ob.WORKORDER_TYPE = 'M'  <-- added filter
-- casting bits always has to be in this format: CAST(CAST(otb.BITS AS varbinary(max)) AS nvarchar(max))
-- the objective is to allow identification of records where OPERATION_TYPE_BINARY.BITS has trailing 
-- line breaks (CHAR(10) or CHAR(13)) that are not present in OPERATION_BINARY.BITS
-- the main requirement was from the Plannning Supervisor for purposes of changing engineering specs.
-- specs stagedfrom OPER_TYPE_BINARY table have to be pushed to engineering masters OPERATION_BINARY table
-- **********************************************************************************************/
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET DEADLOCK_PRIORITY LOW;
IF OBJECT_ID('tempdb..#Results') IS NOT NULL DROP TABLE #Results;



DECLARE @WorkorderBaseId   varchar(50)  = NULL;      -- e.g., '5000-6730-001'
-- DECLARE @OperationTypeId   varchar(50)  = NULL;      -- e.g., '02GN089', '5793'
-- OPTYPE
DECLARE @ResourceId        varchar(100) = NULL;      -- e.g., 'P1F1-PNT-PRIME'
DECLARE @WorkorderType     char(1)      = 'M';      -- e.g., 'M'
DECLARE @TEST INT       = 1;        -- 1 = include all operation types, 0 = filter by @OPTYPE
--  -- DECLARE @OPTYPE NVARCHAR(MAX) = '5793'; -- Example: '5793'  'NULL';
DECLARE @OPTYPE NVARCHAR(MAX) = NULL; -- Example: '5793'  'NULL'.

;WITH J AS
(
    SELECT  top 1000
        -- Keys (adjust if needed)
        -- ob.WORKORDER_BASE_ID, ob.WORKORDER_LOT_ID, ob.WORKORDER_SPLIT_ID,
        -- ob.WORKORDER_SUB_ID,

        'x' as note   
        , o.WORKORDER_BASE_ID + '-' + o.WORKORDER_lot_ID + '-' + o.WORKORDER_split_ID + '-' + o.WORKORDER_sub_ID AS FULL_LOT_ID
        
        ,  ob.WORKORDER_TYPE,   ob.SEQUENCE_NO,
        o.OPERATION_TYPE AS OPERATION_TYPE_ID,
        o.RESOURCE_ID,

        -- Raw binaries
        OTB_Bits = otb.BITS,
        OB_Bits  = ob.BITS,

        -- Your required text view
        OTB_Text = CAST(CAST(otb.BITS AS varbinary(max)) AS nvarchar(max)),
        OB_Text  = CAST(CAST(ob.BITS  AS varbinary(max)) AS nvarchar(max))
    FROM dbo.OPERATION o

    JOIN dbo.OPERATION_TYPE ot
      ON o.OPERATION_TYPE = ot.ID
    -- AND o.RESOURCE_ID    = ot.RESOURCE_ID

    JOIN dbo.OPER_TYPE_BINARY otb
      ON otb.OPERATION_TYPE_ID = o.OPERATION_TYPE

    JOIN dbo.OPERATION_BINARY ob
      ON ob.WORKORDER_BASE_ID = o.WORKORDER_BASE_ID
     AND ob.WORKORDER_LOT_ID  = o.WORKORDER_LOT_ID
     AND ob.WORKORDER_SPLIT_ID= o.WORKORDER_SPLIT_ID
     AND ob.WORKORDER_SUB_ID  = o.WORKORDER_SUB_ID
     AND ob.WORKORDER_TYPE    = o.WORKORDER_TYPE
     AND ob.SEQUENCE_NO       = o.SEQUENCE_NO

    WHERE 1=1
    --   AND (@WorkorderBaseId IS NULL OR o.WORKORDER_BASE_ID = @WorkorderBaseId)
    --AND (@OperationTypeId IS NULL OR o.OPERATION_TYPE    = @OperationTypeId)
    and o.OPERATION_TYPE in (select id from [SQL-BI-1].[Staging].[dbo].[MyTable])
    and ( o.OPERATION_TYPE in (@OPTYPE)
      OR @TEST = 1)

    --AND o.OPERATION_TYPE  like '5793'  --'02GN089'
    -- AND (@ResourceId      IS NULL OR o.RESOURCE_ID       = @ResourceId)
      AND ob.WORKORDER_TYPE = @WorkorderType
),
Tails AS
(
    -- Compute trailing CR/LF length and body for both sides.
    -- We only care about the tail composed of CHAR(13)/CHAR(10).
    SELECT
        J.*,

        -- Reverse strings to find the first non-CR/LF from the right
        OTB_Rev = REVERSE(J.OTB_Text),
        OB_Rev  = REVERSE(J.OB_Text)
    FROM J
),
Cuts AS
(
    SELECT
        T.*,

        OTB_FirstNon = NULLIF(PATINDEX('%[^' + CHAR(13) + CHAR(10) + ']%', T.OTB_Rev), 0),
        OB_FirstNon  = NULLIF(PATINDEX('%[^' + CHAR(13) + CHAR(10) + ']%', T.OB_Rev ), 0)
    FROM Tails AS T
),
Bodies AS
(
    SELECT
        C.*,

        OTB_TrailingLen = CASE 
                            WHEN C.OTB_Text IS NULL THEN NULL
                            WHEN C.OTB_FirstNon IS NULL THEN LEN(C.OTB_Text)        -- all CR/LF
                            ELSE C.OTB_FirstNon - 1
                          END,
        OB_TrailingLen  = CASE 
                            WHEN C.OB_Text IS NULL THEN NULL
                            WHEN C.OB_FirstNon IS NULL THEN LEN(C.OB_Text)           -- all CR/LF
                            ELSE C.OB_FirstNon - 1
                          END
    FROM Cuts AS C
),
Result AS
(
    SELECT
        B.*,
        OTB_Body = CASE 
                     WHEN B.OTB_Text IS NULL THEN NULL
                     ELSE LEFT(B.OTB_Text, LEN(B.OTB_Text) - ISNULL(B.OTB_TrailingLen, 0))
                   END,
        OB_Body  = CASE 
                     WHEN B.OB_Text IS NULL THEN NULL
                     ELSE LEFT(B.OB_Text,  LEN(B.OB_Text)  - ISNULL(B.OB_TrailingLen, 0))
                   END
    FROM Bodies AS B
)
SELECT
    --WORKORDER_BASE_ID, WORKORDER_LOT_ID, WORKORDER_SPLIT_ID, WORKORDER_SUB_ID,
    FULL_LOT_ID,
    WORKORDER_TYPE, SEQUENCE_NO, OPERATION_TYPE_ID, RESOURCE_ID,
    OTB_TrailingLen, OB_TrailingLen,
    DATALENGTH(OTB_Bits) AS OTB_Bytes, DATALENGTH(OB_Bits) AS OB_Bytes
    ,case when  (OTB_Body <> OB_Body) then 1 else 0 end as specs_Different
    , OTB_Body, OB_Body -- uncomment to inspect textual bodies
    ,right(OTB_Body, 20) as OTB_TailText, right(OB_Body, 20) as OB_TailText

FROM Result
WHERE 1=1
--       -- Bodies are identical (to the eye, content matches)
--     AND ((OTB_Body <> OB_Body) OR (OTB_Body IS NULL AND OB_Body IS NULL))
--   AND -- Staging has more trailing CR/LF than master (this is the condition you asked to flag)
--       ISNULL(OTB_TrailingLen, 0) > ISNULL(OB_TrailingLen, 0)
ORDER BY -- WORKORDER_BASE_ID, SEQUENCE_NO;
    OPERATION_TYPE_ID,
    FULL_LOT_ID,
    SEQUENCE_NO;