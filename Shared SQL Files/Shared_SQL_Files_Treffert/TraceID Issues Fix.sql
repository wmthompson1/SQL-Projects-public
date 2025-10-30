use live
go

declare @partid nvarchar(50) = '453A2610-18'

--select * from inventory_trans where transaction_id = '2718986'
--select * from trace_inv_trans where transaction_id = '2718986'
--select * from trace_inv_trans where transaction_id = '2718987'

select * from trace where part_id = @partid 
select * from inventory_trans where part_id = @partid order by TRANSACTION_ID desc
select * from trace_inv_trans where part_id = @partid order by TRANSACTION_ID desc --transaction_id = '2714391'

-- run after to verify traceID count correction 
select * from trace_inv_trans where part_id = @partid 

/*
declare @partid nvarchar(50) = '453A2610-18'
, @traceid nvarchar(20) = '1599369/1/0'
, @qty int = 4
, @createdate date = '2019-11-21 00:00:00.000'

-- trace id has to be on the table before changes
--insert into trace (PART_ID, ID, NUMBERING_ID, OUT_QTY, IN_QTY, REPORTED_QTY, ASSIGNED_QTY, APROPERTY_1, APROPERTY_2, APROPERTY_3, APROPERTY_4, APROPERTY_5, NPROPERTY_1, NPROPERTY_2, NPROPERTY_3, NPROPERTY_4, NPROPERTY_5, COMMENTS, EXPIRATION_DATE, CREATE_DATE, DISP_IN_QTY, DISP_OUT_QTY, UNAVAILABLE_QTY, OWNER_ID, LOT_ID, SERIAL_ID, COMMITTED_QTY, PRODUCTION_DATE, RECEIVE_BY_DATE, AVAILABLE_DATE, SHIP_BY_DATE, SITE_ID)
--values (@partid, @traceid, @partid, @qty, @qty, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, @createdate, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SK01')

-- receipt entry
update trace_inv_trans 
set trace_id = @traceid
where transaction_id = '2718986'

-- issue entry
update trace_inv_trans 
set trace_id = @traceid
where transaction_id = '2718987'
*/