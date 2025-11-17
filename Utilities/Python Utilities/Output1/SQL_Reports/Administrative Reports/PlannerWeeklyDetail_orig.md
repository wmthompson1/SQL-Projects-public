# PlannerWeeklyDetail_orig

```sql
-- Visual Enterprise Reports/Administrative Reports/PlannerWeeklyDetail_orig

SELECT DISTINCT 
       Case when substring(W.ENGINEERED_BY,CHARINDEX ( p.Filter_String ,W.ENGINEERED_BY),LEN(W.ENGINEERED_BY)) = p.Filter_String  then p.location 
           else 'zNo Initials' end as location,
     p.Line_of_Business,
       Case when substring(W.ENGINEERED_BY,CHARINDEX (p.Filter_String  ,W.ENGINEERED_BY),LEN(W.ENGINEERED_BY)) = p.Filter_String  then p.name 
       when substring(W.ENGINEERED_BY,CHARINDEX (p.Filter_String ,W.ENGINEERED_BY),LEN(W.ENGINEERED_BY)) IS null then 'No Initials'
            end as name,
      W.BASE_ID,
      CONVERT(DATE,W.CREATE_DATE,101) AS CREATEDATE, 
      W.ENGINEERED_BY
 FROM   LIVE.dbo.WORK_ORDER W
 left outer join LiveSupplemental.dbo.Planners p
 on      substring(W.ENGINEERED_BY,CHARINDEX ( p.Filter_String  ,W.ENGINEERED_BY),LEN(W.ENGINEERED_BY)) = p.Filter_String 
 --on ENGINEERED_BY like p.Filter_String 
  WHERE  w.SUB_ID='0' 
    AND w.TYPE='W' 
    AND w.create_date between CONVERT(DATETIME, @week_begin_date, 102)
    AND CONVERT(DATETIME, @week_end_date, 102)
    --AND Case when substring(W.ENGINEERED_BY,CHARINDEX ( p.Filter_String ,W.ENGINEERED_BY),LEN(W.ENGINEERED_BY)) = p.Filter_String 
   --   then p.location end IN (@location)
    AND (p.Line_of_Business in (@line_of_business)or p.line_of_business is null)
     ORDER BY 1,2, 3,5,4

```