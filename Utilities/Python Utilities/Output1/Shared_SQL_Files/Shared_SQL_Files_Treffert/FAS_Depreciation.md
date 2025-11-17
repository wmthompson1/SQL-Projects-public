# FAS_Depreciation

```sql
Use
LIVESupplemental
go



Select 
[Unique]
,[Description]
,[Acq Date]
,[Ending Cost] as 'Acquisition_Cost'
,Method
,Life
,[Depreciation Start]
,IIF("RunDate"<=[Depreciation Ending] ,0, ((([Depreciation Start] - "RunDate")/365)*12)) as 'Months Remaining'
,[Ending Cost] / (Life * 12) as 'Monthly_Depreciation'

,Case
	When (TotalAccumDepThru2020 = [Ending Cost] Then [Ending Cost]
	When (DateDiff(month,12/31/2020,"Run Date")*([Ending Cost] / (Life * 12)))+TotalAccumDepThru2020 )>= [Ending Cost] Then [Ending Cost]
	Else ((DateDiff(month,12/31/2020,"Run Date")*([Ending Cost] / (Life * 12)))+TotalAccumDepThru2020 ) End As 'Accumulated Depreciation'

,IIF("Accumulated Depreciation" = [Ending Cost], 0, ((((Life * 12)-IIF("RunDate"<=[Depreciation Ending] ,0, ((([Depreciation Start] - "RunDate")/365)*12)))*([Ending Cost] / (Life * 12)))-"Accumulated Depreciation") as Current Depreciation

,[Ending Cost] - ('Accumulated Depreciation' + 'Current Depreciation') as 'Remaining Cost' 






From FixedAssets
```