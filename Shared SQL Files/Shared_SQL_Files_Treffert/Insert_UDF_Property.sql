USE [live]
GO

INSERT INTO [dbo].[USER_DEF_FIELDS]
           ([PROGRAM_ID]
           ,[ID]
           ,[DOCUMENT_ID]
           ,[LINE_NO]
           ,[DEL_LINE_NO]
           ,[LABEL]
           ,[DATA_TYPE]
           ,[DISPLAY_FORMAT]
           ,[TAB_OR_TABLE]
           ,[TAB_ID]
           ,[TABLE_ID]
           ,[SEQUENCE_NO]
           ,[UDF_REQUIRED]
           ,[STRING_VAL]
           ,[NUMBER_VAL]
           ,[BOOL_VAL]
           ,[DATE_VAL])
     SELECT
          'VMDOCMNT',  --(PROGRAM_ID, varchar(30),
          'UDF-0000050',--,ID, varchar(30),
           P.[document id],--,DOCUMENT_ID, varchar(128),
	--	 udf.DOCUMENT_ID,
           NULL,--,LINE_NO, int,
           NULL,--,DEL_LINE_NO, int,
           NULL,--,LABEL, varchar(250),
           NULL,--,DATA_TYPE, int,
           NULL,--,DISPLAY_FORMAT, varchar(30),
           NULL,--,TAB_OR_TABLE, int,
           NULL,--,TAB_ID, varchar(30),
           NULL,--,TABLE_ID, varchar(30),
           NULL,--,SEQUENCE_NO, int,
           NULL,--,UDF_REQUIRED, int,
           'BOEING',--,STRING_VAL, varchar(250),
           NULL,--,NUMBER_VAL, decimal(15,6),
           NULL,--,BOOL_VAL, int,
           NULL--,DATE_VAL, datetime)
   from Livesupplemental.dbo.update_property$ P
  left outer join live.dbo.USER_DEF_FIELDS udf  
     on udf.DOCUMENT_ID = p.[Document ID]
    and udf.PROGRAM_ID = 'VMDOCMNT'  
    and udf.id = 'UDF-0000050'
    and udf.STRING_VAL = 'BOEING'
where udf.DOCUMENT_ID is null

