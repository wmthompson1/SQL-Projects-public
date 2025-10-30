use live 
go

/*
select transaction_id, type, class, qty, transaction_date from inventory_trans where part_id = '065Z0300-451' order by TRANSACTION_DATE, transaction_id
select * from [TRACE_INV_TRANS] where part_id = '065Z0300-451' order by trace_id
select * from [TRACE] where part_id = '065Z0300-451' order by create_date

select --*
	trace_id, it.transaction_id, transaction_date as RecvDate
from 
	inventory_trans it
inner join 
	[TRACE_INV_TRANS] tt 
		on it.transaction_id = tt.transaction_id
where class ='R'
 and it.part_id = '065Z0300-451' 

*/

drop table #traci

select it.part_id, trace_id, max(transaction_date) as RecvDate
into #traci
from 
	inventory_trans it
inner join 
	[TRACE_INV_TRANS] tt 
		on it.transaction_id = tt.transaction_id
where class ='R'
group by it.part_id, trace_id

--select * from #traci where part_id = '065Z0300-451' order by trace_id, transaction_id

drop table #titan

SELECT 
--	p.*, UDF.STRING_VAL
	P.ID AS part_id,
	p.description
into
	#titan
FROM 
	PART AS P 
left outer JOIN 
	USER_DEF_FIELDS AS UDF 
		ON P.ID = UDF.DOCUMENT_ID
		and UDF.ID = 'UDF-0000035' 
		AND UDF.STRING_VAL LIKE '%titan%'
where 
	(p.[description] LIKE '%titan%'
		or UDF.STRING_VAL LIKE '%titan%')
	AND P.PLANNER_USER_ID IN ('MRP','NEW','PLAN')
order by p.id

--select * from #titan

select 
--	* 
	it.PART_ID,
--	p.description,
	it.TRANSACTION_ID,
	tt.TRACE_ID,
	WORKORDER_BASE_ID,
	WORKORDER_LOT_ID,
	CUST_ORDER_ID,
	CUST_ORDER_LINE_NO,
	[TYPE],
	CLASS,
	case
		when class = 'R' and [type] = 'I'  then 'Receipt'
		when class = 'R' and [type] = 'O'  then 'RtnReceipt'
		when class = 'I' and [type] = 'O'  then 'Issued'
		when class = 'I' and [type] = 'I'  then 'Rtn Issue'
		when class = 'A' and [type] = 'I'  then 'AdjustIn'
		when class = 'A' and [type] = 'O'  then 'AdjustOut'
	end as [Event],
	tt.QTY as TTQty,
	--Balance = Sum(tt.QTY) OVER (ORDER BY it.part_id ROWS UNBOUNDED PRECEDING),
	convert(varchar(11),case
		when TRANSACTION_DATE < t.recvdate then TRANSACTION_DATE
		else t.recvdate
	end,101) as ReceivedDate,
	convert(varchar(11),TRANSACTION_DATE,101) as TransDate,
	case
		when class = 'A' then 0
		when TRANSACTION_DATE <= t.recvdate then 0
		else datediff(dd,recvdate,transaction_date)
	end as DaysInInv
from 
	inventory_trans it
inner join 
	[TRACE_INV_TRANS] tt 
		on it.transaction_id = tt.transaction_id
inner join
	#traci t
		on t.TRACE_ID = tt.TRACE_ID
inner join
	#titan p
		on it.part_ID = p.part_id
--where 
--	tt.part_id = '065Z0300-451'

order by 
	it.part_id,
	it.TRANSACTION_ID,
	tt.trace_id,
	it.transaction_date

