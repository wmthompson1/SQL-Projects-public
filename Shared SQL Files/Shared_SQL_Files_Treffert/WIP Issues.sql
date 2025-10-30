use live
go

select euro_participant, xchg_rate 
from currency 
--where id = :hWndForm.colCURRENCY_ID
--	into :hWndForm.sTempEuroParticipant, :hWndForm.nTempXchgRate

select * from APPLICATION_GLOBAL

select CURRENCY_ID, * from WIP_BALANCE where POSTING_DATE >= '8/31/2020' and CURRENCY_ID != 'USD'
select CURRENCY_ID, * from WIP_ISSUE_DETAIL where CURRENCY_ID != 'USD'
select CURRENCY_ID, * from WIP_ISSUE_DIST where POSTING_DATE >= '8/31/2020'  and CURRENCY_ID != 'USD'
select CURRENCY_ID, * from WIP_LABOR_DETAIL where CURRENCY_ID != 'USD'
select CURRENCY_ID, * from WIP_PAYB_DETAIL where  CURRENCY_ID != 'USD'
select CURRENCY_ID, * from WIP_RECEIPT_DETAIL where  CURRENCY_ID != 'USD'
select CURRENCY_ID, * from WIP_RECEIPT_DIST where POSTING_DATE >= '8/31/2020'  and CURRENCY_ID != 'USD'
select CURRENCY_ID, * from WIP_SERVICE_DETAIL where  CURRENCY_ID != 'USD'
select CURRENCY_ID, * from WIP_SPLIT_DETAIL where  CURRENCY_ID != 'USD'

select [WORKORDER_TYPE] + '~' + [WORKORDER_BASE_ID] + '~' + [WORKORDER_LOT_ID] + '~' + [WORKORDER_SPLIT_ID]
	 + '~' + [WORKORDER_SUB_ID] + '~' + convert(nvarchar(10), [DIST_NO]) + '~' + convert(nvarchar(10), [TRANSACTION_ID]) + '~' + [CURRENCY_ID]
, count(*)
from WIP_ISSUE_DETAIL
group by  [WORKORDER_TYPE] + '~' + [WORKORDER_BASE_ID] + '~' + [WORKORDER_LOT_ID] + '~' + [WORKORDER_SPLIT_ID]
	 + '~' + [WORKORDER_SUB_ID] + '~' + convert(nvarchar(10), [DIST_NO]) + '~' + convert(nvarchar(10), [TRANSACTION_ID]) + '~' + [CURRENCY_ID]
having count(*) > 1


/*
update INVENTORY_BALANCE
set QTY = :nQTY,
  FLAG = :sFLAG,
  MATERIAL_AMOUNT = :nMATERIAL,
  LABOR_AMOUNT = :nLABOR,
  BURDEN_AMOUNT = :nBURDEN,
  SERVICE_AMOUNT = :nSERVICE,
  MAT_GL_ACCT_ID = :sMAT_ACCOUNT,
  LAB_GL_ACCT_ID = :sLAB_ACCOUNT,
  BUR_GL_ACCT_ID = :sBUR_ACCOUNT,
  SER_GL_ACCT_ID = :sSER_ACCOUNT
where
  PART_ID = :sPART_ID And
  POSTING_DATE = :dtPOSTING_DATE And
  TRANSACTION_ID = :nTRANSACTION_ID And
  CURRENCY_ID = :sCURRENCY_ID
  */