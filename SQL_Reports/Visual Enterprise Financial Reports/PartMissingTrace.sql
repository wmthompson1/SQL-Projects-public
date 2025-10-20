SELECT p.ID as 'Part_ID', p.DESCRIPTION, p.FABRICATED, p.QTY_ON_HAND,
iif(t.PART_ID is null, 'Trace never assigned', 'Trace assigned at some point') as 'Trace'
FROM PART p left outer join (select distinct PART_ID from TRACE_INV_TRANS) t on p.ID = t.PART_ID
where STATUS = 'A' and QTY_ON_HAND > 0 and FABRICATED = 'Y'
and p.ID not in (select PART_ID from TRACE_PROFILE)
