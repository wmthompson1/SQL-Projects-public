# User Accounts SIDs

```sql
--SIDs need to match for Visual to recognize user during SSO.

SELECT * 
FROM sys.syslogins
WHERE name = 'MarkH#'

SELECT * 
FROM sys.sysusers
WHERE name = 'MarkH#' 

```