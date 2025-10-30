use live
go

select * from INVENTORY_BALANCE
where part_id in ('238-0253-514', 'Texture Key Chain', '70507P-0250X3.31X5.05 CMP', '7075-T6-100-6X9-TRNG', '6061-T6-160x6x15-TRNG', '145W5402-7', '6061-T6-190-30X48-TRNGP', '435W5001-22', 'SPCX0436-13-TRNG', '287W4710-36', '353T0263-2', '146T0807-4', '252U3102-4', 'K12-001')
and posting_date >= '2/1/2018'
order by part_id, posting_date

select * from INVENTORY_BALANCE where posting_date >= '3/31/2018'
