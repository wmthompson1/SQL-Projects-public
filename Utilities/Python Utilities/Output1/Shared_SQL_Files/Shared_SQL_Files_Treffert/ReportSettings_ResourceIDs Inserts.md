# ReportSettings_ResourceIDs Inserts

```sql
SELECT *  --[Resource_ID] AS Resource, [Report_Name], [Report_Section], [Reasoning], [Notes], [Include]
FROM [SQL-BI-1].LIVESupplemental.dbo.[ResourceID_ReportSettings] 
WHERE Report_Name = 'traveller'
AND RESOURCE_ID in ('P2M1-REVIEW', 'P2M1-FREEZER', 'progc')

/*
--> no barcode and no qty or date fields
-- also check the OVD table for the Operation_Type labels

insert into [SQL-BI-1].LIVESupplemental.dbo.[ResourceID_ReportSettings] values ('P2M1-FREEZER','traveller','barcode_review','hide barcode','inclusion - tlt 1/11/2021','1')
insert into [SQL-BI-1].LIVESupplemental.dbo.[ResourceID_ReportSettings] values ('P2M1-FREEZER','traveller','QTY_OUT','hide qty-OUT fields','exclusion - tlt 1/11/2021','0')
*/
```