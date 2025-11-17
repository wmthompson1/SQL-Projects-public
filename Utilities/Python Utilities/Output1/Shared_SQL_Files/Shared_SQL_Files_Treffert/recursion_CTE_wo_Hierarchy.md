# recursion_CTE_wo_Hierarchy

```sql
DECLARE @LEVEL AS INT
SET @LEVEL = 0    

USE LIVE
GO
WITH FAMILY (BASE_ID,
             LOT_ID,
             SPLIT_ID,
             SUB_ID, 
             DESIRED_QTY, 
             Parent_PART_ID,
             Child_PART_ID,
             Level)
 AS 
 (
-- Anchor member definition 
    SELECT 
           W1.BASE_ID,
           W1.LOT_ID,
           W1.SPLIT_ID,
           W1.SUB_ID,
           w1.DESIRED_QTY, 
           W1.PART_ID AS Parent_Part_ID,
           W1.PART_ID AS Child_Part_ID,
           0 AS Level
      FROM dbo.work_order AS w1
     WHERE W1.TYPE = 'W'
       AND W1.SUB_ID = 0
       AND W1.BASE_ID = '1327884'
  -- Recursive member definition     
    UNION ALL       
    SELECT 
           W2.BASE_ID,
           W2.LOT_ID,
           W2.SPLIT_ID,
           W2.SUB_ID, 
           w2.DESIRED_QTY, 
           p.Parent_Part_ID,
           w2.PART_ID AS Child_Part_ID,
           Level + 1 as Level
      FROM dbo.work_order AS w2
     inner join family as p
       on w2.base_id  = p.BASE_ID
      and w2.lot_id   = p.lot_id
      and w2.SPLIT_ID = p.SPLIT_ID 
    WHERE W2.TYPE = 'W'
     and w2.SUB_ID = Level 
     and W2.BASE_ID = '1327884'

)
-- Statement that executes the CTE
SELECT BASE_ID,
             LOT_ID,
             SPLIT_ID,
             SUB_ID,
             DESIRED_QTY,  
             Parent_PART_ID,
             Child_PART_ID,
             Level
  FROM FAMILY
  where Level <> 0
  --ORDER BY 
 OPTION (MAXRECURSION 0);
 
```