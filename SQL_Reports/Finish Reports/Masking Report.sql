SELECT
  PlugWorkOrders.ROWID AS [PlugWorkOrders ROWID]
  ,PlugWorkOrders.WorkOrder AS [PlugWorkOrders WorkOrder]
  ,PlugWorkOrders.DateTimeTaken AS [PlugWorkOrders DateTimeTaken]
  ,PlugWorkOrders.Initiator AS [PlugWorkOrders Initiator]
  ,PlugWorkOrders.Lot AS [PlugWorkOrders Lot]
  ,PlugWorkOrders.Split AS [PlugWorkOrders Split]
  ,PlugWorkOrders.Opp AS [PlugWorkOrders Opp]
  ,PlugWorkOrders.PartNumber AS [PlugWorkOrders PartNumber]
  ,PlugWorkOrders.Plug1
  ,PlugWorkOrders.Plug2
  ,PlugWorkOrders.Plug25
  ,PlugWorkOrders.Plug3
  ,PlugWorkOrders.Plug4
  ,PlugWorkOrders.Plug5
  ,PlugWorkOrders.Plug6
  ,PlugWorkOrders.Plug7
  ,PlugWorkOrders.Plug8
  ,PlugWorkOrders.Plug9
  ,PlugWorkOrders.Plug10
  ,PlugWorkOrders.Plug11
  ,PlugWorkOrders.Plug12
  ,PHOTO.ROWID AS [PHOTO ROWID]
  ,PHOTO.WorkOrder AS [PHOTO WorkOrder]
  ,PHOTO.PHOTO
  ,PHOTO.DateTimeTaken AS [PHOTO DateTimeTaken]
  ,PHOTO.Initiator AS [PHOTO Initiator]
  ,PHOTO.Lot AS [PHOTO Lot]
  ,PHOTO.Split AS [PHOTO Split]
  ,PHOTO.Opp AS [PHOTO Opp]
  ,PHOTO.PartNumber AS [PHOTO PartNumber]

FROM
  PlugWorkOrders
  INNER JOIN PHOTO
    ON PlugWorkOrders.WorkOrder = PHOTO.WorkOrder AND PlugWorkOrders.Lot = PHOTO.Lot AND PlugWorkOrders.Split = PHOTO.Split AND PlugWorkOrders.Opp = PHOTO.Opp
WHERE
  PlugWorkOrders.WorkOrder = @WorkOrder
  AND PlugWorkOrders.Lot = @Lot
  AND PlugWorkOrders.Split = @Split
  AND PlugWorkOrders.Opp = @Opp
