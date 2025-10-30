Use
Live
go




Select
 AB.ACCT_PERIOD
, AB.ACCT_YEAR
, (sum(Inventory) / ((sum(COGS) + sum([A])) / (365 / 12))) as DIOH
, sum(AR) / ((Sum(Sales)) / (365 / 12)) as DSO
, (abs(sum(AP)) / ((sum(COGS) + sum([A])) / (365 / 12))) as DPO
,(sum(Inventory) / ((sum(COGS) + sum([A])) / (365 / 12))) + sum(AR) / ((Sum(Sales)) / (365 / 12)) - ((sum(COGS) + sum([A])) / (abs(sum(AP)) / (365 / 12))) as 'Cash Convergence Time'


from 
	(Select
AB.*
 ,case
when A.ID = '5' then AB.DEBIT_AMOUNT - AB.CREDIT_AMOUNT
else 0
end as COGS

, case
when A.ID = '6' then AB.DEBIT_AMOUNT - AB.CREDIT_AMOUNT
else 0
end as [A]

, case
when A.ID = '16' then AB.CURR_BALANCE
else 0
end as Inventory

, case
when A.ID = '4' then (AB.CREDIT_AMOUNT - AB.DEBIT_AMOUNT)
else 0
end as Sales

, case
when A.ID = '46' then (AB.CREDIT_AMOUNT - AB.DEBIT_AMOUNT)
else 0
end as [O]

, case
when A.ID = '13' then AB.CURR_BALANCE
else 0
end as AR

, case
when A.ID in ('200', '201', '205', '210', '211', '212', '215', '250', '257', '280', '285') then CURR_BALANCE
else 0
end as AP


From 
ACCOUNT A
	Inner Join ACCOUNT_BALANCE AB
		on A.ID = AB.ACCOUNT_ID
	Inner Join ACCOUNT_PERIOD AP
		on AP.ACCT_PERIOD = AB.ACCT_PERIOD
		and AP.ACCT_YEAR = AB.ACCT_YEAR

Where A.ID in ('200', '201', '205', '210', '211', '212', '215', '250', '257', '280', '285', '200', '201', '205', '210', '211', '212', '215', '250', '257', '280', '285','5', '6','16', '4', '13', '46')
and AB.ACCT_YEAR >= year(getdate())-1
and AP.END_DATE < getdate()

) AB
group by AB.ACCT_PERIOD
, AB.ACCT_YEAR

order by 
 AB.ACCT_YEAR
, AB.ACCT_PERIOD