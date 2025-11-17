# Audit Manager___Tablix2

```sql
SELECT am.AUDIT_MANAGER_ID, af.FINDING_ID, af.FINDING_TYPE, af.FINDING_TEXT, af.CLOSED_DATE FindingClosedDate, af.CreatedBy FindingCreatedBy, af.CreateDate FindingCreateDate, af.FOLLOWUP_TEXT
    , afE.EMPLOYEE_ID AS FindingFollowUpEMPID, afE.NAME_1 AS FindingFollowUpName, afE.WORK_EMAIL_ADDRESS AS FindingFollowUpEmail 
    , af.SK_PROC_AUDIT_ID
FROM VQ_AUDIT_FINDINGS af
    LEFT JOIN VQ_AUDIT_MANAGER am
        ON af.AUDIT_REC_ID = am.RECORD_ID
            AND SK_PROC_AUDIT_ID IS NULL
            AND SK_PROD_AUDIT_ID IS NULL
            AND SK_DOC_AUDIT_ID IS NULL
    LEFT JOIN VQ_EMPLOYEE afE
        ON af.FOLLOWUP_BY_REC_ID = afE.RECORD_ID
WHERE am.AUDIT_MANAGER_ID = @AUDIT_MANAGER_ID
    AND am.SITE_ID = @SITE_ID

```