# System - user logins (Luke)

```sql
USE [crunch1120]
go

alter user [LUKEG#] with login = [LUKEG#]

/*
CHECK APPLICATION_USER
 'insert into application_user (name, is_buyer, is_planner....) 
 select name, is_buyer, is_planner... from crunch0615.dbo.application_user where name = 'MARCP'
*/
```