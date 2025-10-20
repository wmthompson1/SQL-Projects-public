SELECT am.SITE_ID
    , am.AUDIT_MANAGER_ID
    , am.AUDIT_ID
    , am.STANDARD
    , am.SUBJECT
    , am.SCHEDULED_DATE
    , am.SK_DUE_DATE
    , laE.NAME_1 AS LeadAuditorName
    , aaE1.NAME_1 AS AsstAuditor1Name
               , am.COMPLETION_DATE 
    , am.BUSINESS_UNIT_ID 
    , SCORE = CAST(am.SCORE AS INTEGER)
    , f.FINDING_ID 
    , c.CORRECTIVE_ID
    , RowNumber = ROW_NUMBER() OVER (PARTITION BY am.SITE_ID, am.AUDIT_ID, am.AUDIT_MANAGER_ID
                    , am.STANDARD, am.SUBJECT, am.SCHEDULED_DATE, am.SCORE, am.SK_DUE_DATE
                    , laE.NAME_1 , aaE1.NAME_1 ORDER BY am.AUDIT_MANAGER_ID)
    , Status = CASE WHEN am.COMPLETION_DATE > am.SK_DUE_DATE THEN 'LATE' WHEN am.COMPLETION_DATE = am.SK_DUE_DATE THEN 'ON TIME' 
                WHEN am.COMPLETION_DATE < am.SK_DUE_DATE  THEN 'EARLY'  ELSE 'SCHEDULED' END
, ImprovementRequired = CASE WHEN  am.SCORE = 0 THEN 'Major'
                WHEN am.SCORE = 2 THEN 'Minor'
                WHEN am.SCORE = 4 THEN 'Process is Strong' 
                WHEN  am.SCORE IS NULL THEN 'Audit not completed yet' END
FROM VQ_AUDIT_MANAGER am
LEFT JOIN VQ_EMPLOYEE laE
    ON laE.RECORD_ID = am.LEAD_AUDITOR_REC_ID
LEFT JOIN VQ_EMPLOYEE aaE1
    ON aaE1.RECORD_ID = am.ASST_AUDITOR1_REC_ID
LEFT JOIN [VQ_AUDIT_FINDINGS] f (NOLOCK)
                 ON am.RECORD_ID = f.AUDIT_REC_ID
LEFT JOIN [VQ_CORRECTIVE] c (NOLOCK)
                 ON f.SK_CORRECTIVE_ID = c.CORRECTIVE_ID
WHERE am.SITE_ID = 'SK01'--@SITE_ID
    AND (am.SCHEDULED_DATE >= @STARTDATE
             AND am.SCHEDULED_DATE <= @ENDDATE)
                   --AND STANDARD IN ('EXT. Northrop Grumman GSS5300/90066231', 'AS9100.4, 5, 6, 9.1, AND 9.3')
