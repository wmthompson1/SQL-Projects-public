# Skills Cert SpaceX

```sql
SELECT        WORK_ORDER.BASE_ID, WORK_ORDER.LOT_ID, WORK_ORDER.SPLIT_ID, WORK_ORDER.SUB_ID, WORK_ORDER.PART_ID, WORK_ORDER.DESIRED_QTY, WORK_ORDER.CREATE_DATE, PART.DESCRIPTION, 
PaintOperations.dbo.PAINT_LOG_WO.PaintLog,
[PAINTLIST]
      ,[COLOR]
      ,[MFR]
      ,[CURETIME]  
      ,[CURE1_START_TIME]
      ,[CURE1_FINISH_TIME]
      ,[OVEN1]
      ,[TEMP1]
      ,[CURE2_START_TIME]
      ,[CURE2_FINISH_TIME]
      ,[OVEN2]
      ,[TEMP2]
      ,[BASE1_ID]
      ,[CAT1_ID]
      ,[THINNER1_ID]
      ,[BASE1_MFD_DATE]
      ,[CAT1_MFD_DATE]
      ,[THINNER1_MFD_DATE]
      ,[BASE2_ID]
      ,[CAT2_ID]
      ,[THINNER2_ID]
      ,[BASE2_MFD_DATE]
      ,[CAT2_MFD_DATE]
      ,[THINNER2_MFD_DATE]
      ,[PAINT_NAME]
      ,[OVEN1_C2]
      ,[CURE1_START_TIME_C2]
      ,[CURE1_FINISH_TIME_C2]
      ,[TEMP1_C2]
      ,[OVEN2_C2]
      ,[CURE2_START_TIME_C2]
      ,[CURE2_FINISH_TIME_C2]
      ,[TEMP2_C2]
      ,[OVEN1_C3]
      ,[CURE1_START_TIME_C3]
      ,[CURE1_FINISH_TIME_C3]
      ,[TEMP1_C3]
      ,[OVEN2_C3]
      ,[CURE2_START_TIME_C3]
      ,[CURE2_FINISH_TIME_C3]
      ,[TEMP2_C3]
      ,PaintOperations.dbo.PAINT_LOG_DATA.PrimeOrTopCoat
      ,[ThickMin]
      ,[ThickMax]
      ,[ThickAvg]
      ,[TopCoatGloss]
FROM            LIVE.dbo.WORK_ORDER INNER JOIN
                         LIVE.dbo.PART ON WORK_ORDER.PART_ID = PART.ID 
                         LEFT JOIN
                         PaintOperations.dbo.PAINT_LOG_WO ON (LIVE.dbo.WORK_ORDER.BASE_ID = PaintOperations.dbo.PAINT_LOG_WO.WORKORDER_BASE_ID) AND (LIVE.dbo.WORK_ORDER.LOT_ID = PaintOperations.dbo.PAINT_LOG_WO.WORKORDER_LOT_ID)
                         AND (LIVE.dbo.WORK_ORDER.SPLIT_ID = PaintOperations.dbo.PAINT_LOG_WO.WORKORDER_SPLIT_ID) AND (LIVE.dbo.WORK_ORDER.SUB_ID = PaintOperations.dbo.PAINT_LOG_WO.WORKORDER_SUB_ID)
                         LEFT JOIN
                         PaintOperations.dbo.PAINT_LOG_DATA ON (PaintOperations.dbo.PAINT_LOG_WO.PaintLog = PaintOperations.dbo.PAINT_LOG_DATA.ROWID)
                         LEFT JOIN
                         FinishInspection.dbo.FinishInspection ON (LIVE.dbo.WORK_ORDER.BASE_ID = FinishInspection.dbo.FinishInspection.BASE_ID) AND (LIVE.dbo.WORK_ORDER.LOT_ID = FinishInspection.dbo.FinishInspection.LOT_ID)
                         AND (LIVE.dbo.WORK_ORDER.SPLIT_ID = FinishInspection.dbo.FinishInspection.SPLIT_ID) AND (LIVE.dbo.WORK_ORDER.SUB_ID = FinishInspection.dbo.FinishInspection.SUB_ID)
 AND (PaintOperations.dbo.PAINT_LOG_DATA.PrimeOrTopCoat = FinishInspection.dbo.FinishInspection.PrimeOrTopCoat)
WHERE        (LIVE.dbo.WORK_ORDER.BASE_ID = @Base) AND (WORK_ORDER.LOT_ID = @Lot) AND (WORK_ORDER.SPLIT_ID = @Split) AND (WORK_ORDER.SUB_ID = @Sub)

```