# ECN_Approval_Progress

```sql
SELECT EGU.EC_ID,
      T.SEQ_NO,
      EGU.USER_ID,
      T.STATUS,
      EGU.GROUP_TYPE,
      CASE WHEN  EGU.GROUP_TYPE = 'AT'
           THEN 'Assigned To'
          WHEN  EGU.GROUP_TYPE= 'A'
          THEN 'Authorization'
          WHEN  EGU.GROUP_TYPE = 'I'
          THEN 'Implementation'
          WHEN  EGU.GROUP_TYPE= 'AP'
          THEN 'Approval'
          ELSE 'Not identified'
          END as GROUP_TYPE_DESC,
      T.COMPLETED_DATE,
      EGU.CREATE_DATE, 
      EGU.IS_LEADER, 
      EGU.USER_SIGNOFF
FROM  EC_GROUP_USER EGU 
 LEFT OUTER JOIN  TASK T
   ON EGU.EC_ID = T.EC_ID
   AND EGU.GROUP_TYPE = T.SUB_TYPE
   AND EGU.USER_ID = T.USER_ID 
WHERE  EGU.EC_ID =@ec_id


```