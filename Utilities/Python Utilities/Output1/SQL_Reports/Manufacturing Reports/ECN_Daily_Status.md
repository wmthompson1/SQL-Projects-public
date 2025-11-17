# ECN_Daily_Status

```sql
WITH CTE_TASK 
AS
(
SELECT T1.EC_ID,
       T1.SEQ_NO,
       T1.USER_ID,     
      T1.CREATE_DATE,
      CASE WHEN T1.SUB_TYPE = 'AT' THEN 'Assigned To'
           WHEN T1.SUB_TYPE = 'A'  THEN 'Authorization'
          WHEN T1.SUB_TYPE = 'I'  THEN 'Implementation'
          WHEN T1.SUB_TYPE = 'AP'  THEN 'Approval'
          WHEN T1.SUB_TYPE = 'H'  THEN 'On Hold'
          ELSE 'NOT IDENTIFIED'
          END AS SUB_TYPE_DEFINED,
       CASE WHEN T1.STATUS = 'P'    THEN 'Pending'
           WHEN T1.STATUS = 'R'    THEN 'On Hold'
           ELSE 'Not Identified'
       END AS TASK_STATUS_DEFINED, 
      T1.STATUS_EFF_DATE
 FROM TASK T1
 INNER JOIN 
 (
 SELECT T.EC_ID,  
        MIN(T.SEQ_NO) AS MIN_SEQ_NO,
        MIN(T.CREATE_DATE) AS MIN_CREATE_DATE
   FROM TASK T
   INNER JOIN EC 
   ON EC.ID = T.EC_ID
   AND EC.STATUS NOT IN ('X','C')
   WHERE T.TYPE = 'ECN'
   AND T.STATUS NOT IN ('X','C', 'R')
    GROUP BY T.EC_ID
      
 ) AS T2       
   ON  T1.EC_ID = T2.EC_ID 
  AND T1.CREATE_DATE = T2.MIN_CREATE_DATE 
  and T1.STATUS NOT IN ('X','C', 'R')
  )
  
SELECT EC.ID as ECN_ID, 
      EC.CREATE_DATE AS ECN_CREATE_DATE,
      CASE
         WHEN EC.STATUS = 'I'
         THEN 'In Process'
         WHEN EC.STATUS = 'H'
         THEN 'On Hold'
         WHEN EC.STATUS = 'P'
         THEN 'Pending'
         WHEN EC.STATUS = 'U'
         THEN 'Undefined'
         ELSE 'NOT IDENDIFIED'
      END AS   EC_STATUS_DEFINED, 
       T.USER_ID,
      T.SUB_TYPE_DEFINED,
      T.CREATE_DATE AS TASK_CREATE_DATE,
      ECL.LINE_NO, 
      ECL.TYPE, 
      COALESCE(ECL.WO_BASE_ID, ECL.PART_ID, ECL.DOC_ID) AS ID,
      PSV.PLANNER_USER_ID -- MAY BE NULL IF BASE_ID IS A CLOSED WORK ORDER
FROM EC_LINE ECL
    INNER JOIN EC
       ON ECL.EC_ID = EC.ID
       AND EC.STATUS NOT IN ('C', 'X')
    INNER JOIN CTE_TASK T
    ON EC.ID = T.EC_ID 
    LEFT OUTER JOIN WORK_ORDER WO
       ON ECL.WO_TYPE = WO.TYPE
         AND ECL.WO_BASE_ID = WO.BASE_ID
         AND ECL.WO_LOT_ID = WO.LOT_ID
         AND ECL.WO_SPLIT_ID = WO.SPLIT_ID
         and WO.STATUS NOT IN ('C', 'X')
    LEFT OUTER JOIN PART_SITE_VIEW PSV
       ON WO.PART_ID = PSV.PART_ID

```