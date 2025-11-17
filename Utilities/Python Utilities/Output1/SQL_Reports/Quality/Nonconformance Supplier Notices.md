# Nonconformance Supplier Notices

```sql
--> Home > Quality > Nonconformance Supplier Notices 
SELECT NCM.NCM_ID
    , NCM.NCM_TYPE
    , NCM.[STATUS]
    , NCM.[SUBJECT]
    , NCM.SK_SUPPLIER_NOTICE_SENT
    , CASE 
        WHEN NCM.SK_SUPPLIER_NOTICE_SENT = 1 THEN 'YES'
        ELSE 'NO'
    END AS NOTICE_SENT
    , S.[NAME] AS SUPPLIERNAME
    , 'http://sql-iqm-9.skillsinc.local/ClientDeploy/mongoose.application?Form=vqNonconformance(FILTER(EntityID=''' + NCM.[ENTITY_ID]
        + '''%20and%20SiteID=''' + NCM.SITE_ID + '''%20and%20NonconformanceID=''' + NCM.NCM_ID + ''')SETVARVALUES(InitialCommand=Refresh))&Config='
        + CASE WHEN DB_NAME() = 'SANDBOX_Baseline_app' THEN 'SANDBOX' ELSE 'IQMSKI' END AS ClientDeployLink
FROM VQ_NONCONFORMANCE NCM
LEFT JOIN VQ_SUPPLIER S
    ON NCM.REPORTED_BY_SUPP_REC_ID = S.RECORD_ID
WHERE CASE 
        WHEN ISNULL(NCM.SK_SUPPLIER_NOTICE_SENT, '0') = '0' THEN 'NOT SENT'
        WHEN NCM.SK_SUPPLIER_NOTICE_SENT = '1' THEN 'SENT'
    END IN (@SENT)
    AND NCM.NCM_TYPE IN (@TYPE)
    AND NCM.[STATUS] IN (@STATUS)

```