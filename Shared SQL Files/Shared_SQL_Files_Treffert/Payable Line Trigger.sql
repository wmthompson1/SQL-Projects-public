USE [LIVE]
GO

/****** Object:  Trigger [dbo].[strINSERT_PAYABLE_LINE]    Script Date: 5/13/2021 10:21:17 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE TRIGGER [dbo].[strINSERT_PAYABLE_LINE] ON [dbo].[PAYABLE_LINE]   
FOR INSERT AS
/*--************************
Written by Marc Pruett, LM Consulting Services.  425-971-9258
Written 1/7/2021
Trigger to determine if A) is for outside service and if so B) has the subsequent inspection operation been completed.  
If inspection operation is not complete, it will not allow save
--************************/
DECLARE 
	@nRcd INT,
	@MSG VARCHAR(250),--used for throwing errors only
	@ServTx INT,
	@VoucherID NVARCHAR(15), 
	@LnQty DECIMAL(14,4),
	@Reference NVARCHAR(250)

BEGIN  
	SELECT @nRcd = 0  
	SET NOCOUNT ON  
	DECLARE [scInsert] CURSOR LOCAL FOR SELECT I.VOUCHER_ID, ISNULL(RL.SERV_TRANS_ID,0), I.QTY, I.REFERENCE
	FROM INSERTED I LEFT JOIN RECEIVER_LINE RL (NOLOCK) ON I.RECEIVER_ID = RL.RECEIVER_ID AND I.RECEIVER_LINE_NO = RL.LINE_NO 

	OPEN [scInsert]

	FETCH [scInsert] INTO @VoucherID, @ServTx, @LnQty, @Reference

	--If Service
	IF @ServTx != 0
	BEGIN
		DECLARE @NextResourceID NVARCHAR(15)
		DECLARE @NextResourceDesc NVARCHAR(40)
		DECLARE @NextResourceStatus NCHAR(1)
		DECLARE @JobInfo NVARCHAR(40)
		DECLARE @OpInfo NVARCHAR(20)
		DECLARE @OpEndQty DECIMAL(14,4)
		DECLARE @OpCompletedQty DECIMAL(14,4)
		DECLARE [scInsFetchNext] CURSOR LOCAL FOR SELECT TOP 1 O.RESOURCE_ID, SHOP.DESCRIPTION, O.STATUS, O.COMPLETED_QTY, O.CALC_END_QTY, 
												  O.WORKORDER_BASE_ID + '/' + O.WORKORDER_LOT_ID + CASE WHEN O.WORKORDER_SPLIT_ID = '0' THEN '' ELSE ' (Split' + O.WORKORDER_SPLIT_ID + ')' END,
												  'Sub:' + CAST(O.WORKORDER_SUB_ID AS VARCHAR) + ',Op:' + CAST(O.SEQUENCE_NO AS VARCHAR)
												  FROM SERVICE_RECEIPT SR (NOLOCK)
												  JOIN OPERATION O (NOLOCK) ON SR.WORKORDER_BASE_ID = O.WORKORDER_BASE_ID 
													AND SR.WORKORDER_LOT_ID = O.WORKORDER_LOT_ID 
													AND SR.WORKORDER_SPLIT_ID = O.WORKORDER_SPLIT_ID
													AND SR.WORKORDER_SUB_ID = O.WORKORDER_SUB_ID 
													AND O.WORKORDER_TYPE = 'W' AND CHARINDEX('REC',O.RESOURCE_ID)=0
													AND O.SEQUENCE_NO > SR.OPERATION_SEQ_NO 
												  JOIN SHOP_RESOURCE SHOP (NOLOCK) ON O.RESOURCE_ID = SHOP.ID 
												  WHERE SR.TRANSACTION_ID = @ServTx
												  ORDER BY O.SEQUENCE_NO 
		OPEN [scInsFetchNext]
		FETCH [scInsFetchNext] INTO @NextResourceID, @NextResourceDesc, @NextResourceStatus, @OpCompletedQty, @OpEndQty, @JobInfo, @OpInfo

		IF CHARINDEX('INSP',@NextResourceDesc) > 0 AND @OpCompletedQty < @OpEndQty
		BEGIN
			DECLARE @PriorPayQty DECIMAL(14,4)
			DECLARE [scPayInsp] CURSOR LOCAL FOR SELECT ISNULL(SUM(PL.QTY),0)
													FROM PAYABLE_LINE PL JOIN PAYABLE P ON PL.VOUCHER_ID = P.VOUCHER_ID AND P.PAY_STATUS != 'X'
													JOIN RECEIVER_LINE RL ON PL.RECEIVER_ID = RL.RECEIVER_ID AND PL.RECEIVER_LINE_NO = RL.LINE_NO 
													JOIN SERVICE_RECEIPT SR ON RL.SERV_TRANS_ID = SR.TRANSACTION_ID
													WHERE SR.WORKORDER_BASE_ID + '/' + SR.WORKORDER_LOT_ID + CASE WHEN SR.WORKORDER_SPLIT_ID = '0' THEN '' ELSE ' (Split' + SR.WORKORDER_SPLIT_ID + ')' END = @JobInfo
													AND 'Sub:' + CAST(SR.WORKORDER_SUB_ID AS VARCHAR) + ',Op:' + CAST(OPERATION_SEQ_NO AS VARCHAR) = @OpINfo
													AND PL.VOUCHER_ID != @VoucherID
													--exclude add on charges to inspection op PO's
													AND CHARINDEX('FEE',PL.REFERENCE) = 0 
													AND CHARINDEX('SURCHARGE',PL.REFERENCE) = 0 
													AND CHARINDEX('RECURRING',PL.REFERENCE) = 0 
													AND CHARINDEX('NRE',PL.REFERENCE) = 0 
													AND CHARINDEX('EXPEDITE',PL.REFERENCE) = 0 
													AND CHARINDEX('FREIGHT',PL.REFERENCE) = 0 
													AND CHARINDEX('SETUP',PL.REFERENCE) = 0 
													AND CHARINDEX('SET-UP',PL.REFERENCE) = 0 
													AND CHARINDEX('SET UP',PL.REFERENCE) = 0 

			OPEN [scPayInsp]
			FETCH [scPayInsp] INTO @PriorPayQty
			--Check threshold (Qty Being applied + prior AP Qty (excluding misc charges) <= inspection op completed quantity)
			IF (@PriorPayQty + @LnQty) > @OpCompletedQty
				AND CHARINDEX('FEE',@Reference) = 0 
				AND CHARINDEX('SURCHARGE',@Reference) = 0 
				AND CHARINDEX('RECURRING',@Reference) = 0 
				AND CHARINDEX('NRE',@Reference) = 0 
				AND CHARINDEX('EXPEDITE',@Reference) = 0 
				AND CHARINDEX('FREIGHT',@Reference) = 0 
				AND CHARINDEX('SETUP',@Reference) = 0 
				AND CHARINDEX('SET-UP',@Reference) = 0 
				AND CHARINDEX('SET UP',@Reference) = 0
			BEGIN 
				SELECT @nRcd = 1001
				SELECT @MSG = 'Receipt is for outside service and the subsequent inspection operation (' + @OpInfo + ') on workorder ' + @JobInfo + ' is not complete.'
				GOTO STOPALL
			END
			DEALLOCATE [scPayInsp]

		END
		DEALLOCATE [scInsFetchNext]
	END

	STOPALL:  
	IF (@nRcd <> 0 Or @@ERROR <> 0) RAISERROR('Error - %s.' , 16, 1, @MSG)  
	IF (@nRcd <> 0 Or @@ERROR <> 0) ROLLBACK TRANSACTION  

	DEALLOCATE [scInsert]
END


GO

ALTER TABLE [dbo].[PAYABLE_LINE] ENABLE TRIGGER [strINSERT_PAYABLE_LINE]
GO


