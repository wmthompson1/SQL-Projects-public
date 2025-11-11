# Mfg Planning Queue slides On Hold

```sql
SELECT TOP 15 CASE
               WHEN WO.STATUS = 'U'
               THEN 'ON HOLD'
            END AS WAITINGFOR,
            WO.PART_ID,
            WO.BASE_ID,
            P.PLANNER_USER_ID,
            WO.DESIRED_RLS_DATE,
            WO.DESIRED_WANT_DATE,
            REPLACE(REPLACE(CONVERT( VARCHAR,A.CREATE_DATE,100)+' '+CAST(CAST(A.NOTE AS VARBINARY(MAX)) AS NVARCHAR(MAX)),CHAR(10),' '),CHAR(13),' ') AS WONOTEALL
FROM          WORK_ORDER AS WO
            INNER JOIN OPERATION O
              ON WO.TYPE = O.WORKORDER_TYPE
                AND WO.BASE_ID = O.WORKORDER_BASE_ID
                AND WO.LOT_ID = O.WORKORDER_LOT_ID
                AND WO.SUB_ID = O.WORKORDER_SUB_ID
                AND WO.SPLIT_ID = O.WORKORDER_SPLIT_ID
                AND O.OPERATION_TYPE NOT IN('QP-NI','QP-REVIEW')
            INNER JOIN PART P
              ON WO.PART_ID = P.ID
            LEFT OUTER JOIN
(
    SELECT    N.*
    FROM      NOTATION N
            JOIN
    (
       SELECT N.OWNER_ID,
            MAX(CREATE_DATE) AS MAXDATE
       FROM   NOTATION N
       WHERE  TYPE = 'E'
       GROUP BY N.OWNER_ID
    ) NMAX
              ON NMAX.OWNER_ID = N.OWNER_ID
                AND NMAX.MAXDATE = N.CREATE_DATE
) AS A
              ON A.OWNER_ID = WO.BASE_ID+'/'+WO.LOT_ID
WHERE WO.STATUS = 'U'
     AND WO.TYPE = 'W'
--CASE WHEN WO.STATUS = 'U' THEN 'ON HOLD' END = 'ON HOLD'
group by 
    CASE WHEN WO.STATUS = 'U' THEN 'ON HOLD' END
    , WO.PART_ID
    , WO.BASE_ID
    , P.PLANNER_USER_ID
    , WO.DESIRED_RLS_DATE
    , WO.DESIRED_WANT_DATE
    , replace(replace(CONVERT(VARCHAR, a.create_date, 100)+' '+CAST(CAST(a.note AS VARBINARY(max)) AS NVARCHAR(max)),char(10),' '),char(13),' ')
ORDER BY WO.DESIRED_WANT_DATE

```