/****** Script for SelectTopNRows command from SSMS  ******/
SELECT * FROM [LIVESupplemental].[dbo].[operator_variable_data]
where [OPERATION_TYPE_ID] in ('REVIEW', 'FREEZER')

select * from live.dbo.operation_type where id in ('FREEZER')
--select * from live.dbo.operation where operation_type = 'PS21202 F-18'

--SELECT * FROM [LIVE].[dbo].[SKILLS_CERT_DESC] WHERE [OP_TYPE] in ('5000-7021-001TC')

/*
--> used excel OVD Inserts.xlsx to generate

--> tt20201125
insert into [LIVESupplemental].[dbo].[operator_variable_data] values ('P1F1-PNT-TC', '5000-7015-001TC', '1', 'OPERATOR_VARIABLE', 'YES', 'LABEL')

--> tt20201123
insert into [LIVESupplemental].[dbo].[operator_variable_data] values ('P1F1-PEN', 'PS21202 F-18', '1', 'OPERATOR_VARIABLE', 'NO', 'LEVEL(CIRCLE ONE):   2   OR   3   ')
insert into [LIVESupplemental].[dbo].[operator_variable_data] values ('P1F1-PEN', 'PS21202 F-18', '2', 'OPERATOR_VARIABLE', 'NO', 'BLANK')
insert into [LIVESupplemental].[dbo].[operator_variable_data] values ('P1F1-PEN', 'PS21202 F-18', '3', 'OPERATOR_VARIABLE', 'NO', 'QTY ACCEPTED:____________')
insert into [LIVESupplemental].[dbo].[operator_variable_data] values ('P1F1-PEN', 'PS21202 F-18', '4', 'OPERATOR_VARIABLE', 'NO', 'QTY REJECTED:_____________')

1644974/1
--> tt20210111

delete from [LIVESupplemental].[dbo].[operator_variable_data] where resource_id = 'P2M1-FREEZER'
insert into [LIVESupplemental].[dbo].[operator_variable_data] values ('P2M1-FREEZER', 'FREEZER', '1', 'OPERATOR_VARIABLE', 'NO', 'BLANK')
*/