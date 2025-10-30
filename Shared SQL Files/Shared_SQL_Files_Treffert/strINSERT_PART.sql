USE [LIVE]
GO

/****** Object:  Trigger [dbo].[strINSERT_PART]    Script Date: 8/29/2018 10:33:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author: Eric Shafer
-- Create date: 8/29/201
-- Description: Trigger to validate and control entries on Part table.
-- =============================================
ALTER TRIGGER [dbo].[strINSERT_PART] 
   ON  [dbo].[PART] 
   AFTER INSERT
AS 
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;

    -- Insert statements for trigger here
       DECLARE @HasError BIT = 0
              , @ErrorMsg NVARCHAR(MAX) = ''
                 IF EXISTS( 
                                SELECT 1 FROM INSERTED i 
                                WHERE i.ID collate SQL_Latin1_General_CP1_CS_AS 
                                      <> UPPER(i.ID) collate SQL_Latin1_General_CP1_CS_AS
                                )
                BEGIN
                                  SET @HasError = 1
                                  SET @ErrorMsg = 'Lower case characters are not permitted in the Part ID; '

                END
                IF NOT EXISTS( 
                                SELECT 1 FROM INSERTED I
                                INNER JOIN LIVESUPPLEMENTAL.dbo.Valid_Planner_User_id VP
                                ON I.PLANNER_USER_ID = VP.PLANNER_USER_ID
                                )
                BEGIN
                                  SET @HasError = 1
                                  SET @ErrorMsg = ISNULL(@ErrorMsg, '') + ' Invalid PLANNER_USER_ID'
                END

                IF @HasError = 1
                BEGIN
                                  ROLLBACK TRAN
                                  RAISERROR(@ErrorMsg, 16, -1)
                END

END

GO
