# PPD - ResourceIDs Updates

```sql
use livesupplemental
go

select *
from ResourceID_Assignments
--where resource_id in ('AUB-tube', 'AUB-verify', 'BAL-cert', 'BAL-FINALinsp', 'BAL-insp', 'BAL-MFGinsp', 'BAL-polish', 'BAL-tube', 'BAL-verify', 'Clean', 'CMM', 'FAI', 'insp', 'SouthAUB-Final', 'SouthAUB-verify')


--UPDATE ResourceID_Assignments
--SET PPD_Process = 'Inspection'
--WHERE resource_id in ('AUB-verify', 'BAL-FINALinsp', 'BAL-insp', 'BAL-MFGinsp', 'BAL-verify', 'CMM', 'FAI', 'insp', 'SouthAUB-Final', 'SouthAUB-verify');

--UPDATE ResourceID_Assignments
--SET PPD_Process = 'Chemical Processing'
--WHERE resource_id in ('AUB-tube', 'Clean');

--UPDATE ResourceID_Assignments
--SET PPD_Process = 'Certification'
--WHERE resource_id = 'BAL-cert';

--UPDATE ResourceID_Assignments
--SET PPD_Process = 'Paint'
--WHERE resource_id = 'BAL-tube';

--UPDATE ResourceID_Assignments
--SET PPD_Process = 'Polish/Buffing'
--WHERE resource_id = 'BAL-polish';

select *
from ResourceID_Assignments

```