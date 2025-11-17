# Raw Material Label by Work Order

```sql
SELECT   W.BASE_ID, W.PART_ID , W.Type
    , W.Lot_ID
    , W.Split_ID
, CASE
                WHEN PS.PRIMARY_WHS_ID IS NULL THEN 'ALTERNATE'
                     ELSE 'PRIMARY'
                END + ' > ' + PL.WAREHOUSE_ID + '/' + PL.LOCATION_ID
                AS [PART_LOCATION]
                , PL.WAREHOUSE_ID + '/' + PL.LOCATION_ID AS LOCATION_ID
                , ISNULL(UDF.STRING_VAL, DBO.SPLIT(P.[DESCRIPTION], 2, ' ')) AS MATL_TYPE
, W.BASE_ID+'/'+W.Lot_ID+'.'+W.Split_ID as 'WO_PO'
FROM            WORK_ORDER W WITH (NOLOCK)
INNER JOIN      PART P WITH (NOLOCK)
                ON P.ID = W.PART_ID
LEFT OUTER JOIN PART_LOCATION PL
                ON W.PART_ID = PL.PART_ID
                AND PL.[STATUS] = 'A'
LEFT OUTER JOIN PART_SITE PS
                ON PS.PART_ID = W.PART_ID
                AND PL.WAREHOUSE_ID = PS.PRIMARY_WHS_ID
                AND PL.LOCATION_ID = PS.PRIMARY_LOC_ID
LEFT OUTER JOIN USER_DEF_FIELDS UDF
                ON UDF.PROGRAM_ID = 'VMPRTMNT'
                AND UDF.ID = 'UDF-0000035'
                AND UDF.DOCUMENT_ID = W.PART_ID

WHERE W.BASE_ID = @Work_Order AND W.Lot_ID    = @Lot_ID
     AND W.Split_ID  = @Split_ID AND W.Sub_ID    = @Sub_ID

```