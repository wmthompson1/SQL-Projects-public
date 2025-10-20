SELECT
       Customer , 
       PartNumber, 
       PurchaseOrder , 
       nc.RejectTag , 
       ReceivedQTY , 
       RejectedQTY, 
       --Nonconformance , 
       IntDate , 
       DescriptionNonconformance , 
       DispositionDescription , 
       CorrectiveAction , 
       CustomerNCR , 
       Initiator , 
       WorkOrder , 
       Operation , 
       NonconformanceSite , 
       DetectionSite , 
       --CustomerGroup , 
       RootCause , 
      ph.photo
  FROM tblNonconformances NC
    left outer join  photo ph
    on nc.RejectTag = ph.RejectTag
  WHERE (IntDate >= @datestart
    AND IntDate <= @dateend
    AND nonconformanceSite like @NonconformanceSite)
     OR (IntDate >= @datestart
    AND IntDate <= @dateend
    AND DetectionSite like @detectionsite)
     OR (IntDate >= @datestart
    AND IntDate <= @dateend
    AND Initiator like @initiator)
     OR (IntDate >= @datestart
    AND IntDate <= @dateend
    AND PartNumber like @part)
     OR (IntDate >= @datestart
    AND IntDate <= @dateend
    AND PurchaseOrder like @po)
     OR (IntDate >= @datestart
    AND IntDate <= @dateend
    AND nc.RejectTag like @rejecttag)
     OR (IntDate >= @datestart
    AND IntDate <= @dateend
    AND WorkOrder like @wo)
     OR (IntDate >= @datestart
    AND IntDate <= @dateend
    AND CustomerNCR like @crt)
  ORDER BY
           Customer;
