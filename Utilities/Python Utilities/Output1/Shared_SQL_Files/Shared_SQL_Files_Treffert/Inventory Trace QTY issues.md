# Inventory Trace QTY issues

```sql
use datawarehouse
go

select p.id
	, p.[DESCRIPTION]
	, pl.WAREHOUSE_ID
	, pl.location_ID
	, pl.QTY as PartLoc
	, p.QTY_ON_HAND as Part
	, ps.QTY_ON_HAND as PartSite
	, l.qty as LocQty
	, t.traceqty
from part p
left outer join part_site ps
	on p.id = ps.part_id
left outer join
	(select part_id
	, warehouse_ID
	, location_ID
	, sum(qty) as QTY
	from part_location pl
	--where qty <> 0
	group by part_id
	, warehouse_ID
	, location_ID
	) pl
	on p.id = pl.part_id
left outer join
	(select part_id
	, sum(qty) as QTY
	from part_location pl
	where qty <> 0
	group by part_id
	) l
	on p.id = l.part_id
left outer join 
	(select 
		part_ID, 
		sum(IN_QTY) - sum(OUT_QTY) as TraceQTY
	from trace t
	group by part_id
	) t
	on p.id = t.part_id
--left outer join
--	part_location l
--	on p.id = l.part_id
where 
(	p.qty_on_hand <> ps.qty_on_hand
	or p.qty_on_hand <> l.qty
	or 	l.qty <> ps.qty_on_hand
	or 	p.qty_on_hand <> t.traceqty
	or 	ps.qty_on_hand <> t.traceqty
)
-- p.id = '143T5352-30'
order by p.id
--select * from part_location where part_id = '143T5352-30'

--select * from part where id = '143T5352-27'
--select * from part_site where part_id = '143T5352-27'
--select * from part_location where part_id = '145T1059-1'

select --*
	t.part_id
	, t.id
	, in_qty
	, out_qty
	, in_qty - out_qty as total
	, sum(i.qty) ITQty
from trace t
inner join trace_inv_trans i
on t.id = i.trace_id
and t.part_id = i.part_id
where t.part_id in ('140T2522-285', '143T5352-27', '143T5352-28', '146T0395-159', '149A7590-8', '182T7120-5', '20240C-050', '20243C-063 PVC2', '20243E-32003', '20248R-0175', '232A4443-5', '272T4586-11', '287W4317-54', '3043-01', '343A9121-15', '401U3503-1273 CFM', '417T6511-1', '421W1189-12B', '453W3432-1', '60134B-063 36 X 48', '60134B-080-TRN', '60616B-160', '65B26315-928', '6AL4V-040-MIL', '6AL4V-080', '70750B-090', '70756B-125X2.40X119.4', '70756E-71303', '70757E-30601', '70757E-610024-MIL-NG', '70757E-9100274', '70757P-0375x1.8x2.0', '7150T77511-BAC1517-2864 CMP', 'BACB28AV04A012ZG', 'BACN10JZ3B2', 'BACN10XP1', 'BACR15BA3AD4C', 'BACR15BA5AD11C', 'BACR15BB4AD4R5C', 'BACR15CE4D4R5', 'BACS40R006E036F')
group by 
	t.id
	, t.part_id
	, in_qty
	, out_qty
	, in_qty - out_qty
having
	in_qty - out_qty <> sum(i.qty)
--	or in_qty <= 0
	or out_qty < 0
	or in_qty < out_qty
order by 
	t.id
	, t.part_id
	, in_qty
	, out_qty
	, in_qty - out_qty


/*
DECLARE @partid nvarchar(30) = '7150T77511-BAC1517-2864 CMP',
		@traceid nvarchar(30);

use DATAWAREHOUSE
go

select 
	a.id
	, a.part_id
	, in_qty
	, out_qty
	, in_qty - out_qty
	, t.* 
	, case
		when Type = 'I' and Class = 'R' then 'Receipt'
		when Type = 'O' and Class = 'I' then 'Issue'
		when Type = 'O' and Class = 'A' then 'Adjust Out'
		when Type = 'I' and Class = 'A' then 'Adjust In'
		when Type = 'I' and Class = 'I' then 'Return Issue'
		when Type = 'O' and Class = 'R' then 'Return Receipt'
		else 'Fix'
	end as XctType
	, [type]
	, class
	, i.qty
	, I.WORKORDER_BASE_ID
	, I.WORKORDER_LOT_ID
	, I.WORKORDER_SPLIT_ID
	, I.WORKORDER_SUB_ID
	, I.CUST_ORDER_ID
	, I.CUST_ORDER_LINE_NO
	, I.PURC_ORDER_ID
	, I.PURC_ORDER_LINE_NO
	, i.[USER_ID]
	, i.TRANSACTION_DATE
	, warehouse_id
	, location_id
from trace_inv_trans t
inner join trace a
on t.trace_id = a.id
and t.part_id = a.part_id
inner join inventory_trans i
on t.transaction_id = i.transaction_id
and t.part_id = i.part_id
where 
--t.part_id in ('140T2522-285', '143T5352-27', '143T5352-28', '146T0395-159', '149A7590-8', '182T7120-5', '20240C-050', '20243C-063 PVC2', '20243E-32003', '20248R-0175', '232A4443-5', '272T4586-11', '287W4317-54', '3043-01', '343A9121-15', '401U3503-1273 CFM', '417T6511-1', '421W1189-12B', '453W3432-1', '60134B-063 36 X 48', '60134B-080-TRN', '60616B-160', '65B26315-928', '6AL4V-040-MIL', '6AL4V-080', '70750B-090', '70756B-125X2.40X119.4', '70756E-71303', '70757E-30601', '70757E-610024-MIL-NG', '70757E-9100274', '70757P-0375x1.8x2.0', '7150T77511-BAC1517-2864 CMP', 'BACB28AV04A012ZG', 'BACN10JZ3B2', 'BACN10XP1', 'BACR15BA3AD4C', 'BACR15BA5AD11C', 'BACR15BB4AD4R5C', 'BACR15CE4D4R5', 'BACS40R006E036F')
t.part_id = '301QS-063 24 X 36'
--	and trace_id = @traceid 
order by t.transaction_id



select * from trace_inv_trans where transaction_ID in ('2251295', '2140058')
select * from INVENTORY_TRANS where transaction_ID in ('2251295', '2140058')

select * from trace where id = '100231/1'
select * from trace_inv_trans where trace_id = '100231/1'

--	and type = 'I' and class = 'R'



select * from trace_inv_trans where transaction_ID in ('1157641', '1157642', '1160677', '1160678', '1402348', '1402349')
select * from INVENTORY_TRANS where transaction_ID in ('1157641', '1157642', '1160677', '1160678', '1402348', '1402349')


select 
	p.id
	, p.[description]
	, warehouse_id
	, location_id
from part p
inner join part_location l
on p.id = l.part_id
where id in ('272T4586-11', '140T2522-285', '146T0395-159', '143T5352-28')
and warehouse_id <> '1'




Type = I & Class = R ==> Receipt
Type = O & Class = I ==> Issue

select * from INVENTORY_TRANS where TRANSACTION_ID in ('1157641', '1157642', '1160677', '1160678', '1163070', '1163071', '1177118', '1177119')
	and type = 'I' and class = 'R'


--> set up as monitor
select * 
from trace_inv_trans t
inner join INVENTORY_TRANS i
on t.TRANSACTION_ID = i.TRANSACTION_ID
where i.transaction_date >= '1/1/2014'
	and ((t.qty < 0
	and i.[type] = 'I' 
	and i.class = 'R')
	or  (t.qty > 0
	and i.[type] = 'O' 
	and i.class = 'I'))


select * from TRACE_INV_TRANS where TRANSACTION_ID = '863869'
select * from INVENTORY_TRANS where TRANSACTION_ID = '863869'

select id, [description], commodity_code, * from part where id in ('149A7590-8', '287W4317-54', '421W1189-11B', '421W1189-12B', '421W1189-5B', '421W1189-6B', '65B26315-928')


*/
/*  research
use live
go

select * from trace where part_id = 'MS20470B4-9'

select * from trace where id = '1175468/1/0'

select * from trace_inv_trans where trace_id like '1175468/1/0'

select *
	--p.id
	--, p.[DESCRIPTION]
	--, pl.WAREHOUSE_ID
	--, pl.location_ID
	--, pl.QTY as PartLoc
	--, p.QTY_ON_HAND as Part
	--, ps.QTY_ON_HAND as PartSite
	--, l.qty as LocQty
	--, t.traceqty
from part p
left outer join part_site ps
	on p.id = ps.part_id
left outer join part_location pl
	on p.id = pl.part_id
left outer join trace t
	on p.id = t.part_id
where 
--(	p.qty_on_hand <> ps.qty_on_hand
--	or p.qty_on_hand <> l.qty
--	or 	l.qty <> ps.qty_on_hand
--	or 	p.qty_on_hand <> t.traceqty
--	or 	ps.qty_on_hand <> t.traceqty
--)
p.id = '69B82032-24'
order by p.id
--select * from part_location where part_id = '69B82032-24'

--select * from part where id = '143T5352-27'
--select * from part_site where part_id = '143T5352-27'
--select * from part_location where part_id = '145T1059-1'

update trace set in_qty = 0, out_qty = 0 where id = '1017065/1'
update trace set in_qty = 10, out_qty = 9 where id = '99755/1'

update trace set in_qty = 100, out_qty = 100 where id = '70831/2'
update trace set in_qty = 100, out_qty = 100 where id = '99098/1'
update trace set in_qty = 1108, out_qty = 1108 where id = '76781/1'
update trace set in_qty = 1875, out_qty = 185 where id = '77099/1'
update trace set in_qty = 300, out_qty = 300 where id = '82077/2'
update trace set in_qty = 505, out_qty = 505 where id = '77837/1'
update trace set in_qty = 76, out_qty = 76 where id = '69292/2'

update trace set in_qty = 55, out_qty = 55 where id = '87152/1'

update trace set in_qty = 26, out_qty = 26 where id = '104645/1'
update trace set in_qty = 35, out_qty = 35 where id = '107091/1'
update trace set in_qty = 40, out_qty = 40 where id = '77991/2'
update trace set in_qty = 55, out_qty = 55 where id = '87152/1'

update trace set in_qty = 6, out_qty = 6 where id = '1171618/1/0'
update trace set in_qty = 7, out_qty = 7 where id = '1175468/1/0'

update part 
set qty_on_hand = 4
where id = '143T5352-28'

update part 
set qty_on_hand = 1
where id = '143T5352-27'

update trace set in_qty = 1233, out_qty = 1233 where id = '55784/1'

-- 1/30/2018
update trace set in_qty = 5, out_qty = 5 where id = '101904/1'
update trace set in_qty = 5, out_qty = 5 where id = '101904/3'

update trace set in_qty = 24, out_qty = 24 where id = '25484/3'

update trace set in_qty = 100, out_qty = 55 where id = '97556/1'

update trace set in_qty = 354, out_qty = 0 where id = '78605/1'
update trace set in_qty = 0, out_qty = 0 where id = '78605/1' and part_id = 'BACN10JY3'

update trace set in_qty = 0, out_qty = 0 where id = '78605/1' and part_id = 'BACN10JY3'

update trace set in_qty = 549, out_qty = 549 where id = '57527/1' and part_id = 'BACR15FT6KE8C'

update trace set in_qty = 538, out_qty = 179 where id = '94414/1' and part_id = 'BACR15BB6D7C'

update trace set in_qty = 257, out_qty = 80 where id = '77837/2' and part_id = 'BACR15CE6M6R5'

update trace set in_qty = 941, out_qty = 9 where id = '64602/1' and part_id = 'BACR15DN5AD5R5'
update trace set in_qty = 946, out_qty = 0 where id = '68341/1' and part_id = 'BACR15DN5AD5R5'

update trace set in_qty = 81, out_qty = 31 where id = '106508/1' and part_id = '20240C-050'

update trace set in_qty = 24, out_qty = 24 where id = '89659/2' and part_id = '60616P-.375 X 16.31 X 21.50'

-- 1/31/2018
update trace set in_qty = 1, out_qty = 1 where id = '002758613' and part_id = '453A1610-82'
update trace set in_qty = 1, out_qty = 1 where id = '002792203' and part_id = '453A1610-20'

--2/1/2018
update trace set in_qty = 35, out_qty = 0 where id = '107091/1' and part_id = 'BACB20VH11A01'
update trace set in_qty = 26, out_qty = 0 where id = '104645/1' and part_id = 'BACB20VH11A01'

--2/2/2018
update trace set in_qty = 4234, out_qty = 4234 where id = '79858/2' and part_id = 'BACN10JA3CM'
update trace set in_qty = 1551, out_qty = 798 where id = '37189/7' and part_id = 'BACS18R50B'

update trace set in_qty = 5042, out_qty = 5042 where id = '77954/2' and part_id = 'BACN10JB3CD'
update trace set in_qty = 2000, out_qty = 2000 where id = '78636/2' and part_id = 'BACN10JB3CD'

update trace set in_qty = 4.7355, out_qty = 1.267 where id = '39550/2' and part_id = 'BACR15BA3AD4C'
update trace set in_qty = 3.2351, out_qty = 1.3561 where id = '40149/8' and part_id = 'BACR15BA3AD4C'
update trace set in_qty = 1, out_qty = 0 where id = '40854/2' and part_id = 'BACR15BA3AD4C'
update trace set in_qty = 1, out_qty = 0 where id = '42081/1' and part_id = 'BACR15BA3AD4C'
update trace set in_qty = 1.014, out_qty = 0.0215 where id = '46550/1' and part_id = 'BACR15BA3AD4C'
update trace set in_qty = 0.99, out_qty = 0.99 where id = '46550/2' and part_id = 'BACR15BA3AD4C'

update trace set in_qty = 5.5405, out_qty = 5.5405 where id = '38738/2' and part_id = 'BACR15BA3AD4C'
update trace set in_qty = 2.5625, out_qty = 2.5625 where id = '39550/1' and part_id = 'BACR15BA3AD4C'
update trace set in_qty = 1.0035, out_qty = 1.0035 where id = '39550/3' and part_id = 'BACR15BA3AD4C'

update trace set in_qty = 26, out_qty = 0 where id = '73634/2' and part_id = '401U3503-2252 CFM'

update trace set in_qty = 52, out_qty = 42 where id = '106810/1' and part_id = '60134B-063 36 X 48'
update trace set in_qty = 4, out_qty = 4 where id = '108406/1' and part_id = '60134B-063 36 X 48'
update trace set in_qty = 60, out_qty = 60 where id = '94890/2' and part_id = '60134B-063 36 X 48'
update trace set in_qty = 52, out_qty = 42 where id = '104168/1' and part_id = '60134B-063 36 X 48'
update trace set in_qty = 52, out_qty = 52 where id = '106810/1' and part_id = '60134B-063 36 X 48'

update trace set in_qty = 155, out_qty = 155 where id = '50962/1' and part_id = '60134B-080-TRN'
update trace set in_qty = 241, out_qty = 233 where id = '44088/1' and part_id = '60134B-080-TRN'

update trace set in_qty = 21, out_qty = 0 where id = '85136/1' and part_id = '6AL4V-040 MIL'
update trace set in_qty = 44, out_qty = 24 where id = '85136/2' and part_id = '6AL4V-040 MIL'

update trace set in_qty = 171, out_qty = 156 where id = '79588/1' and part_id = '6AL4V-040-MIL'
update trace set in_qty = 204, out_qty = 204 where id = '85220/1' and part_id = '6AL4V-040-MIL'

update trace set in_qty = 135.22, out_qty = 108 where id = '51451/1' and part_id = '6AL4V-080'

update trace set in_qty = 114, out_qty = 114 where id = '86260/1' and part_id = '6AL4V-080'
update trace set in_qty = 48, out_qty = 48 where id = '88058/1' and part_id = '6AL4V-080'
update trace set in_qty = 48, out_qty = 48 where id = '88074/1' and part_id = '6AL4V-080'
update trace set in_qty = 96, out_qty = 96 where id = '89447/1' and part_id = '6AL4V-080'

update trace set in_qty = 191.98, out_qty = 191.98 where id = '94459/2' and part_id = '70756B-100'
update trace set in_qty = 239.98, out_qty = 239.98 where id = '73788/2' and part_id = '70756B-100'
update trace set in_qty = 47.99, out_qty = 47.99 where id = '107918/1' and part_id = '70756B-100'
update trace set in_qty = 48, out_qty = 48 where id = '108457/1' and part_id = '70756B-100'
update trace set in_qty = 48, out_qty = 48 where id = '108457/2' and part_id = '70756B-100'
update trace set in_qty = 77.99, out_qty = 77.99 where id = '104379/1' and part_id = '70756B-100'

update trace set in_qty = 25, out_qty = 25 where id = '84875/1' and part_id = '70756B-125X2.40X119.4'

update trace set in_qty = 1456, out_qty = 1456 where id = '26904/1' and part_id = '70756E-71303'
update trace set in_qty = 288, out_qty = 72 where id = '20183/1' and part_id = '70756E-71303'

update trace set in_qty = 40, out_qty = 40 where id = '89671/3' and part_id = '70757P-0500x3.00x5.00'

update trace set in_qty = 53.99, out_qty = 53.99 where id = '60342/1' and part_id = 'Ti-15V-3-3-3-050'
update trace set in_qty = 57, out_qty = 11 where id = '89472/1' and part_id = 'Ti-15V-3-3-3-050'

update trace set in_qty = 77.99, out_qty = 48.99 where id = '104379/1' and part_id = '70756B-100'
update trace set in_qty = 47.99, out_qty = 4.99 where id = '107918/1' and part_id = '70756B-100'
update trace set in_qty = 48, out_qty = 0 where id = '108457/1' and part_id = '70756B-100'

update trace set in_qty = 48, out_qty = 0 where id = '108457/2' and part_id = '70756B-100'




select * from TRACE_INV_TRANS where TRANSACTION_ID = '2196684'
select * from INVENTORY_TRANS where TRANSACTION_ID = '2196684'

DECLARE @partid nvarchar(30) = '7150T77511-BAC1517-2864 CMP',
		@traceid nvarchar(30);

select 
	a.id
	, a.part_id
	, in_qty
	, out_qty
	, in_qty - out_qty as TraceDiff
	, ti.TraceXctQty
	, t.* 
	, case
		when Type = 'I' and Class = 'R' then 'Receipt'
		when Type = 'O' and Class = 'I' then 'Issue'
		when Type = 'O' and Class = 'A' then 'Adjust Out'
		when Type = 'I' and Class = 'A' then 'Adjust In'
		when Type = 'I' and Class = 'I' then 'Return Issue'
		when Type = 'O' and Class = 'R' then 'Return Receipt'
		else 'Fix'
	end as XctType
	, [type]
	, class
	, i.qty
	, warehouse_id
	, location_id
	, user_id
from trace a
inner join trace_inv_trans t
on t.trace_id = a.id
and t.part_id = a.part_id
inner join 
	(select part_id, trace_id, sum(qty) as TraceXctQty
		from trace_inv_trans
		group by part_id, trace_id
	) ti
		on ti.PART_ID = t.part_id
		and ti.TRACE_ID = t.trace_id
inner join inventory_trans i
on t.transaction_id = i.transaction_id
and t.part_id = i.part_id
where 
 ti.TraceXctQty <> in_qty - out_qty

--t.part_id in ('140T2522-285', '143T5352-27', '143T5352-28', '146T0395-159', '149A7590-8', '182T7120-5', '20240C-050', '20243C-063 PVC2', '20243E-32003', '20248R-0175', '232A4443-5', '272T4586-11', '287W4317-54', '3043-01', '343A9121-15', '401U3503-1273 CFM', '417T6511-1', '421W1189-12B', '453W3432-1', '60134B-063 36 X 48', '60134B-080-TRN', '60616B-160', '65B26315-928', '6AL4V-040-MIL', '6AL4V-080', '70750B-090', '70756B-125X2.40X119.4', '70756E-71303', '70757E-30601', '70757E-610024-MIL-NG', '70757E-9100274', '70757P-0375x1.8x2.0', '7150T77511-BAC1517-2864 CMP', 'BACB28AV04A012ZG', 'BACN10JZ3B2', 'BACN10XP1', 'BACR15BA3AD4C', 'BACR15BA5AD11C', 'BACR15BB4AD4R5C', 'BACR15CE4D4R5', 'BACS40R006E036F')
order by t.trace_id



/*
--Step1:
UPDATE TRACE_INV_TRANS SET QTY = QTY*(-1) WHERE PART_ID = '140T2522-285' AND TRANSACTION_ID = '2137573' AND TRACE_ID = '1171589/1/0'
UPDATE TRACE_INV_TRANS SET QTY = QTY*(-1) WHERE PART_ID = '149A7590-8' AND TRANSACTION_ID = '1134092' AND TRACE_ID = '1143695/1'
UPDATE TRACE_INV_TRANS SET QTY = QTY*(-1) WHERE PART_ID = '149A7590-8' AND TRANSACTION_ID = '1134092' AND TRACE_ID = '995871/1/0'
UPDATE TRACE_INV_TRANS SET QTY = QTY*(-1) WHERE PART_ID = '149A7590-8' AND TRANSACTION_ID = '1179652' AND TRACE_ID = '1157288/1'
UPDATE TRACE_INV_TRANS SET QTY = QTY*(-1) WHERE PART_ID = '287W4317-54' AND TRANSACTION_ID = '1134964' AND TRACE_ID = '1143647'
UPDATE TRACE_INV_TRANS SET QTY = QTY*(-1) WHERE PART_ID = '421W1189-12B' AND TRANSACTION_ID = '1129506' AND TRACE_ID = '1142017'
UPDATE TRACE_INV_TRANS SET QTY = QTY*(-1) WHERE PART_ID = '421W1189-12B' AND TRANSACTION_ID = '1150832' AND TRACE_ID = '1149655/1'
UPDATE TRACE_INV_TRANS SET QTY = QTY*(-1) WHERE PART_ID = '421W1189-12B' AND TRANSACTION_ID = '1157641' AND TRACE_ID = '1151397/1'
UPDATE TRACE_INV_TRANS SET QTY = QTY*(-1) WHERE PART_ID = '421W1189-12B' AND TRANSACTION_ID = '1160677' AND TRACE_ID = '1152421/1/0'
UPDATE TRACE_INV_TRANS SET QTY = QTY*(-1) WHERE PART_ID = '421W1189-12B' AND TRANSACTION_ID = '1163070' AND TRACE_ID = '1153021/1/0'
UPDATE TRACE_INV_TRANS SET QTY = QTY*(-1) WHERE PART_ID = '421W1189-12B' AND TRANSACTION_ID = '1177118' AND TRACE_ID = '1157178/1/0'
UPDATE TRACE_INV_TRANS SET QTY = QTY*(-1) WHERE PART_ID = '65B26315-928' AND TRANSACTION_ID = '1156236' AND TRACE_ID = '11503019/1'
UPDATE TRACE_INV_TRANS SET QTY = QTY*(-1) WHERE PART_ID = '65B26315-928' AND TRANSACTION_ID = '1156236' AND TRACE_ID = '978078/1/0'

--Step2:
UPDATE TRACE SET IN_QTY = 210, OUT_QTY = 210 WHERE PART_ID = '421W1189-12B' AND ID = '1157178/1/0'
UPDATE TRACE SET IN_QTY = 245, OUT_QTY = 245 WHERE PART_ID = '421W1189-12B' AND ID = '1142017'
UPDATE TRACE SET IN_QTY = 260, OUT_QTY = 260 WHERE PART_ID = '421W1189-12B' AND ID = '1149655/1'
UPDATE TRACE SET IN_QTY = 270, OUT_QTY = 270 WHERE PART_ID = '421W1189-12B' AND ID = '1151397/1'
UPDATE TRACE SET IN_QTY = 270, OUT_QTY = 270 WHERE PART_ID = '421W1189-12B' AND ID = '1152421/1/0'
UPDATE TRACE SET IN_QTY = 270, OUT_QTY = 270 WHERE PART_ID = '421W1189-12B' AND ID = '1153021/1/0'
UPDATE TRACE SET IN_QTY = 56, OUT_QTY = 56 WHERE PART_ID = '149A7590-8' AND ID = '1157288/1'
UPDATE TRACE SET IN_QTY = 6, OUT_QTY = 6 WHERE PART_ID = '287W4317-54' AND ID = '1143647'
UPDATE TRACE SET IN_QTY = 69, OUT_QTY = 69 WHERE PART_ID = '149A7590-8' AND ID = '1143695/1'

-- 4/3/2018
use live
go

UPDATE TRACE SET IN_QTY = 9, OUT_QTY = 9 WHERE PART_ID = '6AL4V-080 8 X 36' AND ID = '97149'
UPDATE TRACE SET IN_QTY = 9, OUT_QTY = 9 WHERE PART_ID = '6AL4V-080 8 X 36' AND ID = '97149-1/1'

-- 2/14/2018
UPDATE TRACE SET IN_QTY = 96, OUT_QTY = 96 WHERE PART_ID = '6AL4V-080' AND ID = '89447/1'
UPDATE TRACE SET IN_QTY = 135.22, OUT_QTY = 135.22 WHERE PART_ID = '6AL4V-080' AND ID = '51451/1'

UPDATE TRACE SET IN_QTY = 47.99, OUT_QTY = 47.99 WHERE PART_ID = '70750B-090' AND ID = '90104/1'

UPDATE TRACE SET IN_QTY = 60, OUT_QTY = 26 WHERE PART_ID = '60134B-063 36 X 48' AND ID = '108406/1'
UPDATE TRACE SET IN_QTY = 52, OUT_QTY = 52 WHERE PART_ID = '60134B-063 36 X 48' AND ID = '104168/1'

UPDATE TRACE SET IN_QTY = 144, OUT_QTY = 144 WHERE PART_ID = '6AL4V-040-MIL' AND ID = '79588/1'

UPDATE TRACE SET IN_QTY = 60, OUT_QTY = 25 WHERE PART_ID = '60134B-063 36 X 48' AND ID = '108406/1'
UPDATE TRACE SET IN_QTY = 288, OUT_QTY = 288 WHERE PART_ID = '70756E-71303' AND ID = '20183/1'
UPDATE TRACE SET IN_QTY = 241, OUT_QTY = 241 WHERE PART_ID = '60134B-080-TRN' AND ID = '44088/1'

UPDATE TRACE SET IN_QTY = 1677, OUT_QTY = 1677 WHERE PART_ID = 'BACR15BB4AD4R5C' AND ID = '94410/1'

UPDATE TRACE SET IN_QTY = 60, OUT_QTY = 34 WHERE PART_ID = '60134B-063 36 X 48' AND ID = '108406/1'

UPDATE TRACE SET IN_QTY = 500, OUT_QTY = 500 WHERE PART_ID = 'BACB28AV04A012ZG' AND ID = '74128/3'


update trace set in_qty = 0, out_qty = 0 where id = 'x' and part_id = ''


*/
```