--> don't use, overwrites everything!!


USE LIVE
GO

/**********************************************************************************************
description:	updates binary from search and replace unicode text.
	---- **
	---- in test @crunch (uncomment for production)
	---- comment out update if testing **	

date        modified by         change description
----------  ------------------  ------------------------------------------------------------

Global update to all masters with P1F1-PEN-MASK

The operation states:
INDICATE MASKANT USED:  PLUGS / TAPE / LIQUID

Change to the following:
MASKANT USED: PLUGS


**********************************************************************************************/

set transaction isolation level read uncommitted
set deadlock_priority low

if object_id('tempdb..#results') is not null drop table #results

-- if in debug mode, set to 1 else set transaction
declare @debugmode tinyint = 1
   ,@rowcount int = 0

declare @counter int = 1
   , @MaxCount int = 100000 


-- declare iterator and loop
--BEGIN  -- section
DECLARE @execution_id NVARCHAR(30) 

DECLARE   
@ValueX Nvarchar(max) ,   
@valueBits varbinary(max),
@editedX Nvarchar(max) , 
@WORKORDER_TYPE nchar(1) ,
@WORKORDER_BASE_ID nvarchar(30) ,
@WORKORDER_LOT_ID nvarchar(3) ,
@WORKORDER_SPLIT_ID nvarchar(3) ,
@WORKORDER_SUB_ID nvarchar(3) ,
@SEQUENCE_NO smallint              

---- from binary to editable
DECLARE execution_cursor CURSOR LOCAL FOR 

select 
	 x.valueX
	,x.workorder_type
	,x.workorder_base_id
	,x.workorder_lot_id
	,x.workorder_split_id
	,x.workorder_sub_id 
	,x.SEQUENCE_NO
from
(select top 100 percent
		 o.workorder_type
		,o.workorder_base_id
		,o.workorder_lot_id
		,o.workorder_split_id
		,o.workorder_sub_id 
		,o.SEQUENCE_NO
		 -- editable text <--- nvsrchar <--- varbinary <--- image(bits)
		,valueX = convert(Nvarchar(max),convert(varbinary(max),ob.bits)) 
	from [dbo].[OPERATION_BINARY] ob (nolock)
	join dbo.operation  o (nolock)
	on
	 ob.workorder_type = o.workorder_type
	AND ob.workorder_base_id = o.workorder_base_id
	AND ob.workorder_lot_id = o.workorder_lot_id
	AND ob.workorder_split_id = o.workorder_split_id
	AND ob.workorder_sub_id = o.workorder_sub_id
	and ob.[SEQUENCE_NO] = o.[SEQUENCE_NO]
	and o.WORKORDER_TYPE = 'M'
	and o.resource_id = 'P1F1-PEN-MASK'
	--and ob.workorder_base_id = '187W5105-704'
) as x
where 
(valueX like '%' + 'INDICATE MASKANT USED:  PLUGS / TAPE / LIQUID' + '%')

set @rowcount = @@ROWCOUNT
print convert(VARCHAR(MAX),CONVERT(DATE,GETDATE())) + ' -- > START  processing '
--if @rowcount = 0 goto IfNoRows

print convert(nvarchar(MAX), getdate())
OPEN execution_cursor
FETCH NEXT FROM execution_cursor 
into 
	 @ValueX      
	,@WORKORDER_TYPE 	
	,@WORKORDER_BASE_ID 	
	,@WORKORDER_LOT_ID 	
	,@WORKORDER_SPLIT_ID 	
	,@WORKORDER_SUB_ID 	
	,@SEQUENCE_NO 	
         
WHILE @@FETCH_STATUS = 0
BEGIN -- While
                  
    BEGIN TRY
	-- Execution of Code begins here:  *** 
	-- --------------------------------------------
	print''
	if @debugmode = 1 print convert(varchar(max), @counter) + '-- > '  + 'DEBUG MODE'
	if @debugmode = 1 print 'BEFORE: ' + CHAR(13) + convert(Nvarchar(max),@ValueX) + CHAR(13)

	--print convert(varchar(max),@workOrder_base_id)
	-- replace the string left in TextX with string right.
    set @editedX = replace (@ValueX
			, N'INDICATE MASKANT USED:  PLUGS / TAPE / LIQUID'
			, N'MASKANT USED: PLUGS')
	if @debugmode = 1 print ''
	if @debugmode = 1 print convert(varchar(max), @counter) + '-- > '  + 'DEBUG MODE'

	---- **
	---- in test @crunch (uncomment for production)
	---- comment out update if testing **
	--update [OPERATION_BINARY]
    --   set bits = convert(varbinary(max),convert(nvarchar(max),@editedX))
	    ----DEBUG MODE else comment out
	   select @valueBits = convert(varbinary(max),convert(nvarchar(max),@editedX))
	from [dbo].[OPERATION_BINARY] ob
	where (1=1)
	AND ob.workorder_TYPE = @workOrder_type
	AND ob.workorder_base_id = @workorder_base_id
	AND ob.workorder_lot_id = @workorder_lot_id
	AND ob.workorder_split_id = @workorder_split_id
	AND ob.workorder_sub_id = @workorder_sub_id
	and ob.[SEQUENCE_NO] = @SEQUENCE_NO
	and ob.WORKORDER_TYPE = 'M'

	safeEdit:
	if @debugmode = 1 print 'AFTER: ' + CHAR(13) + convert(Nvarchar(max),convert(varbinary(max),convert(varbinary(max),
										convert(nvarchar(max),@editedX)))) 

	-- Execution of Code Ends /////////////////////////// wnt
	-- --------------------------------------------------
	    print ''
		print convert(varchar(max), @counter) + '-- > '  +
		convert(varchar(max),@WORKORDER_BASE_ID) 
		+ '-' +
		convert(varchar(max),@WORKORDER_SUB_ID) 
		+ '/' +
		convert(varchar(max),@WORKORDER_LOT_ID)
		+ '/' +
		convert(varchar(max),@WORKORDER_SPLIT_ID) 	
		+ '/' +	
		convert(varchar(max),@SEQUENCE_NO)	

    END TRY

    BEGIN CATCH
                            
    END CATCH

	IF @Counter > @MaxCount
	  BREAK;

	SET @counter = @counter + 1
 FETCH NEXT FROM execution_cursor
 into 
	 @ValueX      
	,@WORKORDER_TYPE 	
	,@WORKORDER_BASE_ID 	
	,@WORKORDER_LOT_ID 	
	,@WORKORDER_SPLIT_ID 	
	,@WORKORDER_SUB_ID 	
	,@SEQUENCE_NO 	
END  -- WHILE
CLOSE execution_cursor

DEALLOCATE execution_cursor
IfNoRows:
--END  -- section
print ''
print 'finished.'

