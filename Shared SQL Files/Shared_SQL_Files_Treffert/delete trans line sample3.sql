--find and delete the shipper. last time had to do it from the table instead of using query.

select * from po4.dbo.shipper where cust_order_id = '253722'

select * from po4.dbo.shipper where packlist_id = '703666'
--select * from shipper where packlist_id = '669373'
--select * from shipper where packlist_id = '669375'

--DELETE FROM po4.dbo.shipper WHERE packlist_ID = '669375' AND ROWID = 373826

--then find and delete inventory trasactions
select * from po4.dbo.inventory_trans where transaction_id = 1071314
select * from po4.dbo.inventory_trans where transaction_id = 1071315
--select * from inventory_trans where transaction_id = 457160

--DELETE FROM po4.dbo.INVENTORY_TRANS WHERE TRANSACTION_ID = 1071315 AND ROWID = 1066948

--if you get an error about the inventory_balance table do the following

--select * from po4.dbo.inventory_balance where transaction_id = 1071315

--delete from po4.dbo.inventory_balance where transaction_id = 1071315

--if you get an FKEY 02174 reference constraint message
--select * from po4.dbo.inv_trans_dist where out_trans_id = 1071315
--delete from po4.dbo.inv_trans_dist where out_trans_id = 1071315 and rowid = 527097

--run following to determine which phantom records exist in shipment detail table
select * from shipment_detail where transaction_id not in (select transaction_id from inventory_trans)
order by cust_order_id

--for each record above, analyize all transactions to the given customer order
select * from shipment_detail where cust_order_id = '164410' ORDER BY TRANSACTION_ID, DIST_NO

--seek out total postings made via costing utilities and if they've been posted or not (batch id is / is not null)
--if multiple postings, add each of the DR type lines for summary then compare to records that exist in 
--shipment_detail table that do belong there (aren't missing from inventory_trans table).  
select * from shipment_dist where cust_order_id = '164410'

--find out if trans exist in trace_inv_trans table and if so, delete them (assuming your safe to delete 
--above stuff.
select * from trace_inv_trans where transaction_id in (463283,463284)
--DELETE FROM TRACE_INV_TRANS WHERE ROWID = 

--determine if transactions exists in fifo tables - if so delete.
select * from inv_trans_dist where in_trans_id in (463283,463284) or out_trans_id in (463283,463284)
--DELETE FROM INV_TRANS_DIST WHERE ROWID = 209690

--lastly remove (after above) items in the shipper_line table (first), then shipper table.
SELECT * FROM SHIPPER_LINE WHERE TRANSACTION_ID IN (463283,463284)

--check to see if the transactions reside in the inventory_balance table - if so remove via 
SELECT * FROM INVENTORY_BALANCE WHERE TRANSACTION_ID IN (463283,463284)
--costing tools (check & prep customer order).

--Lastly, remove phatom records
DELETE FROM SHIPMENT_DETAIL WHERE ROWID IN(469218) AND TRANSACTION_ID IN (426441)

--select * from inventory_trans where transaction_id = 463284
--update inventory_trans set act_material_cost = 0 where transaction_id = 463284

