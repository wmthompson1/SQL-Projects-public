# IQM NCM Report

```sql
use SANDBOX_Baseline_App
go

select * from VQ_NONCONFORMANCE
SK_NCM_PROCESS
SK_NCM_SUBPROCESS
VQ_AUDIT_NCM
VQ_NCM_CHARACTER
VQ_NCM_CORRECT_LINK
VQ_NCM_DIS_APV
VQ_NCM_TYPE
select * from VQ_NCM_UD1 -- process mfg
select * from VQ_NCM_UD2 -- subprocess mfg
select * from VQ_NCM_UD3 -- feature mfg
select * from VQ_NCM_UD4 -- defect mfg
select * from VQ_NCM_UD5 -- process fin
select * from VQ_NCM_UD6 -- subprocess fin
select * from VQ_NCM_UD7 -- defect FIN -- no features for FIN


```