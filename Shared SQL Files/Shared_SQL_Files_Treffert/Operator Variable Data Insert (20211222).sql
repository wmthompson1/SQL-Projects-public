/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [RESOURCE_ID]
      ,[OPERATION_TYPE_ID]
      ,[LINE_NUM]
      ,[INSTRUCTIONS_OR_OPERATOR_VARIABLE]
      ,[LABEL_YN]
      ,[PROMPT]
  FROM [LIVESupplemental].[dbo].[operator_variable_data]
  WHERE RESOURCE_ID = 'P1F1-PENETCH'
  ORDER BY 1, 2, 3

  BEGIN TRANSACTION;
  INSERT INTO [LIVESupplemental].[dbo].[operator_variable_data]
  VALUES ('P1F1-PENETCH', 'PEN-POSTCLEAN', '1', 'OPERATOR_VARIABLE', 'YES', 'LABEL')
  --VALUES ('P1F1-PENETCH', 'PEN-POSTCLEAN', '1', 'OPERATOR_VARIABLE', 'NO', '______________1)
  --> COMMIT TRANSACTION;
  --> ROLLBACK TRANSACTION;