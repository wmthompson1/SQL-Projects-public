# Drop User

```sql
USE LIVE
GO
DROP SCHEMA johnb
DROP USER johnb
DROP USER johnb#
DELETE FROM APPLICATION_USER WHERE NAME = 'johnb'
GO

USE master
GO
IF  EXISTS(SELECT * FROM sys.server_principals WHERE name =N'johnb#')
DROP LOGIN johnb#
GO
IF  EXISTS(SELECT * FROM sys.server_principals WHERE name =N'johnb')
DROP LOGIN johnb
GO

```