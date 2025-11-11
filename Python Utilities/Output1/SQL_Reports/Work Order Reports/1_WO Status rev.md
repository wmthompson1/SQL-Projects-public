# 1_WO Status rev

```sql
-- VISUAL ENTERPRISE > SHIPPING REPORTS > 1_WO Status rev
SELECT w.BASE_ID
    , w.PART_ID
    , w.STATUS
    , w.DESIRED_WANT_DATE
    , w.TYPE
    , p.PLANNER_USER_ID
    , wcp.expr1 AS preExpr1
    , p.BUYER_USER_ID
    , wca.Expr1
    --, "OPERATION"."WORKORDER_BASE_ID"
    , w.RECEIVED_QTY
    , w.SUB_ID
    , p.QTY_AVAILABLE_ISS
    , w.DESIRED_QTY
    , p.COMMODITY_CODE
    , p.PLANNING_LEADTIME
    , w.SPLIT_ID
    , w.DESIRED_RLS_DATE
    , wca.REMAINING_OPS 
    , replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(wca.REMAINING_OPS,
        'AUB-', ''),'BAL-', ''),'amp;', ''),'(Contractor)','(O/S)'), 'PRECISION', '') 
        , 'assembly, assembly', 'assembly'), 'cncmill, cncmill', 'cncmill'), 'cncmill-4, cncmill-4', 'cncmill-4')
        , 'TITANIUM', 'TI'), 'okuma, okuma', 'okuma'), 'honing, honing', 'honing'), 'brakeform, brakeform', 'brakeform') AS Ops1
    , CASE 
    WHEN w.RECEIVED_QTY > 0 AND p.QTY_AVAILABLE_ISS > 0 
        THEN '(' + CAST(p.QTY_AVAILABLE_ISS AS VARCHAR) + ')' + ' In Stock, ' + w.BASE_ID + ' Internal Split'
    WHEN w.RECEIVED_QTY > 0 AND p.QTY_AVAILABLE_ISS = 0
        THEN w.BASE_ID + ' (' + CAST((w.DESIRED_QTY - w.RECEIVED_QTY) AS VARCHAR) + ')  Internal Split'
    ELSE CASE 
        WHEN w.STATUS = 'F' THEN w.BASE_ID + ' (' + CAST(w.DESIRED_QTY AS VARCHAR) + ')  Firmed'
        WHEN w.STATUS = 'U' THEN w.BASE_ID + ' (' + CAST(w.DESIRED_QTY AS VARCHAR) + ')  On Hold'
        ELSE CASE 
            WHEN wcp.expr1 IS NULL THEN  w.BASE_ID + ' (' + CAST(w.DESIRED_QTY AS VARCHAR) + ')  Complete'
            ELSE CASE 
                WHEN replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(wca.REMAINING_OPS,
                    'AUB-', ''),'BAL-', ''),'amp;', ''),'(Contractor)','(O/S)'), 'PRECISION', '') 
                    , 'assembly, assembly', 'assembly'), 'cncmill, cncmill', 'cncmill'), 'cncmill-4, cncmill-4', 'cncmill-4')
                    , 'TITANIUM', 'TI'), 'okuma, okuma', 'okuma'), 'honing, honing', 'honing'), 'brakeform, brakeform', 'brakeform')
                    IS NULL THEN w.BASE_ID + ' (' + CAST(w.DESIRED_QTY AS VARCHAR) + ') ' + wca.Expr1
                ELSE CASE 
                    WHEN w.SPLIT_ID <> '0' 
                        THEN w.BASE_ID + '/' + w.LOT_ID + '.' + w.SPLIT_ID + ' (' + CAST(w.DESIRED_QTY AS VARCHAR) + wca.Expr1
                    ELSE w.BASE_ID + ' (' + CAST(w.DESIRED_QTY AS VARCHAR) + ') ' + wcp.expr1 + ', ' + replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(wca.REMAINING_OPS,
                        'AUB-', ''),'BAL-', ''),'amp;', ''),'(Contractor)','(O/S)'), 'PRECISION', '') 
                        , 'assembly, assembly', 'assembly'), 'cncmill, cncmill', 'cncmill'), 'cncmill-4, cncmill-4', 'cncmill-4')
                        , 'TITANIUM', 'TI'), 'okuma, okuma', 'okuma'), 'honing, honing', 'honing'), 'brakeform, brakeform', 'brakeform')
                    END
                END
            END
        END
    END AS ProductionStatus
    , dbo.sfnWONUMFormat(w.BASE_ID, w.LOT_ID, w.SPLIT_ID, w.SUB_ID) AS WONum        
FROM WORK_ORDER W 
LEFT OUTER JOIN WO_CURRENTLY_AT_PRE WCP 
    ON W.[TYPE] = WCP.WORKORDER_TYPE
    AND W.BASE_ID = WCP.WORKORDER_BASE_ID
    AND W.LOT_ID = WCP.WORKORDER_LOT_ID
    AND W.SPLIT_ID = WCP.WORKORDER_SPLIT_ID
    AND W.PART_ID = WCP.PART_ID
LEFT OUTER JOIN WO_CURRENTLY_AT WCA
    ON W.[TYPE] = WCA.WORKORDER_TYPE
    AND W.BASE_ID = WCA.WORKORDER_BASE_ID
    AND W.LOT_ID = WCA.WORKORDER_LOT_ID
    AND W.SPLIT_ID = WCA.WORKORDER_SPLIT_ID
    AND W.PART_ID = WCA.PART_ID
LEFT OUTER JOIN PART P 
    ON W.PART_ID=P.ID
WHERE w.SUB_ID = '0' 
    AND w.[STATUS] IN ('F', 'R' ,'U')
    AND w.[TYPE] = 'W' 
--    AND p.PLANNER_USER_ID IN ('609M','609MEO','KANBAN' ,'MRP' ,'NEW','PLAN' , 'TOOLING' , 'TTO')
    AND EXISTS
        (SELECT 1
        FROM LIVESupplemental.dbo.PLANNER_USER_ID_ReportSettings EX
        WHERE P.PLANNER_USER_ID = EX.PLANNER_USER_ID
            AND REPORT_NAME = '1_WO Status rev'
        )


```