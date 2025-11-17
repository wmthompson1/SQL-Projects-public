# ResourceID and OperationType List

```sql
select 
    sr.ID as resource_id, 
    sr.DESCRIPTION resdesc,
    case when sr.skills_type IS null then 'contractor'
        else sr.skills_type 
        end as skills_type, 
        -- location of current operation
    CASE WHEN SR.SKILLS_TYPE IS NULL THEN 'Contractor'
        WHEN SR.SKILLS_TYPE = 'A' THEN 'Auburn North'
        WHEN SR.SKILLS_TYPE = 'M' THEN 'Auburn South'
        WHEN SR.SKILLS_TYPE = 'B' THEN 'Ballard'      
        WHEN SR.SKILLS_TYPE = 'O' THEN 'Business Solutions'    
        ELSE 'UNKNOWN' 
    END AS LOCATION,
    sr.AFC_GL_ACCT_ID as glacct,
    sr.AUTO_REPORTING,
    ot.ID as optyp_ID, 
    ot.DESCRIPTION as optypedesc, 
    CAST(CAST(otb.BITS AS VARBINARY(MAX)) AS NVARCHAR(MAX)) AS specs, 
    scd.PRINT_, 
    scd.DESCRIPTION as certdesc
FROM shop_resource sr
    LEFT JOIN OPERATION_TYPE ot
        ON sr.id = ot.resource_id
    LEFT JOIN SKILLS_CERT_DESC scd
        ON ot.id = scd.OP_TYPE
    LEFT JOIN dbo.OPER_TYPE_BINARY otb
        ON otb.OPERATION_TYPE_ID = ot.ID
            AND otb.SITE_ID = ot.SITE_ID
    --LEFT JOIN dbo.SKILL_OP_TYPE_BINARY otb
    --    ON otb.OPERATION_TYPE_ID = ot.id
    --        AND otb.SITE_
WHERE sr.DESCRIPTION not like 'do not%'
    and CASE WHEN SR.SKILLS_TYPE IS NULL THEN 'Contractor'
            WHEN SR.SKILLS_TYPE = 'A' THEN 'Auburn North'
                WHEN SR.SKILLS_TYPE = 'M' THEN 'Auburn South'
                WHEN SR.SKILLS_TYPE = 'B' THEN 'Ballard'      
                WHEN SR.SKILLS_TYPE = 'O' THEN 'Business Solutions'    
                ELSE 'UNKNOWN' 
            END   in (@skillslocation)
    and sr.id in (@resourceID)
order by sr.ID, ot.id

```