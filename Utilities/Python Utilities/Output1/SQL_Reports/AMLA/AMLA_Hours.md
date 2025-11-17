# AMLA_Hours

```sql

 --DECLARE @date1 DATE = '2025-09-08';
 --DECLARE @date2 DATE = getdate();

SELECT a.[FILE NUMBER], e.[First Name], ADP_HOURS_WORKED as 'ADP Hours', sum(b.Visual_Hours) as  'Visual Hours', 
a.CMP_DIRECT_HOURS as 'CMP Hours', convert(varchar(12), a.PAYDATE, 101) as 'Pay_Date'
FROM LIVESupplemental.dbo.ADP_DAILY_HOURS a with (nolock) inner join LIVESupplemental.dbo.ADP_EMP e on a.[FILE NUMBER] = e.[File Number]
LEFT JOIN ( select RIGHT('00000'+EMPLOYEE_ID, 6) as 'EMPLOYEE', sum(HOURS_WORKED) as 'Visual_Hours', convert(varchar(12), 
    transaction_date, 101) as 'Transact_Date' FROM LIVE.dbo.LABOR_TICKET (nolock) where transaction_date between @date1 and @date2 
    and WORKORDER_BASE_ID is not null and TYPE != 'I'
    group by EMPLOYEE_ID, transaction_date
) b on a.[FILE NUMBER] = b.EMPLOYEE and convert(varchar(12), a.PAYDATE, 101) = b.Transact_Date
where a.PAYDATE between @date1 and @date2
-- -- and a.[FILE NUMBER] in ('004559', '004560', '004561', '004562', '004565')
AND  a.[FILE NUMBER] in
('004654'
,'004642'
,'004650'
,'004644'
,'004648'
,'004647'
,'004643'
,'004657')
group by a.[FILE NUMBER], a.PAYDATE, ADP_HOURS_WORKED, a.CMP_DIRECT_HOURS, e.[First Name]
order by a.PAYDATE, a.[FILE NUMBER] asc

```