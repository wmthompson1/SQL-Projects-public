/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [BusStream]
      ,[Year]
      ,[Month]
      ,[Target]
      ,[Date]
  FROM [LIVESupplemental].[dbo].[Plant_Shipment_Forecast]

--DELETE FROM [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] WHERE [YEAR] = '2021'


/*
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-FIN', '2021','January','286352','1/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-FIN', '2021','February','286352','2/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-FIN', '2021','March','292217','3/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-FIN', '2021','April','292217','4/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-FIN', '2021','May','265651','5/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-FIN', '2021','June','298031','6/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-FIN', '2021','July','284485','7/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-FIN', '2021','August','298031','8/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-FIN', '2021','September','288867','9/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-FIN', '2021','October','288867','10/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-FIN', '2021','November','275111','11/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-FIN', '2021','December','288867','12/1/2021')								
								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('FIN', '2021','January','235551','1/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('FIN', '2021','February','269201','2/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('FIN', '2021','March','264551','3/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('FIN', '2021','April','330688','4/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('FIN', '2021','May','330688','5/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('FIN', '2021','June','354626','6/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('FIN', '2021','July','354626','7/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('FIN', '2021','August','354626','8/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('FIN', '2021','September','378735','9/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('FIN', '2021','October','340862','10/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('FIN', '2021','November','302988','11/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('FIN', '2021','December','265115','12/1/2021')								
								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-MFG', '2021','January','575000','1/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-MFG', '2021','February','575000','2/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-MFG', '2021','March','600000','3/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-MFG', '2021','April','545317','4/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-MFG', '2021','May','495743','5/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-MFG', '2021','June','557751','6/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-MFG', '2021','July','532399','7/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-MFG', '2021','August','557751','8/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-MFG', '2021','September','541711','9/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-MFG', '2021','October','541711','10/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-MFG', '2021','November','515915','11/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-MFG', '2021','December','534000','12/1/2021')								
								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('MFG', '2021','January','806364','1/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('MFG', '2021','February','921559','2/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('MFG', '2021','March','834418','3/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('MFG', '2021','April','1043022','4/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('MFG', '2021','May','1043022','5/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('MFG', '2021','June','1029772','6/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('MFG', '2021','July','1029772','7/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('MFG', '2021','August','1029772','8/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('MFG', '2021','September','1059928','9/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('MFG', '2021','October','953935','10/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('MFG', '2021','November','847942','11/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('MFG', '2021','December','741949','12/1/2021')								
								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-Total', '2021','January','861352','1/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-Total', '2021','February','861352','2/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-Total', '2021','March','892217','3/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-Total', '2021','April','837534','4/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-Total', '2021','May','761394','5/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-Total', '2021','June','855782','6/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-Total', '2021','July','816884','7/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-Total', '2021','August','855782','8/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-Total', '2021','September','830578','9/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-Total', '2021','October','830578','10/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-Total', '2021','November','791026','11/1/2021')								
INSERT INTO [LIVESupplemental].[dbo].[Plant_Shipment_Forecast] VALUES ('CMP-Total', '2021','December','822867','12/1/2021')								
*/