--remove double space from document_id based on data from excel file received from Shannon

--381 records  - 7 records appear to be already fixed
select * from  LIVESupplemental.dbo.Update_docref_id$ up

--user_def_fields ------------------------------------------------------------------------
-- 1128 records   -- 1138  -- removes records already there
select distinct up1.[Document ID] 
  into #tmpup
  from LIVESupplemental.dbo.Update_docref_id$ up1
 inner join USER_DEF_FIELDS udf1
    on udf1.DOCUMENT_ID = up1.document_ID_new
--select * from #tmpup t

--1113
 select * from LIVESupplemental.dbo.Update_docref_id$ up
 inner join USER_DEF_FIELDS udf
    on udf.DOCUMENT_ID = up.[Document ID]
 left outer join #tmpup t
    on up.[Document ID] =  t.[DOCUMENT ID]
    where t.[DOCUMENT ID] is null

update udf
   set document_id = up.document_ID_new
  from USER_DEF_FIELDS udf
 inner join LIVESupplemental.dbo.Update_docref_id$ up
    on udf.DOCUMENT_ID = up.[Document ID]
 left outer join #tmpup t
    on up.[Document ID] =  t.[DOCUMENT ID]
    where t.[DOCUMENT ID] is null

-- 532  --536
-- document_ref_wo ----------------------------------------------

select distinct up1.[Document ID] 
  into #tmpup2
  from LIVESupplemental.dbo.Update_docref_id$ up1
 inner join DOCUMENT_REF_WO refwo
    on refwo.DOCUMENT_ID = up1.document_ID_new
--select * from #tmpup2 t

--524
 select * from LIVESupplemental.dbo.Update_docref_id$ up
 inner join DOCUMENT_REF_WO refwo
    on refwo.DOCUMENT_ID = up.[Document ID]
 left outer join #tmpup t
    on up.[Document ID] =  t.[DOCUMENT ID]
    where t.[DOCUMENT ID] is null

update refwo
   set refwo.DOCUMENT_ID = up.document_ID_new
   from LIVESupplemental.dbo.Update_docref_id$ up
  inner join DOCUMENT_REF_WO refwo
     on refwo.DOCUMENT_ID = up.[Document ID]
   left outer join #tmpup t
     on up.[Document ID] =  t.[DOCUMENT ID]
  where t.[DOCUMENT ID] is null



-- document --------------------------------------------------------------------------
--376  -- 380
select distinct up1.[Document ID] 
  into #tmpup3
  from LIVESupplemental.dbo.Update_docref_id$ up1
 inner join document d
    on d.ID = up1.document_ID_new
--select * from #tmpup2 t

--371
 select * from LIVESupplemental.dbo.Update_docref_id$ up
 inner join document d
    on d.ID = up.[Document ID]
 left outer join #tmpup t
    on up.[Document ID] =  t.[DOCUMENT ID]
    where t.[DOCUMENT ID] is null

update d
   set d.ID = up.document_ID_new
    from LIVESupplemental.dbo.Update_docref_id$ up
 inner join document d
    on d.ID = up.[Document ID]
 left outer join #tmpup t
    on up.[Document ID] =  t.[DOCUMENT ID]
    where t.[DOCUMENT ID] is null

