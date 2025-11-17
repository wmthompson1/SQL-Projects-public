# ResourceID and OperationType List for Dept

```sql
--declare @skillslocation as nvarchar(15)
--set @skillslocation = 'AP1'
--declare @resourceid as nvarchar(15)
--set @resourceid = 'p1f1-pnt-t

select sr.ID as resource_id, 
       sr.DESCRIPTION resdesc,
       case when sr.user_1 IS null then 'contractor'
           else sr.user_1
           end as skills_type,
      isnull(sr.user_2, '_blank') as department, 
      isnull(sr.user_3, '_blank') as sub_department,
      isnull(sr.user_4, '_blank') as supervisor,  
       pl.abbr2 AS LOCATION,
       sr.AFC_GL_ACCT_ID as glacct,
       sr.AUTO_REPORTING,
       ot.ID as optyp_ID, 
       ot.DESCRIPTION as optypedesc, 
       otb.specs, 
      scd.PRINT_, 
      scd.DESCRIPTION as certdesc  
  from shop_resource sr
  inner join livesupplemental.dbo.plant_names pl
  on sr.user_5 = pl.id
  left outer join OPERATION_TYPE ot
    on sr.id = ot.resource_id
   left outer join SKILLS_CERT_DESC scd
     on ot.id = scd.OP_TYPE
  left outer join dbo.SKILL_OP_TYPE_BINARY otb
    on otb.OPERATION_TYPE_ID = ot.id
 where sr.DESCRIPTION not like 'do not%'
  and (sr.status <> 'o'
    or sr.status is null)
    and sr.id in (@resourceID)
    and  pl.abbr2  in (@skillslocation)
    and isnull(sr.user_2, '_blank') in (@department)
    and isnull(sr.user_3, '_blank') in (@sub_department)
    and isnull(sr.user_4, '_blank') in (@supervisor)
 order by sr.ID, ot.id

```