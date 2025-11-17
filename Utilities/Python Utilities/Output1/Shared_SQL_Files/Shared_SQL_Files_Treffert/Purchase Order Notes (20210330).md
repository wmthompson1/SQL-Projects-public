# Purchase Order Notes (20210330)

```sql
select top 25 * from DEMAND_SUPPLY_LINK where supply_type = 'po' order by create_date desc
select * from demand_supply_link where supply_base_id in ('146673', '146693', '146691')

select part_id, base_id from work_order 
where BASE_id in ('1645561', '1647191', '1646100', '1637502', '1647867', '1642064', '1646104')
and SUB_ID = 0
and split_id = '0'
order by part_id

484Z6153-230:
WO 1646100/1
WO 1637502/1
WO 1647867/1

select * from demand_supply_link where DEMAND_BASE_ID in ('1646100', '1637502', '1647867')
PO: 146673 / 3, 4, 5

select * from DOCUMENT_REF_WO where workorder_base_id = '484Z6153-230'
484Z6153-229 SKILLS DWG
484Z6153-229 SKILLS MYLAR
484Z6153-229 SKILLS MYLAR P3
484Z6153-230 EPL
484Z6153-230 LWG
484Z6153-29 EPL
484Z6153-29 LWG
484Z6153-30 EPL
484Z6153-30 LWG
CA484Z6153-129 EPL
CA484Z6153-130 EPL
MY159H PL

select * from DOCUMENT_REF_WO where workorder_base_id in ('1646100', '1637502', '1647867', '484Z6153-230')


```