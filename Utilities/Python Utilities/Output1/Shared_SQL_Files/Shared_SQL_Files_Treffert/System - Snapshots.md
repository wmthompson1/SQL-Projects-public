# System - Snapshots

```sql
--snapshots for datawarehouse resync

CREATE DATABASE VisualProdTmpSnp ON  
( NAME = LIVE_Data, FILENAME =   
'E:\SQLDATA\VisualProd.ss'),  
( NAME = LIVE2_Data, FILENAME =   
'E:\SQLDATA\VisualProd2.ss.ss')
AS SNAPSHOT OF LIVE;  


CREATE DATABASE IQMProdTmpSnp ON  
( NAME = IQM_Baseline_App, FILENAME =   
'E:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\IQMProd.ss'),  
( NAME = IQM_Baseline_cdc, FILENAME =   
'E:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\IQMProd2.ss.ss')
AS SNAPSHOT OF IQM_Baseline_App;  

```