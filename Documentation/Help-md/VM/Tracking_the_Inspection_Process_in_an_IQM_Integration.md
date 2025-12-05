Tracking the Inspection Process in an IQM Integration




# Tracking the Inspection Process in an IQM Integration

If you are integrated to Infor Quality Management, you can track
the status of an inspection receipt. As a lot moves through the inspection
process in IQM, the status of the receiver in the VISUAL Receiving
Inspection window is updated. To review this information:

1. In VISUAL, select Purchasing, Receiving Inspection.
2. Review the information
   in these fields:

Insp Order ID
The lot system ID of the IQM lot associated with the receipt is
displayed. This ID is generated after the lot is processed in IQM
ERP Inspection Order Processing.

Insp Order Status
The current status of the inspection order is displayed. These statuses
are used:

Pending An InspectionOrder
BOD has been sent from VISUAL to request the inspection, but IQM has
not yet acknowledged receipt of the BOD.

Open The InspectionOrder
BOD has been received in IQM and an acknowledgement of the receipt
has been sent to VISUAL.

Processed The receipt
has been processed in IQM ERP Inspection Order Processing, and a system
lot ID has been assigned.

Complete The data
collection for the lot has been completed, but the data collection
record for the lot has not been closed.

Closed The data
collection record is closed, and the lot has been moved to Lot History
in IQM.

Insp Order Received Quantity
The total quantity of part received into inspection is displayed.

Insp Order Accepted Quantity
The total quantity that passed inspection is displayed.

Insp Order Rejected Quantity
The total quantity that failed inspection is displayed.