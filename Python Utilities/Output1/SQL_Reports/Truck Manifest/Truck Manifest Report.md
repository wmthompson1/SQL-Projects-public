# Truck Manifest Report

```sql
select DATENAME(weekday,(tm.BatchDate)) as wkday,
       case when tm.BatchDate 
               between convert(varchar, convert(varchar, getdate()-1, 101) + ' 12:00:00.000 PM',113) 
               and convert(varchar, convert(varchar, getdate(), 101) + ' 7:00:00.000 aM',113)                   
          then 'night truck'
          else 'morning truck'
          end as truck,  
       ml.PACKLIST_ID, 
       case 
            when e.DEPARTMENT_ID like '100%' Then 'Auburn South'
            when e.DEPARTMENT_ID like '300%' Then 'Auburn North'
            when e.DEPARTMENT_ID like '400%' Then 'Ballard' 
            when e.DEPARTMENT_ID like '400%' Then 'Business Solutions'   
            else 'Unknown' end as FromLoc,
       ml.MANIFEST_ID, 
       tm.EMPLOYEE_ID,
       e.FIRST_NAME + ' ' + LAST_NAME as EMPNAME, 
       tm.BatchDate,
       cl.CUST_order_id,
       cl.PART_ID,
       co.CUSTOMER_ID,
       CO.CUSTOMER_PO_REF,
       CL.CUSTOMER_PART_ID,
       CL.MISC_REFERENCE, 
       C.NAME, 
       SL.SHIPPED_QTY
  from LIVESupplemental.dbo.Truck_Manifest_Packlists ml
  left outer join LIVESupplemental.dbo.Truck_Manifest tm
    on tm.rowid = ml.MANIFEST_ID
  left outer join live.dbo.shipper_line sl
    on sl.packlist_id = ml.PACKLIST_ID
  left outer join live.dbo.CUST_ORDER_LINE cl
    on cl.CUST_ORDER_ID = sl.CUST_ORDER_ID
   and cl.LINE_NO       = sl.cust_order_line_no
  left outer join live.dbo.CUSTOMER_ORDER co
    on co.ID   = cl.CUST_ORDER_ID
  left outer join live.dbo.CUSTOMER c
    on c.ID             = co.CUSTOMER_ID
  left outer join live.dbo.EMPLOYEE e
  on e.ID = tm.EMPLOYEE_ID
where (PART_ID is not null
and c.id in (@Customer_ID)
and  ml.MANIFEST_ID in (@Manifest)
and (tm.BatchDate >= @StartDate and 
tm.BatchDate <= @EndDate)
--and tm.EMPLOYEE_ID in (@employee_id)
and e.FIRST_NAME + ' ' + LAST_NAME in (@empname)
and CO.CUSTOMER_PO_REF in (@cust_po_ref)
and SL.SHIPPED_QTY <> 0)
ORDER BY tm.BatchDate

```