use DataWarehouse
go

select * from labor_ticket where TRANSACTION_DATE >= '2/19/2019' 
and resource_id in ('P1F1-OVEN-PRIME', 'P1F1-OVEN-TC', 'P1F1-PNT-PRIME', 'P1F1-PNT-SAND', 'P1F1-PNT-SETUP', 'P1F1-PNT-TC', 'P1F2-OVEN-PRIME', 'P1F2-PNT-PRIME', 'P1F2-PNT-SETUP')
and clock_in <> clock_out

