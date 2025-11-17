# Batching Barcode Labor Ticket Issue

```sql
use DataWarehouse
go

select * from labor_ticket
where transaction_date >= '2/19/2019' 
and TRANSACTION_DATE < '2/20/2019'
and resource_id in ('P1F1-OVEN-PRIME', 'P1F1-OVEN-TC', 'P1F1-PNT-PRIME', 'P1F1-PNT-SAND', 'P1F1-PNT-SETUP', 'P1F1-PNT-TC', 'P1F2-PNT-PRIME', 'P1F2-PNT-SETUP')


select * from labor_ticket
where transaction_date >= '2/26/2019' 
and TRANSACTION_DATE < '2/28/2019'
and resource_id in ('P1F1-OVEN-PRIME', 'P1F1-OVEN-TC', 'P1F1-PNT-PRIME', 'P1F1-PNT-SAND', 'P1F1-PNT-SETUP', 'P1F1-PNT-TC', 'P1F2-PNT-PRIME', 'P1F2-PNT-SETUP')
```